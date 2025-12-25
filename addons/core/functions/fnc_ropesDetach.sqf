#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ACE Action Statement to detatch the ropes from cargo.
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cargo, player] call asr_core_fnc_attachRopes
 *
 * Public: No
*/

/*
 * Author: OverlordZorn
 * #include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Attach ropes to cargo.
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call asr_core_fnc_detachRopes
 *
 * Public: No
*/

params ["_cargo", "_player", "_params"];
_params params  [""];


///////////////////////
// Get Variables
///////////////////////

private _airframe = ropeAttachedTo _cargo;

private _hooks = [_airframe, true] call FUNC(getHooks);

// Get _hookID
private _hookID = "";
private _hookMap = "";
{
    if (_y get "cargo" isEqualTo _cargo) exitWith {
        _hookID = _x;
        _hookMap = _y;
    };
} forEach _hooks;

if (_hookID isEqualTo "") exitWith {};

private _ropes = _hookMap get "ropes";

///////////////////////
// Detach Ropes from Cargo
///////////////////////

{_cargo ropeDetach _x} forEach _ropes;

_hookMap set ["cargo", objNull];

///////////////////////
// Create RopeHook
///////////////////////

_cargo call BIS_fnc_boundingBoxDimensions params ["", "", "_modelHeight"];

private _hookPos = _cargo modelToWorld [0,0, _modelHeight];
// Create hook 1 meter below hook or at surface if hook would be underground.
_hookPos set [ 2, _hookPos # 2 - 1 max 0 ];

private _ropeHelper = [
    _hookPos,
    _ropes,
    _hookID,
    _airframe getVariable QGVAR(hooksData) get "hooks" get _hookID get "hookOffset"
] call FUNC(createRopeHelper);


///////////////////////
// Store Data
///////////////////////

_airframe setVariable [ _hookID, _hookMap, true ];

///////////////////////
// Put Hook in Players Hand
///////////////////////

[_ropeHelper, _player] call FUNC(ropesPickup);


///////////////////////
// API
///////////////////////

[QGVAR(API_ropeDetached), [_airframe, _hookID, _cargo]] call CBA_fnc_localEvent;

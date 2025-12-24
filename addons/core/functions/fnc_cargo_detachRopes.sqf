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

// Get _hookClassname
private _hookClassname = "";
private _hookMap = "";
{
    if (_y get "cargo" isEqualTo _cargo) exitWith {
        _hookClassname = _x;
        _hookMap = _y;
    };
} forEach _hooks;

if (_hookClassname isEqualTo "") exitWith {};

private _ropes = _hookMap get "ropes";

///////////////////////
// Detach Ropes from Cargo
///////////////////////

{_cargo ropeDetach _x} forEach _ropes;

_hookMap set ["cargo", objNull];

///////////////////////
// Create Helper Object
///////////////////////

_cargo call BIS_fnc_boundingBoxDimensions params ["", "", "_modelHeight"];

private _helperPos = _cargo modelToWorld [0,0, _modelHeight];
// Create hook 1 meter below hook or at surface if hook would be underground.
_helperPos set [ 2, _helperPos # 2 - 1 max 0 ];

// createVehicle [type, position, markers, placement, special]
private _ropeHelper = createVehicle [QPVAR(ropeHelper), _helperPos, [], 0, "CAN_COLLIDE"];


///////////////////////
// Attach Ropes To New Hook
///////////////////////

{
    private _rope = _x;
    [
        _ropeHelper,
        [0,0,0],
        [
            [  0,  1, -1 ],
            [  1,  0, -1 ],
            [  0, -1, -1 ],
            [ -1,  0, -1 ]
        ] select _forEachIndex
    ] ropeAttachTo _rope;

} forEach _ropes;


///////////////////////
// Store Data
///////////////////////

_airframe setVariable [ _hookClassname, _hookMap, true ];

_ropeHelper setVariable [ QGVAR(hook), _hookClassname, true ];

_ropeHelper setVariable [
    QGVAR(hookOffset),
    _airframe getVariable QGVAR(hooksData) get "hooks" get _hookClassname get "hookOffset",
    true
];

///////////////////////
// Put Hook in Players Hand
///////////////////////

[_ropeHelper, _player] call FUNC(pickupRopes);


///////////////////////
// API
///////////////////////

[QGVAR(API_ropeDetached), [_airframe, _hookClassname, _cargo]] call CBA_fnc_localEvent;

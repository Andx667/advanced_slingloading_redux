#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Pick up rope at the given index.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 2: Rope Index (optional, default: 0) <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call aslr_core_fnc_pickupRopes
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_ropeIndex", 0]];

if (!local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(pickupRopes)], _vehicle] call CBA_fnc_targetEvent; };

[ _vehicle, _ropeIndex ] call FUNC(getRopesAndCargo) params ["_existingRopes", "_existingCargo"];

if (!isNull _existingCargo) then {

    { _existingCargo ropeDetach _x; } forEach _existingRopes;

    private _allCargo = _vehicle getVariable [QGVAR(Cargo), []];
    _allCargo set [ _ropeIndex, objNull ];
    _vehicle setVariable [QGVAR(Cargo), _allCargo, true];
};

private _helper = QGVAR(rope_helper) createVehicle position _player;

{
    [_helper, [0, 0, 0], [0,0,-1]] ropeAttachTo _x;
    _helper attachTo [_player, [-0.1, 0.1, 0.15], "Pelvis"];
} forEach _existingRopes;

[QGVAR(EH_hideObjectGlobal), _helper] call CBA_fnc_serverEvent;

_player setVariable [QGVAR(Ropes_Vehicle), [_vehicle, _ropeIndex], true];
_player setVariable [QGVAR(Ropes_Pick_Up_Helper), _helper, true];

[QGVAR(API_ropePickedup), [_vehicle, _player, _ropeIndex]] call CBA_fnc_localEvent;

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Drops a rope.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 2: Rope Index (optional, default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call aslr_core_fnc_dropRopes
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_ropeIndex", 0]];

if !(local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(dropRopes)], _vehicle] call CBA_fnc_targetEvent; };

private _helper = _player getVariable [QGVAR(Ropes_Pick_Up_Helper), objNull];

if !(isNull _helper) then {
    { _helper ropeDetach _x; } forEach ([_vehicle, _ropeIndex] call FUNC(getRopes));
    detach _helper;
    deleteVehicle _helper;
};

_player setVariable [QGVAR(Ropes_Vehicle), nil, true];
_player setVariable [QGVAR(Ropes_Pick_Up_Helper), nil, true];

[QGVAR(ropeDroppedEvent), [_vehilce, _player, _ropeIndex]] call CBA_fnc_globalEvent;

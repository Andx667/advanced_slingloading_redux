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

params ["_vehicle", "_player", ["_ropesIndex", 0]];

if(local _vehicle) then {
    private ["_helper", "_existingRopes"];

    _helper = (_player getVariable [QGVAR(Ropes_Pick_Up_Helper), objNull]);
    if(!isNull _helper) then {
        _existingRopes = [_vehicle, _ropesIndex] call FUNC(getRopes);
        {
            _helper ropeDetach _x;
        } forEach _existingRopes;
        detach _helper;
        deleteVehicle _helper;
    };
    _player setVariable [QGVAR(Ropes_Vehicle), nil, true];
    _player setVariable [QGVAR(Ropes_Pick_Up_Helper), nil, true];
} else {
    [_this, QFUNC(dropRopes), _vehicle, true] call FUNC(customRemoteExec);
};

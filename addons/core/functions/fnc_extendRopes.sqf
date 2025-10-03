#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Extends the cargo ropes.
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
 * [vehicle, player] call aslr_core_fnc_extendRopes
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_ropeIndex", 0]];

if !(local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(extendRopes)], _vehicle] call CBA_fnc_targetEvent; };

private _existingRopes = [_vehicle,_ropeIndex] call FUNC(getRopes);

if (_existingRopes isNotEqualTo []) then {
    if (ropeLength (_existingRopes select 0) <= 100) then {
        { ropeUnwind [_x, 3, 5, true]; } forEach _existingRopes;
    };
};

[QGVAR(ropeExtentedEvent), ["_vehile", "_player", "_ropeIndex"]] call CBA_fnc_globalEvent;

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the ropes can be shortend
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Ropes can be shortend <BOOLEAN>
 *
 * Example:
 * [vehicle] call aslr_core_fnc_canShortenRopes
 *
 * Public: No
 */

params ["_vehicle"];

private _allCargo = _vehicle getVariable [QGVAR(cargo), []];

{
    if (_x distance _vehicle < 10) exitWith { false; };
} forEach _allCargo;

if (ACE_player distance _vehicle > 10) exitWith { false };

if !([_vehicle] call FUNC(isSupportedVehicle)) exitWith { false };

private _existingRopes = _vehicle getVariable [QGVAR(custom_ropes), []];
if ((count _existingRopes) == 0) exitWith { false };

private _activeRopes = [_vehicle] call FUNC(getActiveRopes);
if ((count _activeRopes) == 0) exitWith { false };

true;

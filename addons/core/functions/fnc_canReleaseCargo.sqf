#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the cargo can be released
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Cargo can be released <BOOLEAN>
 *
 * Example:
 * [vehicle] call aslr_core_fnc_canReleaseCargo
 *
 * Public: No
 */

params ["_vehicle"];

if (ACE_player distance _vehicle > 10) exitWith { false };

if ([_vehicle] call FUNC(isSupportedVehicle)) exitWith { false };

private _existingRopes = _vehicle getVariable [QGVAR(custom_ropes), []];
if ((count _existingRopes) == 0) exitWith { false };

private _activeRopes = [_vehicle] call FUNC(getActiveRopesWithCargo);
if ((count _activeRopes) == 0) exitWith { false };

true;

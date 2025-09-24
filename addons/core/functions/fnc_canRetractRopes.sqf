#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the ropes can be retracted
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Ropes can be retraced <BOOLEAN>
 *
 * Example:
 * [vehicle] call aslr_core_fnc_canRetractRopes
 *
 * Public: No
 */

params ["_vehicle"];

private ["_existingRopes","_activeRopes"];

if(ACE_player distance _vehicle > 30) exitWith { false };

if!([_vehicle] call FUNC(isSupportedVehicle)) exitWith { false };

_existingRopes = _vehicle getVariable [QGVAR(custom_ropes), []];
if((count _existingRopes) == 0) exitWith { false };

_activeRopes = [_vehicle] call FUNC(getActiveRopesWithoutCargo);
if((count _activeRopes) == 0) exitWith { false };

true;

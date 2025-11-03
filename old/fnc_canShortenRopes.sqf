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
 * [vehicle] call asr_core_fnc_canShortenRopes
 *
 * Public: No
 */

params ["_vehicle", ["_ropeIndex", 0, [0]]];

private _cargo = [_vehicle, _ropeIndex] call FUNC(getCargo);

if (_cargo distance _vehicle < 10) exitWith { false; };

if (ACE_player distance _vehicle > 10) exitWith { false };

if !([_vehicle] call FUNC(isSupportedVehicle)) exitWith { false };

private _existingRopes = _vehicle getVariable [QGVAR(custom_ropes), []];
if ((count _existingRopes) == 0) exitWith { false };

private _activeRopes = [_vehicle] call FUNC(getActiveRopes);
if ((count _activeRopes) == 0) exitWith { false };

true

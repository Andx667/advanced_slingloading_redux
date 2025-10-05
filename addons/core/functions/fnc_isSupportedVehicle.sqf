#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the vehicles is allowed to sling load.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Is Supported <BOOLEAN>
 *
 * Return Value:
 * True if the Vehicle is supported, False otherwise <BOOLEAN>
 *
 * Example:
 * [params] call aslr_core_fnc_isSupportedVehicle
 *
 * Public: No
 */

// ToDo: Consider reworking this?

params [ ["_vehicle", objNull, [objNull]] ];

if (isNull _vehicle) exitWith { false };

missionNamespace getVariable [QGVAR(Supported_Vehicles_OVERRIDE), GVAR(Supported_Vehicles)] findIf { _vehicle isKindOf _x } != -1

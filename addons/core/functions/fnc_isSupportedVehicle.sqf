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

params ["_vehicle", "_isSupported"];

_isSupported = false;
if (not isNull _vehicle) then { //ToDo Check the not
    {
        if (_vehicle isKindOf _x) then {
            _isSupported = true;
        };
    } forEach (missionNamespace getVariable [QGVAR(Supported_Vehicles_OVERRIDE), GVAR(Supported_Vehicles)]);
};

_isSupported;

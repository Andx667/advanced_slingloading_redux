#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_isSupportedVehicle
 *
 * Public: No
 */

params ["_vehicle","_isSupported"];

_isSupported = false;
if(not isNull _vehicle) then {
    {
        if(_vehicle isKindOf _x) then {
            _isSupported = true;
        };
    } forEach (missionNamespace getVariable [QGVAR(Supported_Vehicles_OVERRIDE), GVAR(Supported_Vehicles)]);
};

_isSupported;

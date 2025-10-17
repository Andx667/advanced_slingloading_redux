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

params [ ["_vehicle", objNull, [objNull]] ];

if (isNull _vehicle) exitWith { false };

switch (SET(supportedVehicles)) do {
    // VTOL + Heli vehicles are supported
    case 0: { _vehicle isKindOf "Helicopter" ||  { _vehicle isKindOf "VTOL_Base_F" } }; 
     // Only Heli vehicles are supported
    case 1: { _vehicle isKindOf "Helicopter" };
    // Only VTOL vehicles are supported
    case 2: { _vehicle isKindOf "VTOL_Base_F" }; 
    default { false };
} // Return


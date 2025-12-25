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
 * [params] call asr_core_fnc_isSupportedVehicle
 *
 * Public: No
 */

// ToDo: Consider reworking this?

params [ ["_airframe", objNull, [objNull]] ];

if (isNull _airframe) exitWith { false };

switch (SET(supportedVehicles)) do {
    // VTOL + Heli vehicles are supported
    case 0: { _airframe isKindOf "Helicopter" ||  { _airframe isKindOf "VTOL_Base_F" } };
     // Only Heli vehicles are supported
    case 1: { _airframe isKindOf "Helicopter" };
    // Only VTOL vehicles are supported
    case 2: { _airframe isKindOf "VTOL_Base_F" };
    default { false };
} // Return

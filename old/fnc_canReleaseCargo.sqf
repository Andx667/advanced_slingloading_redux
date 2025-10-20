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

ACE_player distance _vehicle < 10
&&
{
    [_vehicle] call FUNC(isSupportedVehicle)
    &&
    {
        _vehicle getVariable [QGVAR(custom_ropes), []] isNotEqualTo []
        &&
        {
            [_vehicle] call FUNC(getActiveRopesWithCargo) isNotEqualTo []
        }
    }
}

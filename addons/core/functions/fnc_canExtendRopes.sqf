#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the ropes can be extended.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Ropes can be extended <BOOLEAN>
 *
 * Example:
 * [vehicle] call aslr_core_fnc_canExtendRopes
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
            [_vehicle] call FUNC(getActiveRopes) isNotEqualTo []
        }
    }
}

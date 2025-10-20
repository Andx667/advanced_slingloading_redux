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

params [ ["_vehicle", objNull, [objNull]] ];

ACE_player distance _vehicle < 10
&&
{
    [_vehicle] call FUNC(isSupportedVehicle)
    &&
    {
        _vehicle getVariable [QGVAR(custom_ropes), []] isNotEqualTo []
        &&
        {
            [_vehicle] call FUNC(getActiveRopesWithoutCargo) isNotEqualTo []
        }
    }
}

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Ropes can be deployed <BOOLEAN>
 *
 * Example:
 * [params] call aslr_core_fnc_canDeployRopes
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
        ACE_player getVariable [QGVAR(ropes_vehicle), []] isEqualTo []
        &&
        {
            private _existingRopes = count (_vehicle getVariable [QGVAR(custom_ropes), []]);
            _existingRopes isEqualTo 0
            ||
            {
                _existingRopes isNotEqualTo count ([_vehicle] call FUNC(getActiveRopes))
            }
        }
    }
}

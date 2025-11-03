#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the ropes can be picked up
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Ropes can be picked up <BOOLEAN>
 *
 * Example:
 * call asr_core_fnc_canPickupRopes
 *
 * Public: No
 */

missionNamespace getVariable [QGVAR(nearby_vehicles), []] isNotEqualTo []
&&
{
    ACE_player isNil QGVAR(ropes_vehicle)
    &&
    {
        isNull objectParent ACE_player
    }
}

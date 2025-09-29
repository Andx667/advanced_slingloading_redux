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
 * call aslr_core_fnc_canPickupRopes
 *
 * Public: No
 */

 ACE_player getVariable [QGVAR(ropes_vehicle), []] isEqualTo []
 &&
{
    missionNamespace getVariable [QGVAR(nearby_vehicles), []] isNotEqualTo []
    &&
    {
        isNull objectParent ACE_player
    }
}

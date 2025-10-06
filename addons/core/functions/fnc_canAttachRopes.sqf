#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the ropes can be attached to the cargo.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Cargo <OBJECT>
 *
 * Return Value:
 * Ropes can be attached <BOOLEAN>
 *
 * Example:
 * [vehicle, cargo] call aslr_core_fnc_canAttachRopes
 *
 * Public: No
 */

params ["_vehicle", "_cargo"];

!isNull _vehicle
&&
{
    !isNull _cargo
    &&
    {
        [_vehicle, _cargo] call FUNC(isSupportedCargo)
        &&
        {
            isNull objectParent ACE_player  // player is not inside a vehicle
            &&
            {
                ACE_player distance _cargo < 10
                &&
                {
                    _vehicle != _cargo
                    &&
                    {
                        isNull ropeAttachedTo cursorObject; //maybe _cargo?
                    }
                }
            }
        }
    }
}

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo.
 *
 * Arguments:
 * None.
 *
 * Return Value:
 * None.
 *
 * Example:
 * call asr_core_fnc_pickupRopesAction
 *
 * Public: No
 */


if !( call FUNC(canPickupRopes)) exitWith {};

call FUNC(getClosestRope) params ["_vehicle", "_ropeIndex"];

if (isNull _vehicle) exitWith {};


if (!SET(allow_locked) && { locked _vehicle > 1 } ) exitWith {
    [LLSTRING(cannot_pickup_locked_vehicle), false] call FUNC(customHint);
};

[_vehicle, ACE_player, _ropeIndex] call FUNC(pickupRopes);

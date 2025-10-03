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
 * call aslr_core_fnc_pickupRopesAction
 *
 * Public: No
 */


if !( call FUNC(canPickupRopes)) exitWith {};

call FUNC(getClosestRope) params ["_vehicle", "_ropeIndex"];

if (isNull _vehicle) exitWith {};

[_vehicle, ACE_player, _ropeIndex] call FUNC(pickupRopes);

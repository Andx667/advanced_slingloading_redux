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


private _nearbyVehicles = missionNamespace getVariable [QGVAR(nearby_vehicles), []];

if !( call FUNC(canPickupRopes)) exitWith {};

private _closestRope = call FUNC(getClosestRope);

if !(isNull (_closestRope select 0)) exitWith {};

if !(missionNamespace getVariable [QGVAR(LOCKED_VEHICLES_ENABLED), false]) exitWith {};

if (locked (_closestRope select 0) > 1) exitWith { [LLSTRING(cannot_pickup_locked_vehicle), false] call FUNC(customHint); };

[(_closestRope select 0), ACE_player, (_closestRope select 1)] call FUNC(pickupRopes);

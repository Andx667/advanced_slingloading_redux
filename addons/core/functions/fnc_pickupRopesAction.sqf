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


private _canNotUseLockedVehicle = (! ( missionNamespace getVariable [QGVAR(LOCKED_VEHICLES_ENABLED), false] ) && { locked _vehicle > 1 } );

if _canNotUseLockedVehicle exitWith { [LLSTRING(cannot_pickup_locked_vehicle), false] call FUNC(customHint); };

[_vehicle, ACE_player, _ropeIndex] call FUNC(pickupRopes);

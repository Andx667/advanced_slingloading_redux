#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the action should be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call asr_core_fnc_attachRopesActionCheck
 *
 * Public: No
 */

private _vehicleWithIndex = ACE_player getVariable [QGVAR(ropes_vehicle), [objNull, 0]];
private _cargo = cursorTarget;
[_vehicleWithIndex select 0, _cargo] call FUNC(canAttachRopes);

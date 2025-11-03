#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call asr_core_fnc_dropRopesAction
 *
 * Public: No
 */

if !(call FUNC(canDropRopes)) exitWith {};

private _vehicleAndIndex = ACE_player getVariable [QGVAR(Ropes_Vehicle), []];

if (count _vehicleAndIndex == 2) then { [_vehicleAndIndex select 0, ACE_player, _vehicleAndIndex select 1] call FUNC(dropRopes); };

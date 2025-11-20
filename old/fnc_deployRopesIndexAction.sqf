#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo
 *
 * Arguments:
 * 0: Rope Index <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call asr_core_fnc_deployRopesIndexAction
 *
 * Public: No
 */

params ["_ropeIndex"];

private _vehicle = ACE_player getVariable [QGVAR(Deploy_Ropes_Index_Vehicle), objNull];

if (_ropeIndex >= 0 && {!isNull _vehicle && { [_vehicle] call FUNC(canDeployRopes) } } ) then { [_vehicle, ACE_player, _ropeIndex] call FUNC(deployRopesIndex); };

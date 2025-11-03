#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * toDo
 *
 * Arguments:
 * 0: Rope Index <INTEGER>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call asr_core_fnc_extendRopesIndexAction
 *
 * Public: No
 */

params ["_ropeIndex"];

private _vehicle = ACE_player getVariable [QGVAR(Extend_Index_Vehicle), objNull];

if (_ropeIndex >= 0 && { !isNull _vehicle && { [_vehicle] call FUNC(canExtendRopes) } }) then { [_vehicle, ACE_player, _ropeIndex] call FUNC(extendRopes); };

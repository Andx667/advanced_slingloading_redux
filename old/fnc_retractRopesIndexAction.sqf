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
 * [1] call asr_core_fnc_retractRopesIndexAction
 *
 * Public: No
 */

params ["_ropeIndex"];

private _vehicle = ACE_player getVariable [QGVAR(Retract_Ropes_Index_Vehicle), objNull];

if ( _ropeIndex >= 0 && { !isNull _vehicle && { [_vehicle] call FUNC(canRetractRopes) } } ) then { [_vehicle, ACE_player, _ropeIndex] call FUNC(retractRopes); };

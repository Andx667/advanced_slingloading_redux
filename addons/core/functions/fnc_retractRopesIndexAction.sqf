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
 * [1] call aslr_core_fnc_retractRopesIndexAction
 *
 * Public: No
 */

params ["_ropesIndex"];

private ["_vehicle"];

_vehicle = ACE_player getVariable [QGVAR(Retract_Ropes_Index_Vehicle), objNull];
if(_ropesIndex >= 0 && !isNull _vehicle && [_vehicle] call FUNC(canRetractRopes)) then {
    [_vehicle, ACE_player, _ropesIndex] call FUNC(retractRopes);
};

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
 * [1] call aslr_core_fnc_deployRopesIndexAction
 *
 * Public: No
 */

params ["_ropesIndex"];

private ["_vehicle"];

_vehicle = ACE_player getVariable [QGVAR(Deploy_Ropes_Index_Vehicle), objNull];
if(_ropesIndex >= 0 && !isNull _vehicle && [_vehicle] call FUNC(canDeployRopes)) then {
    [_vehicle, ACE_player, _ropesIndex] call FUNC(deployRopesIndex);
};

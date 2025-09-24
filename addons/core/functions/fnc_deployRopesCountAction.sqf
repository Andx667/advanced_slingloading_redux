#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo
 *
 * Arguments:
 * 0: Number of ropes to deploy <INTEGER> //ToDo Check
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_deployRopesCountAction
 *
 * Public: No
 */

params ["_count"];

private ["_vehicle", "_canDeployRopes"];

_vehicle = ACE_player getVariable [QGVAR(Deploy_Count_Vehicle), objNull];
if(_count > 0 && !isNull _vehicle && [_vehicle] call FUNC(canDeployRopes)) then {
    [_vehicle, ACE_player, _count] call FUNC(deployRopes);
};

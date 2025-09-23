#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_releaseCargoIndexAction
 *
 * Public: No
 */

params ["_ropesIndex"];

private ["_vehicle"];

_vehicle = ACE_player getVariable [QGVAR(Release_Cargo_Index_Vehicle), objNull];
if(_ropesIndex >= 0 && !isNull _vehicle && [_vehicle] call FUNC(canReleaseCargo)) then {
    [_vehicle,ACE_player,_ropesIndex] call FUNC(releaseCargo);
};

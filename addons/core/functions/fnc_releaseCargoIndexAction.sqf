#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Releases Cargo at the given rope index
 *
 * Arguments:
 * 0: Rope Index <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call aslr_core_fnc_releaseCargoIndexAction
 *
 * Public: No
 */

params ["_ropesIndex"];

private ["_vehicle"];

_vehicle = ACE_player getVariable [QGVAR(Release_Cargo_Index_Vehicle), objNull];
if(_ropesIndex >= 0 && !isNull _vehicle && [_vehicle] call FUNC(canReleaseCargo)) then {
    [_vehicle, ACE_player, _ropesIndex] call FUNC(releaseCargo);
};

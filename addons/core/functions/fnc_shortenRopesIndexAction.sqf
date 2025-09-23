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
 * [params] call aslr_core_fnc_shortenRopesIndexAction
 *
 * Public: No
 */

params ["_ropeIndex"];

private ["_vehicle"];

_vehicle = ACE_player getVariable [QGVAR(shorten_Index_Vehicle), objNull];
if(_ropeIndex >= 0 && !isNull _vehicle && [_vehicle] call FUNC(canShortenRopes)) then {
    [_vehicle,ACE_player,_ropeIndex] call FUNC(shortenRopes);
};

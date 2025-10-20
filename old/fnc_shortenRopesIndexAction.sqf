#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Shorten the cargo ropes.
 *
 * Arguments:
 * 0: Rope Index <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call aslr_core_fnc_shortenRopesIndexAction
 *
 * Public: No
 */

params ["_ropeIndex"];

private _vehicle = ACE_player getVariable [QGVAR(shorten_Index_Vehicle), objNull];

if ( _ropeIndex >= 0 && { !isNull _vehicle && { [_vehicle, _ropeIndex] call FUNC(canShortenRopes) } } ) then { [_vehicle, ACE_player, _ropeIndex] call FUNC(shortenRopes); };

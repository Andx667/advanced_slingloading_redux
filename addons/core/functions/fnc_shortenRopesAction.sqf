#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call aslr_core_fnc_shortenRopesAction
 *
 * Public: No
 */


private _vehicle = vehicle ACE_player;

if !([_vehicle] call FUNC(canShortenRopes)) exitWith {};

private _activeRopes = [_vehicle] call FUNC(getActiveRopes);

switch (count _activeRopes) do {
    case 0: { };
    case 1: { [_vehicle, ACE_player, (_activeRopes select 0) select 0] call FUNC(shortenRopes); };
    default {
        ACE_player setVariable [QGVAR(shorten_Index_Vehicle), _vehicle];
        [LLSTRING(shorten_cargo_ropes), QFUNC(shortenRopesIndexAction), _activeRopes] call FUNC(showSelectRopesMenu);
    };
};

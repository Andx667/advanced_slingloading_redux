#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_extendRopesAction
 *
 * Public: No
 */

private _vehicle = vehicle ACE_player;

if !([_vehicle] call FUNC(canExtendRopes)) exitWith {};

private _activeRopes = [_vehicle] call FUNC(getActiveRopes);

switch (count _activeRopes) do {
    case 0: { };
    case 1: {
        [_vehicle, ACE_player, (_activeRopes select 0) select 0] call FUNC(extendRopes);
    };
    default {
        ACE_player setVariable [QGVAR(Extend_Index_Vehicle), _vehicle];
        [LLSTRING(extend_cargo_ropes), QFUNC(extendRopesIndexAction), _activeRopes] call FUNC(showSelectRopesMenu);
    };
};

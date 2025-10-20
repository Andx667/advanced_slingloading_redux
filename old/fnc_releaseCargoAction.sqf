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
 * call aslr_core_fnc_releaseCargoAction
 *
 * Public: No
 */

private _vehicle = vehicle ACE_player;

if !([_vehicle] call FUNC(canReleaseCargo)) exitWith {};

private _activeRopes = [_vehicle] call FUNC(getActiveRopesWithCargo);

switch (count _activeRopes) do {
    case 0: { };
    case 1: { [_vehicle, ACE_player, (_activeRopes select 0) select 0] call FUNC(releaseCargo); };
    default {
        ACE_player setVariable [QGVAR(Release_Cargo_Index_Vehicle), _vehicle];
        [LLSTRING(release_cargo_ropes), QFUNC(releaseCargoIndexAction), _activeRopes, "Cargo"] call FUNC(showSelectRopesMenu);
    };
};

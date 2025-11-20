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
 * call asr_core_fnc_retractRopesAction
 *
 * Public: No
 */


private _vehicle = [vehicle ACE_player, cursorObject] select (isNull objectParent ACE_player);

if !([_vehicle] call FUNC(canRetractRopes)) exitWith {};

private _activeRopes = [_vehicle] call FUNC(getActiveRopesWithoutCargo);

switch (count _activeRopes) do {
    case 0: { };
    case 1: { [_vehicle, ACE_player, (_activeRopes select 0) select 0] call FUNC(retractRopes); };
    default {
        ACE_player setVariable [QGVAR(Retract_Ropes_Index_Vehicle), _vehicle];
        [LLSTRING(retract_cargo_ropes), QFUNC(retractRopesIndexAction), _activeRopes] call FUNC(showSelectRopesMenu);
    };
};

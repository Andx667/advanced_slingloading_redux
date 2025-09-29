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
 * call aslr_core_fnc_deployRopesAction
 *
 * Public: No
 */


private _vehicle = [vehicle ACE_Player, cursorTarget] select isNull objectParent ACE_player;

diag_log format ['[CVO](debug)(fnc_deployRopesAction) _this: %1', _this];

diag_log format ['[CVO](debug)(fnc_deployRopesAction) _vehicle: %1', _vehicle];

if !([_vehicle] call FUNC(canDeployRopes)) exitWith {};

if ( missionNamespace getVariable [QGVAR(LOCKED_VEHICLES_ENABLED),false] && { locked _vehicle > 1 } ) exitWith { [LLSTRING(cannot_deploy_locked_vehicle), false] call FUNC(customHint); };

private _inactiveRopes = [_vehicle] call FUNC(getActiveRopes);


if (_inactiveRopes isNotEqualTo []) exitWith {

    if (count _inactiveRopes > 1) then {
        ACE_player setVariable [QGVAR(Deploy_Ropes_Index_Vehicle), _vehicle];
        [LLSTRING(deploy_cargo_ropes), QFUNC(deployRopesIndexAction), _inactiveRopes] call FUNC(showSelectRopesMenu);
    } else {
        [_vehicle, ACE_player, (_inactiveRopes select 0) select 0] call FUNC(deployRopesIndex);
    };

};


private _slingLoadPoints = [_vehicle] call FUNC(getSlingLoadPoints);

if (count _slingLoadPoints < 2) exitWith { [_vehicle,ACE_player] call FUNC(deployRopes); };

ACE_player setVariable [QGVAR(Deploy_Count_Vehicle), _vehicle];

ASL_Deploy_Ropes_Count_Menu = [
    ["Deploy Ropes", false],
    [LLSTRING(single_cargo), [0], "", -5, [["expression", QUOTE([1] call FUNC(deployRopesCountAction))]], "1", "1"]
];


if ((count _slingLoadPoints) > 1) then {
    ASL_Deploy_Ropes_Count_Menu pushBack [LLSTRING(double_cargo), [0], "", -5, [["expression", QUOTE([2] call FUNC(deployRopesCountAction))]], "1", "1"];
};

if ((count _slingLoadPoints) > 2) then {
    ASL_Deploy_Ropes_Count_Menu pushBack [LLSTRING(triple_cargo), [0], "", -5, [["expression", QUOTE([3] call FUNC(deployRopesCountAction))]], "1", "1"];
};

showCommandingMenu "";
showCommandingMenu "#USER:ASL_Deploy_Ropes_Count_Menu";

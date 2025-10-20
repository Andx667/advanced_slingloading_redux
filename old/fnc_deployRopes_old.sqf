#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Deploy ropes from vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 2: Cargo Count (optional, default: 1) <INTEGER>
 * 3: Rope Length (optional, default: 15) <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call aslr_core_fnc_deployRopes
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_cargoCount", 1]];

if !(local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(deployRopes)], _vehicle] call CBA_fnc_targetEvent; };

private _slingLoadPoints = [_vehicle] call FUNC(getHooksDefault); // investigate
private _existingRopes = _vehicle getVariable [QGVAR(custom_ropes), []];

if (_existingRopes isNotEqualTo []      ) exitWith { [QGVAR(EH_customHint), [LLSTRING(already_deployed),     false], _player] call CBA_fnc_targetEvent; };
if (_slingLoadPoints isEqualTo []       ) exitWith { [QGVAR(EH_customHint), [LLSTRING(doesnt_support),       false], _player] call CBA_fnc_targetEvent; };
if (count _slingLoadPoints < _cargoCount) exitWith { [QGVAR(EH_customHint), [LLSTRING(doenst_support_multi), false], _player] call CBA_fnc_targetEvent; };

private _cargoRopes = [];
private _cargo = [];


for "_i" from 0 to (_cargoCount - 1) do {
    _cargoRopes pushBack [];
    _cargo pushBack objNull;
};

_vehicle setVariable [QGVAR(custom_ropes), _cargoRopes, true];
_vehicle setVariable [QGVAR(cargo), _cargo, true];

for "_i" from 0 to (_cargoCount - 1) do {
    [_vehicle, _player, _i] call FUNC(deployRopesIndex);
};

[QGVAR(API_ropeDeployed), [_vehicle, _player, _cargoCount]] call CBA_fnc_localEvent;

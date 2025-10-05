#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Releases Cargo at the given rope index.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Rope Index (optional, default: 0) <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call aslr_core_fnc_releaseCargo
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_ropeIndex", 0]];

if !(local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(releaseCargo)], _vehicle] call CBA_fnc_targetEvent; };

[_vehicle, _ropeIndex] call FUNC(getRopesAndCargo) params ["_existingRopes", "_existingCargo"];

{ _existingCargo ropeDetach _x; } forEach _existingRopes;

private _allCargo = _vehicle getVariable [QGVAR(Cargo), []];
_allCargo set [_ropeIndex, objNull];
_vehicle setVariable [QGVAR(Cargo), _allCargo, true];
call FUNC(retractRopes);

[QGVAR(API_cargoReleased), [_vehicle, _player, _ropeIndex, _allCargo]] call CBA_fnc_localEvent;

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Pick up rope at the given index.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 2: Rope Index (optional, default: 0) <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call aslr_core_fnc_pickupRopes
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_ropesIndex", 0]];

diag_log format ['[CVO](debug)(fnc_pickupRopes) _vehicle: %1 - _player: %2 - _rpoesIndex: %3', _vehicle , _player ,_rpoesIndex];

if (!local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(pickupRopes)], _vehicle] call CBA_fnc_targetEvent; };


private _existingRopesAndCargo = [_vehicle,_ropesIndex] call FUNC(getRopesAndCargo);

private _existingRopes = _existingRopesAndCargo select 0;
private _existingCargo = _existingRopesAndCargo select 1;


if (!isNull _existingCargo) then {

    { _existingCargo ropeDetach _x; } forEach _existingRopes;

    private _allCargo = _vehicle getVariable [QGVAR(Cargo), []];
    _allCargo set [_ropesIndex,objNull];
    _vehicle setVariable [QGVAR(Cargo), _allCargo, true];

};

private _helper = "Land_Can_V2_F" createVehicle position _player;

{
    [_helper, [0, 0, 0], [0,0,-1]] ropeAttachTo _x;
    _helper attachTo [_player, [-0.1, 0.1, 0.15], "Pelvis"];
} forEach _existingRopes;

hideObject _helper;

[QGVAR(EH_customHideObjectGlobal), [_helper]] call CBA_fnc_serverEvent;

_player setVariable [QGVAR(Ropes_Vehicle), [_vehicle, _ropesIndex], true];
_player setVariable [QGVAR(Ropes_Pick_Up_Helper), _helper, true];

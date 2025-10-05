#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Shortens the cargo ropes
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Rope Index (optional, default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call aslr_core_fnc_shortenRopes
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_ropeIndex", 0]];

if !(local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(shortenRopes)], _vehicle] call CBA_fnc_targetEvent; };

private _existingRopes = [_vehicle, _ropeIndex] call FUNC(getRopes);

if (_existingRopes isEqualTo []) exitWith {};

private _ropeLength = ropeLength (_existingRopes select 0);

switch (true) do {
    case ( _ropeLength >= 10 ): { { ropeUnwind [ _x, 3,-5, true ]; } forEach _existingRopes; };
    case ( _ropeLength >= 2 ):  { { ropeUnwind [ _x, 3,-1, true ]; } forEach _existingRopes; };
    default { call FUNC(releaseCargo) };
};

[QGVAR(API_ropeShortenedEvent), [_vehicle, _player, _ropeIndex]] call CBA_fnc_localEvent;

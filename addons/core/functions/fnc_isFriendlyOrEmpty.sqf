#include "..\script_component.hpp"
/*
 * Authors: Andx
 * Checks if a vehicle is friendly to the caller or empty.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Caller <OBJECT>
 *
 * Return Value:
 * is Friendly Or Empty <BOOLEAN>
 *
 * Example:
 * [helicopter, player] call asr_core_fnc_isFriendlyOrEmpty
 *
 * Public: No
 */

params ["_vehicle", "_player"];
TRACE_1("fnc_isFriendlyOrEmpty",_this);

if (SET(onlySameSide)) then {
    crew _vehicle isEqualTo [] || { side _vehicle isEqualTo side _caller };
} else {
    private _isFriendly = [side _vehicle, side _player] call BIS_fnc_sideIsFriendly;
    (crew _vehicle isEqualTo []) || _isFriendly;
};

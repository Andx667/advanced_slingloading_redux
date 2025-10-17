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
 * [helicopter, player] call aslr_core_fnc_isFriendlyOrEmpty
 *
 * Public: No
 */

params ["_vehicle", "_caller"];
TRACE_1("fnc_isFriendlyOrEmpty",_this);

private _isFriendlyOrEmpty = false;


if (SET(onlySameSide)) then {
    if ( crew _vehicle isEqualTo [] || { side _vehicle isEqualTo side _caller } ) then {
        _isFriendlyOrEmpty = true;
    };
} else {
    private _isFriendly = [side _vehicle, side _caller] call BIS_fnc_sideIsFriendly;
    if ((crew _vehicle isEqualTo []) || _isFriendly ) then {
        _isFriendlyOrEmpty = true;
    };
};

_isFriendlyOrEmpty

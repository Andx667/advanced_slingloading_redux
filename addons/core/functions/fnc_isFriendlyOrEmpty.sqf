#include "..\script_component.hpp"
/*
 * Authors: Andx
 * Checks if a vehicle friendly to the caller or empty.
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
private _isFriendly = [side _vehicle, side _caller] call BIS_fnc_sideIsFriendly;

if ( _isFriendly || (side _vehicle) isEqualTo civilian) then { _isFriendlyOrEmpty = true };

_isFriendlyOrEmpty

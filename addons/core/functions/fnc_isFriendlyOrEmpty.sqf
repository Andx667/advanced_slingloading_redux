#include "..\script_component.hpp"
/*
 * Authors: Andx
 * Checks if a .
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call PREFIX_core_fnc_isFriendlyOrEmpty
 *
 * Public: No
 */

params ["_vehicle", "_caller"];
TRACE_1("fnc_isFriendlyOrEmpty",_this);

private _isFriendlyOrEmpty = false;
private _isFriendly = [side _vehicle, side _caller] call BIS_fnc_sideIsFriendly;

if ( _isFriendly || _vehicleSide isEqualTo civilian) then { _isFriendlyOrEmpty = true };

_isFriendlyOrEmpty

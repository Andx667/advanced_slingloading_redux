#include "..\script_component.hpp"
/*
 * Authors: You
 * Description.
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

private _vehicleSide = side _vehicle;
private _callerSide = side _caller;
private _isFriendlyOrEmpty = false;

if (_vehicleSide isEqualTo _callerSide || _vehicleSide isEqualTo civilian) then { _isFriendlyOrEmpty = true };

_isFriendlyOrEmpty

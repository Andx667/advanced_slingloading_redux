#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to change the lenght of the ropes deployed by a hook.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_airframe", "_hookClass", "_length"];

private _hookMap = _airframe getVariable _hookClass;
if (isNil "_hookMap" || { _hookMap isEqualTo false } ) exitWith {};

///////////////////////
// Sanizise
///////////////////////
_length = 100 min _length max 0.1;

///////////////////////
// Set Rope Length
///////////////////////
private _ropes = _hookMap get "ropes";
{ ropeUnwind [_x, 0.1, _length, false]; } forEach _ropes;

///////////////////////
// Save Data
///////////////////////
_hookMap set ["currLength", _length];
_airframe setVariable [_hookClass, _hookMap, true];

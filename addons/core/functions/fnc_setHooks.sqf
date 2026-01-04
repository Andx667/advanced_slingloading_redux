#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to store updated hooksmap content on airframe
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

params ["_airframe", "_hooksMap"];

{ _airframe setVariable [_x, _y, true]; } forEach _hooksMap;

#include "..\script_component.hpp"

/*
* Author: Zorn
* Ace Action Condition for "Pick Up Ropes" Action
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

params ["_ropeHelper", "_player", "_params"];
_params params  [""];

// is currently not being carried already
! ( _ropeHelper getVariable [QGVAR(isBeingCarried), false] )

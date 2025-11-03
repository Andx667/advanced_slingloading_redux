#include "..\script_component.hpp"

/*
* Author: Zorn
* ACE Action - Statement Function
*
* Arguments:
*
*
* Return Value:
* Boolean
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/


params ["_airframe", "_player", "_params"];
_params params ["_hookName"];



// create rope helper
private _ropeHelper = objNull;

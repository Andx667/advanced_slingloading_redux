#include "..\script_component.hpp"

/*
* Author: Zorn
* Handles the Creation of the Main ACE interaction Nodes.
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

params ["_airframe", "_player"];

private _children = [];

private _hooksData = _airframe getVariable QGVAR(hooksData);

private _hookIDs = _hooksData get "hookIDs";

{
    private _hookID =

} forEach _hookIDs;




///////////////////////
// return
///////////////////////
_children

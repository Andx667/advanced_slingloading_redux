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

private _actions = [];

///////////////////////
// Setup Hook Actions
///////////////////////

private _hooksData = _airframe getVariable QGVAR(hooksData);
private _hookIDs = _hooksData get "hookIDs";
private _hasExclusiveHook = _hooksData get "hasExclusiveHook";

{
    private _hookID = _x;
    private _hookDataStatic  = _hooksData get "hooks" get _hookID;
    private _hookDataDynamic = _airframe getVariable _hookID;

    private _hookStatus = [_airframe, _hasExclusiveHook, _hookID, _hookDataStatic, _hookDataDynamic] call FUNC(getHookStatus);

    _actions pushBack [ _airframe, _hookID, _hookStatus, _hookDataStatic, _hookDataDynamic ] call FUNC(actionHook_getAction);


} forEach _hookIDs;

///////////////////////
// Setup Shortcut Actions
///////////////////////



///////////////////////
// return
///////////////////////
_actions

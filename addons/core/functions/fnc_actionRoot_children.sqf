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

private _hasExclusiveHook = _hooksData get "hasExclusiveHook";


{
    private _hookID = _x;
    private _hookDataStatic  = _hooksData get "hooks" get _hookID;
    private _hookDataDynamic = _airframe getVariable _hookID;

    private _hookMode = [] call FUNC(actionHook_mode);

    private _displayName = [_hookDataStatic, _hookDataDynamic] call FUNC(actionHook_displayName);

    private _params = [];

    private _aceAction = [
        _hookID                                 // * 0: Action name <STRING>
        ,_displayName                           //  * 1: Name of the action shown in the menu <STRING>
        ,""                                     //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
        ,_state                                 //  * 3: Statement <CODE>
        ,_cond                                  //  * 4: Condition <CODE>
    //    ,{}                                   //  * 5: Insert children code <CODE> (Optional)
    //    ,_params                              //  * 6: Action parameters <ANY> (Optional)
    //    ,[0,0,0]                              //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
    //    ,20                                   //  * 8: Distance <NUMBER> (Optional)
    //    ,[false,false,false,false,false]      //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
    //    ,{}                                   //  * 10: Modifier function <CODE> (Optional)
    ] call ace_interact_menu_fnc_createAction;


} forEach _hookIDs;




///////////////////////
// return
///////////////////////
_children

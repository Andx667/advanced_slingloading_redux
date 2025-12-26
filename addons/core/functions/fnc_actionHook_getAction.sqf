#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to Return Action based on Hook Status
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

params [ "_airframe", "_hookID", "_hookStatus", "_hookDataStatic", "_hookDataDynamic" ];

[
    _hookID                                     // * 0: Action name <STRING>
    ,_this call FUNC(actionHook_displayName)    //  * 1: Name of the action shown in the menu <STRING>
    ,_this call FUNC(actionHook_icon)           //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,_this call FUNC(actionHook_statement)      //  * 3: Statement <CODE>
    ,_this call FUNC(actionHook_condition)      //  * 4: Condition <CODE>
    ,_this call FUNC(actionHook_children)       //  * 5: Insert children code <CODE> (Optional)
    ,_this                                      //  * 6: Action parameters <ANY> (Optional)
//    ,[0,0,0]                                  //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
//    ,20                                       //  * 8: Distance <NUMBER> (Optional)
//    ,[false,false,false,false,false]          //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
//    ,{}                                       //  * 10: Modifier function <CODE> (Optional)
] call ace_interact_menu_fnc_createAction

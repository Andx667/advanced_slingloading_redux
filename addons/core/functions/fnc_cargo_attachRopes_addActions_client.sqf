#include "..\script_component.hpp"

/*
 * Author: OverlordZorn
 * _jipID
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument which contains sub values <ARRAY>
 * - 0: Number of bannanas <NUMBER>
 * - 1: Bannana Color <STRING>
 * 2: Multiple input types <STRING|ARRAY|CODE>
 * 3: Optional input <BOOL> (default: true)
 * 4: Optional input with multiple types <CODE|STRING> (default: {true})
 * 5: Not mandatory input <STRING> (default: nil)
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * ['something', player] call ace_wardrobe_fnc_cargo_attachRopes_addActions_client
 *
 * Public: No
*/

if !(hasInterface) exitWith {};

// Mode: true: add Actions - false: remove Actions
params [ "_cargo", [ "_mode", true, [true] ] ];



switch (_mode) do {

    //  ToDo: Handle Creation of ACE Actions
    case true:  {

        private _offsets = [_cargo] call asr_core_fnc_cargo_getSlingloadPoints;

        {
            private _aceAction = [
                [ QADDON, "detachRopes", _forEachIndex ] joinString "_" // * 0: Action name <STRING>
                ,"Detach Cargo Ropes"                                   //  * 1: Name of the action shown in the menu <STRING>
                ,""                                                     //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
                ,FUNC(aa_detachRopes_statement)
                ,FUNC(aa_detachRopes_condition)
                ,{}                                     //  * 5: Insert children code <CODE> (Optional)
                ,nil                                    //  * 6: Action parameters <ANY> (Optional)
                ,_x                                     //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
                ,2                                      //  * 8: Distance <NUMBER> (Optional)
                ,[false,false,false,false,true]         //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
                //,{}                                   //  * 10: Modifier function <CODE> (Optional)
            ] call ace_interact_menu_fnc_createAction;

            [
                _cargo                    		// * 0: Object the action should be assigned to <OBJECT>
                ,0                         		    // * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
                ,[]             	                // * 2: Parent path of the new action <ARRAY> (Example: ["ACE_SelfActions", "ACE_Equipment"])
                ,_aceAction    	         			// * 3: Action <ARRAY>
            ] call ace_interact_menu_fnc_addActionToObject;


        } forEach _offsets;
    };

    //  ToDo: Handle Removal of ACE Actions
    case false: {
        for "_i" from 0 to 3 do {

            [
                _cargo,
                0,
                [
                    [ QADDON, "detachRopes", _i ] joinString "_"
                ]
            ] call ace_interact_menu_fnc_removeActionFromObject;

        };
    };
};

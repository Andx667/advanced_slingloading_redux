#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Shows the Select Ropes Menu
 *
 * Arguments:
 * 0: Title <STRING>
 * 1: Function Name <STRING>
 * 2: Rope Index and Label Array <ARRAY>
 * 3: Rope Label (optional, default: "Ropes") <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [params] call aslr_core_fnc_showSelectRopesMenu
 *
 * Public: No
 */

params ["_title", "_functionName", "_ropesIndexAndLabelArray", ["_ropesLabel", "Ropes"]];

ASL_Show_Select_Ropes_Menu_Array = [[_title, false]]; //ToDo change name from ASL
{
    ASL_Show_Select_Ropes_Menu_Array pushBack [ (_x select 1) + " " + _ropesLabel, [0], "", -5, [["expression", "["+(str (_x select 0))+"] call " + _functionName]], "1", "1"];
} forEach _ropesIndexAndLabelArray;
ASL_Show_Select_Ropes_Menu_Array pushBack ["All " + _ropesLabel, [0], "", -5, [["expression", "{ [_x] call " + _functionName + " } forEach [0, 1, 2];"]], "1", "1"];
showCommandingMenu "";
showCommandingMenu "#USER:ASL_Show_Select_Ropes_Menu_Array";

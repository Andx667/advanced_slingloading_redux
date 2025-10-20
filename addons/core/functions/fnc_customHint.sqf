#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_hint
 *
 * Public: No
 */

params ["_msg"];

//hint _msg;
[_msg, true] call ace_common_fnc_displayText;

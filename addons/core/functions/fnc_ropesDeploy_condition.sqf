#include "..\script_component.hpp"

/*
* Author: Zorn
* ACE Action - Statement Condition Function
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

diag_log format ['[CVO](debug)(fnc_aa_deployRopes_condition) _this: %1', _this];

params ["_airframe", "_player", "_params"];
_params params  ["_hookID"];

// Check if Hook defined
if (_airframe isNil _hookID) exitWith { systemChat "Hook not found!" };
// Check if already deployed
if (_airframe getVariable _hookID isNotEqualTo false) exitWith { systemChat "Ropes already deployed!" };


private _allHookIDs = + (_airframe getVariable QGVAR(hooksData) get "hookIDs");
private _hasExclusive = _airframe getVariable QGVAR(hooksData) get "hasExclusiveHook";

[ [false, ""], [true, _hasExclusive] ] select (_hasExclusive isEqualType "") params ["_hasExlusive", "_exclusiveHook"];

// check if exclusive Hook is deployed
_hasExclusive && { _airframe isNil _exclusiveHook }
||
{
    // Check if there is another hook that is not yet deployed
    _allHookIDs findIf { _airframe isNil _x } isNotEqualTo -1
}

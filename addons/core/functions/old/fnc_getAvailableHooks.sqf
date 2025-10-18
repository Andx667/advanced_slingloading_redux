#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to return the available hooks
*
* Arguments:
*
* Return Value:
* Nested Array of available Hooks Combinations
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/


params [ "_target" ];


private _hooksData = _target getVariable QGVAR(hooksData);
private _allHookIDs = + (_hooksData get "hookIDs");
private _hasExclusive = _hooksData get "hasExclusiveHook";

[ [false, ""], [true, _hasExclusive] ] select (_hasExclusive isEqualType "") params [ "_hasExlusive", "_exclusiveHook" ];


// check if exclusive Hook is deployed
if ( _hasExclusive && { !(_target isNil _exclusiveHook) } ) exitWith { [] };

// ToDo Continue
switch (count _allHookIDs) do {
    case 1: {
        if _hasExclusive then {

        } else {

        };
    };
    case 2: {  };
    case 3: {  };
    default {  };
};

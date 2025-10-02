#include "..\script_component.hpp"

/*
* Author: Zorn
* Check if target is locked
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


params ["_target", "_player"];

// ToDo rework this part

/*
    if (missionNamespace getVariable [QGVAR(LOCKED_VEHICLES_ENABLED), false]) then {
        if (locked _cargo > 1 ) then {
            [LLSTRING(locked_vehicle), false] call FUNC(customHint);
            _canBeAttached = false;
        };
    };
*/

false

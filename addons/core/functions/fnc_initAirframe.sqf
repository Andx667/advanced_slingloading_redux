#include "..\script_component.hpp"

/*
* Author: Zorn
* This function will initalize an Airframe for the Adv Slingload System
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

params [ [ "_airframe", ObjNull, [ObjNull] ] ];

private _data = _airframe getVariable QGVAR(hooksData);

if (isNil "_data") then {

    // Get Hook Data
    private _hookData = [typeOf _airframe] call FUNC(getHooksData);
    _airframe setVariable [QGVAR(hooksData), _hookData, true];

    // This sets the default state of the hook to false, meaning "not currently in use".
    { _airframe setVariable [_x, false, true]; } forEach (_hookData get "hookIDs");
};

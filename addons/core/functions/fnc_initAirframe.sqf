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

params [ [ "_airframe", objNull, [objNull] ] ];


private _data = _airframe getVariable QGVAR(hooksData);

if (isNil "_data") then {

    // Get Hook Data
    private _hookData = [_airframe] call FUNC(getHooksData);
    _airframe setVariable [QGVAR(hooksData), _hookData, true];

    // This sets the default state of the hook to false, meaning "not currently in use".
    { _airframe setVariable [_x, false, true]; } forEach (_hookData get "hookIDs");
};

// Sets up Clean-Up Event Handlers
private _code = {
	params ["_airframe"];
    ropeAttachedObjects _airFrame select { _x isKindOf QPVAR(ropeHelper) } apply { deleteVehicle _x };
};

if (isMultiplayer) then { _airframe addMPEventHandler ["MPKilled", _code]; } else { _airframe addEventHandler ["Killed", _code]; };
_airframe addEventHandler ["Deleted", _code];

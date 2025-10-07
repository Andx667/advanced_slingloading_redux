#include "..\script_component.hpp"

/*
* Author: Zorn
* Condition Function for the Root Ace Action
*
* Arguments:
*
* Return Value:
* boolean
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_target", "_player", "_params"];
_params params  [""];


// Check if system is enabled
missionNamespace getVariable [QSET(enabled), true]  // ToDo: Create CBA Setting
&&
{
    // Check if vehicle is supported
    _target call FUNC(isSupportedVehicle)
    &&
    {
        // Check if _player is inside vehicle and if so, which seats are allowed to control the sling load settings
        [_player] call FUNC(isAllowedSeat)
        &&
        {
            // ToDo: check if vehicle locked based on cba setting
            !([_target, _player] call FUNC(isTargetLocked))
            &&
            {
                // ToDo: Check if vehicle is supported
                [_target, _player] call FUNC(isFriendlyOrEmpty)
                &&
                {
                    // Check if airframe is initialised
                    // Conditions are checked once every second - If a helicopter is not initialised, the server will calculate + cache the data and apply specific data on the airframe.
                    _target call {
                        private _data = _this getVariable QGVAR(hooksData);
                        if (! isNil "_data") exitWith { true };
                        [QGVAR(EH_initAirframe), _this] call CBA_fnc_serverEvent;
                        false
                    }
                }
            }
        }
    }
}

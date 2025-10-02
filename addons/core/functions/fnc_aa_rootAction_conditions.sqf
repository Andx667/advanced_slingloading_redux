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
        // ToDo: check if vehicle locked based on cba setting
        !([_target, _player] call FUNC(isTargetLocked))
        &&

        {
            // ToDo: Check if vehicle is supported
            [_target, _player] call FUNC(isFriendlyOrEmpty)
            &&
            {
                // Check if airframe is initialised
                _target call {
                    private _data = _this getVariable QGVAR(hooksData);
                    if (! isNil "_data") exitWith { true };
                    [CBA_fnc_serverEvent, [QGVAR(EH_initAirframe), _this]] call CBA_fnc_execNextFrame;
                    false
                }
            }
        }
    }
}

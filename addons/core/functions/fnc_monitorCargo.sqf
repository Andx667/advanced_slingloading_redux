#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to monitor attached cargo serverside. will raise event once cargo is disconnected.
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


params [ "_airframe", "_cargo", "_hookID" ];

[
    {
        // Condition
        params ["_airframe","_cargo", "_hookID" ];

        alive _airframe
        && { alive _cargo }
        && { isNull ropeAttachedTo _cargo }


    },
    CBA_fnc_serverEvent,
    [
        QGVAR(EH_cargoDetached),
        _this
    ]

] call CBA_fnc_waitUntilAndExecute;

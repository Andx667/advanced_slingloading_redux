#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to deploy the ropes from an airframe
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

params [ "_airframe", "_hookClassname", ["_length", 20, [0]] ];

private _hookData = _airframe getVariable QGVAR(hooksData) get "hooks" get _hookClassname;
private _hookOffset = _hookData get "hookOffset";






// Store Data

_airframe setVariable [
    _hookClassname,
    createHashMapFromArray [
        ["damaged", false],
        ["ropes", _ropes],
        ["length", _length]
    ],
    true
];



// API
[QGVAR(API_ropeDeployed), [_airframe, _hookClassname, _length]] call CBA_fnc_localEvent;

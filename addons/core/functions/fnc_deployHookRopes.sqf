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


// Create Helper Object
private _helperPos = _airframe modelToWorld _hookOffset;
// Create hook 1 meter below hook or at surface if hook would be underground.
_helperPos set [ 2, _helperPos # 2 - 1 max 0 ];

// createVehicle [type, position, markers, placement, special]
private _obj = createVehicle [QPVAR(ropeHelper), _helperPos, [], 0, "CAN_COLLIDE"];


// Create Ropes
private _ropes = [];
for "_i" from 0 to 3 do {
    // [fromObject, fromPoint, length, ropeStart, ropeEnd, ropeType, nSegments]
    private _rope = ropeCreate [_airframe, _hookOffset, 0];
    ropeUnwind [_rope, 5, _length];
    _cargoRopes pushBack _rope;
};





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

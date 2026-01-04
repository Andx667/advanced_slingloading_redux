#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to handle the creation of the Hook and attaching the provided ropes to it.
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

params [ "_pos", "_ropes", "_hookID", "_hookOffset" ];

///////////////////////
// Create Rope Helper
///////////////////////
private _ropeHelper = createVehicle [QPVAR(ropeHelper), _pos, [], 0, "CAN_COLLIDE"];

///////////////////////
// Attach Ropes To New Hook
///////////////////////
{
    private _rope = _x;
    [
        _ropeHelper,
        [0,0,-0.1],
        [
            [  0,  1, -1 ],
            [  1,  0, -1 ],
            [  0, -1, -1 ],
            [ -1,  0, -1 ]
        ] select _forEachIndex
    ] ropeAttachTo _rope;

} forEach _ropes;

///////////////////////
// Store Data
///////////////////////

_ropeHelper setVariable [QGVAR(hook), _hookID, true];
_ropeHelper setVariable [QGVAR(hookOffset), _hookOffset, true];


_ropeHelper // return

#include "..\script_component.hpp"

/*
* Author: Zorn
* FNC to return ace action children based on hook status
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

params [ "_airframe", "_hookID", "_hookStatus", "_hookDataStatic", "_hookDataDynamic" ];

// "DAMAGED","BLOCKED","READY","DEPLOYED","DEPLOYEDWITHCARGO"


switch (_hookStatus) do {

    case "READY": {
        // Deploy Ropes to Set Length
        { true }
    };

    case "DEPLOYEDWITHCARGO";
    case "DEPLOYED": {
        // Change Length of Ropes
        { true }
    };


    case "DAMAGED";
    case "BLOCKED";
    default {
        // No Children
        { true }
    };
};


// params [ "_airframe", "_hookID", "_hookStatus", "_hookDataStatic", "_hookDataDynamic" ];
// private _children = [];
// _children

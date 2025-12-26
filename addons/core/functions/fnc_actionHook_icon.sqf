#include "..\script_component.hpp"

/*
* Author: Zorn
* FNC to return the Ace Action icon based on hook status
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

    case "READY":               { "" };
    case "DEPLOYEDWITHCARGO":   { "" };
    case "DEPLOYED":            { "" };
    case "DAMAGED":             { "" };
    case "BLOCKED":             { "" };

    default { "" };
};

#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to return ACE Action Statement based on Hook Status
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

// As some action nodes are informative without children, they need a non empty codeblock ( {} ), otherwise, they will be not displayed

switch (_hookStatus) do {
    case "READY":               { { "" } };
    case "DEPLOYEDWITHCARGO":   { { "" } };
    case "DEPLOYED":            { { "" } };
    case "DAMAGED":             { { "" } };
    case "BLOCKED":             { { "" } };
    default { { "" } };
};

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




switch (_hookStatus) do {

    case "READY":               { { true } };
    case "DEPLOYEDWITHCARGO":   { { true } };
    case "DEPLOYED":            { { true } };
    case "DAMAGED":             { { true } };
    case "BLOCKED":             { { true } };

    default { { true } };
}

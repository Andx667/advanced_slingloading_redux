#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to establish the displayname of a Hook Action
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

private _status = switch (_hookStatus) do {

    case "READY": { "Ready" };

    case "BLOCKED": { "Blocked" };
    case "DAMAGED": { "Damaged" };

    // Rope Length
    case "DEPLOYED": {
        format [
            "%1m",
            _hookDataDynamic get "length"
        ]
    };

    // Rope Length + Cargo
    case "DEPLOYEDWITHCARGO": {

        private _cargo = _hookDataDynamic get "cargo";

        private _customName = _cargo getVariable "ace_cargo_customName";
        private _displayName = [ configOf _cargo ] call BIS_fnc_displayName;
        if (!isNil "_customName") then { _displayName = _displayName + " (" + _customName + ")"; };

        format [
            "%1m - %2",
            _hookDataDynamic get "length",
            _displayName
        ]
    };

    default { "404" };
};

private _hookName = _hookDataStatic get "displayName";
if (_hookDataStatic get "isExclusive") then { _hookName = _hookName + " (E)"; };

// return
format [
    "%1: %2",
    _hookName,
    _status
]

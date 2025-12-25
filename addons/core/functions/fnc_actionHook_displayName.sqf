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

params [ "_mode", "_hookDataStatic", "_hookDataDynamic" ];

private _status = switch (true) do {

    case ( _hookDataDynamic isEqualTo false ): { "Ready" };

    case ( _hookDataDynamic get "damaged" ): { "Damaged" };

    default { "404" };
};


// return
format [
    "%1: %2",
    _hookDataStatic get "displayName",
    _status
]

#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to establish the current status of the hook
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

params [ "_airframe", "_hasExclusiveHook", "_hookID", "_hookDataStatic", "_hookDataDynamic" ];


switch (true) do {

    // DEPLOYED: Deployed, not damaged
    case (
        _hookDataDynamic isNotEqualTo false
        && { _hookDataDynamic get "damaged" isEqualTo false }
        && { _hookDataDynamic get "cargo" isEqualTo objNull }
    ): { "DEPLOYED" };

    // DEPLOYEDWITHCARGO: Deployed, not damaged, with cargo
    case (
        _hookDataDynamic isNotEqualTo false
        && { _hookDataDynamic get "damaged" isEqualTo false }
        && { _hookDataDynamic get "cargo" isNotEqualTo objNull }
    ): { "DEPLOYEDWITHCARGO" };

    // BLOCKED: Not Deployed, while being the exlusive Hook, while other hooks are in use.
    case (
        _hookID isEqualTo _hasExclusiveHook
        && { [_airframe, true, true] call FUNC(getHooks) isNotEqualTo createHashMap }
    ): { "BLOCKED" };

    // READY: Not Deployed, without exclusive Hook
    case (
        _hasExclusiveHook isEqualTo false
        && { _hookDataDynamic isEqualTo false }
    );

    // READY: Not Deployed, with exlusive Hook which is not deployed
    case (
        _hasExclusiveHook isNotEqualTo false
        && { _airframe getVariable _hasExclusiveHook isEqualTo false }
        && { _hookDataDynamic isEqualTo false }

    );

    // READY: Not Deployed, with exlusive Hook which is damaged
    case (
        _hasExclusiveHook isNotEqualTo false
        && { _airframe getVariable _hasExclusiveHook isNotEqualTo false }
        && { _airframe getVariable _hasExclusiveHook get "damaged" }
        && { _hookDataDynamic isEqualTo false }

    ): { "READY" };

    // BLOCKED: Not Deployed, with exclusive Hook which is deployed
    case (

        _hasExclusiveHook isNotEqualTo false
        && { _airframe getVariable _hasExclusiveHook isNotEqualTo false }
        && { _hookDataDynamic isEqualTo false }

    ): { "BLOCKED" };

    // DAMAGED: Hook Itself is Damaged
    case ( _hookDataDynamic get "damaged" ): { "DAMAGED" };


    default { ERROR_1("Undefined Mode - %1",_this); "404" };
} // return

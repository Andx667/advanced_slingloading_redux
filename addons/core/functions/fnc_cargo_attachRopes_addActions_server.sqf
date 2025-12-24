#include "..\script_component.hpp"

/*
 * Author: OverlordZorn
 * Server Event Function: Handle Ace Actions to detach a cargo from the ropes.
 *
 * Arguments:
 * 0: The first argument <STRING>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * ['something', player] call asr_core_fnc_cargo_attachRopes_addActions_server
 *
 * Public: No
*/

params [ "_cargo" ];

// Add Actions
private _jipID = [QGVAR(EH_detachRopesAction_client), [_cargo, true]] call CBA_fnc_globalEventJIP;

// Cleanup
[
    { isNull ropeAttachedTo (_this#0) },
    {
        params ["_cargo", "_jipID"];

        // Remove Actions
        [QGVAR(EH_detachRopesAction_client), [_cargo, false]] call CBA_fnc_globalEvent;
        // Remove JIP
        [_jipId] call CBA_fnc_removeGlobalEventJIP;

    },
    [_cargo, _jipID]
] call CBA_fnc_waitUntilAndExecute;

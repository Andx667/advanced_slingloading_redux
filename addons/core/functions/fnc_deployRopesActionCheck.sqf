#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the deploy ropes action should be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call aslr_core_fnc_deployRopesActionCheck
 *
 * Public: No
 */

if(isNull objectParent ACE_player) then {
    [cursorTarget] call FUNC(canDeployRopes);
} else {
    [vehicle ACE_player] call FUNC(canDeployRopes);
};

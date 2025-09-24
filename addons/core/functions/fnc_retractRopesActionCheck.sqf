#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the retract should be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call aslr_core_fnc_retractRopesActionCheck
 *
 * Public: No
 */

if(isNull objectParent ACE_player) then {
    [cursorTarget] call FUNC(canRetractRopes);
} else {
    [vehicle ACE_player] call FUNC(canRetractRopes);
};

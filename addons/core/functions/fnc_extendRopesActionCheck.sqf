#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the extend ropes action should be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call aslr_core_fnc_extendRopesActionCheck
 *
 * Public: No
 */

if (isNull objectParent ACE_player) exitWith {false};
[vehicle ACE_player] call FUNC(canExtendRopes)

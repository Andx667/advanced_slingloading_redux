#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks shorten action should be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call asr_core_fnc_shortenRopesActionCheck
 *
 * Public: No
 */

if (isNull objectParent ACE_player) exitWith {false};
[vehicle ACE_player] call FUNC(canShortenRopes);

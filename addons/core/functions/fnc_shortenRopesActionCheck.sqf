#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_shortenRopesActionCheck
 *
 * Public: No
 */

if(isNull objectParent ACE_player) exitWith {false};
[vehicle ACE_player] call FUNC(canShortenRopes);

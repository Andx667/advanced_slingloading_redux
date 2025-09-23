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
 * [params] call aslr_core_fnc_releaseCarogActionCheck
 *
 * Public: No
 */

if(isNull objectParent ACE_player) exitWith {false};
[vehicle ACE_player] call FUNC(canReleaseCargo);

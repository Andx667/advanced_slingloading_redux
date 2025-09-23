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
 * [params] call aslr_core_fnc_canDropRopes
 *
 * Public: No
 */

count (ACE_player getVariable [QGVAR(ropes_vehicle), []]) > 0 && isNull objectParent ACE_player;

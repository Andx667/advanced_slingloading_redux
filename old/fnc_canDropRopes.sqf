#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the ropes can be dropped by the player.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Ropes can be dropped <BOOLEAN>
 *
 * Example:
 * call aslr_core_fnc_canDropRopes
 *
 * Public: No
 */

count (ACE_player getVariable [QGVAR(ropes_vehicle), []]) > 0 && isNull objectParent ACE_player;

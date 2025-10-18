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

private _vehicle = [vehicle ACE_player, cursorObject] select (isNull objectParent ACE_player);

_vehicle call FUNC(canRetractRopes)

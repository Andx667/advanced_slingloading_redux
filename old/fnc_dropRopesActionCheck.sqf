#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the drop ropes action should be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call asr_core_fnc_dropRopesActionCheck
 *
 * Public: No
 */

call FUNC(canDropRopes);

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the pick up action should be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call aslr_core_fnc_pickupRopesActionCheck
 *
 * Public: No
 */

call FUNC(canPickupRopes);

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Sets the mass on a rope.
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Mass <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cargo, 20] call aslr_core_fnc_ropeSetMass
 *
 * Public: No
 */

params ["_obj", "_mass"];

_obj setMass _mass;

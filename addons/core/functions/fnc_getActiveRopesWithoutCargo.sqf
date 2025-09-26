#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Constructs an array with all ropes that have cargo no attached.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * List of ropes without cargo <ARRAY>
 *
 * Example:
 * [vehicle] call aslr_core_fnc_getActiveRopesWithCargo
 *
 * Public: No
 */

params ["_vehicle"];

private _existingCargo = _vehicle getVariable [QGVAR(Cargo),[]];

call FUNC(getActiveRopes) select { isNull (_existingCargo select (_x select 0)) }

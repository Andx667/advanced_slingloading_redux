#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Gets the rope of a vehicle at a given index.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Rope Index <INTEGER>
 *
 * Return Value:
 * Rope at the given index
 *
 * Example:
 * [params] call asr_core_fnc_getRopes
 *
 * Public: No
 */

params ["_vehicle", "_ropeIndex"];

private _allRopes = _vehicle getVariable [QGVAR(custom_ropes), []];

[ [], _allRopes select _ropeIndex ] select (count _allRopes > _ropeIndex)

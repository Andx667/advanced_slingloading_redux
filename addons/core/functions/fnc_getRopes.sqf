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
 * [params] call aslr_core_fnc_getRopes
 *
 * Public: No
 */

params ["_vehicle", "_ropeIndex"];

private ["_allRopes", "_selectedRopes"];

_selectedRopes = [];
_allRopes = _vehicle getVariable [QGVAR(custom_ropes), []];
if(count _allRopes > _ropeIndex) then {
    _selectedRopes = _allRopes select _ropeIndex;
};

_selectedRopes;

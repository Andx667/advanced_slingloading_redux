#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Constructs an array of all inactive rope indexes and position labels (e.g. [[rope index,"Front"],[rope index,"Rear"]]) for a specified vehicle
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Array of Rope index and labels <ARRAY>
 *
 * Example:
 * [vehicle] call aslr_core_fnc_getInactiveRopes
 *
 * Public: No
 */

params ["_vehicle"];

private _inactiveRopes = [];
private _existingRopes = _vehicle getVariable [QGVAR(custom_ropes),[]];
private _ropeLabelSets = [["Center"], ["Front", "Rear"], ["Front", "Center", "Rear"]];
private _totalExistingRopes = count _existingRopes;

{

    if (count _x == 0) then {
        private _ropeLabels = _ropeLabelSets select (_totalExistingRopes - 1);
        _inactiveRopes pushBack [_forEachIndex, _ropeLabels select _forEachIndex];
    };
} forEach _existingRopes;

_inactiveRopes

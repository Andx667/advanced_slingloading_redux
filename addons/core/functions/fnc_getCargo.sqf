#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Gets Cargo of a vehicle at the selected rope index.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Rope Index <INTGER>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [vehicle, 1] call aslr_core_fnc_getCargo
 *
 * Public: No
 */

params ["_vehicle", "_ropeIndex"];

private ["_allCargo", "_selectedCargo"];

_selectedCargo = objNull;
_allCargo = _vehicle getVariable [QGVAR(Cargo), []];
if(count _allCargo > _ropeIndex) then {
    _selectedCargo = _allCargo select _ropeIndex;
};

_selectedCargo;

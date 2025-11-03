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
 * [vehicle, 1] call asr_core_fnc_getCargo
 *
 * Public: No
 */

params ["_vehicle", "_ropeIndex"];


private _allCargo = _vehicle getVariable [QGVAR(Cargo), []];

[ objNull, _allCargo select _ropeIndex ] select (count _allCargo > _ropeIndex)

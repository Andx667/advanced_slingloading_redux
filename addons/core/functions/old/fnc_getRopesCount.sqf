#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Gets count of ropes on the vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Count of ropes <INTEGER>
 *
 * Example:
 * [vehicle] call aslr_core_fnc_getRopesCount
 *
 * Public: No
 */

params ["_vehicle"];

count (_vehicle getVariable [QGVAR(custom_ropes), []]);

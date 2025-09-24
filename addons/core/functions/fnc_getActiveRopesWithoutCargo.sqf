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

private ["_activeRopesWithoutCargo", "_existingCargo", "_activeRopes", "_cargo"];

_activeRopesWithoutCargo = [];
_existingCargo = _vehicle getVariable [QGVAR(Cargo),[]];
_activeRopes = call FUNC(getActiveRopes);
{
    _cargo = _existingCargo select (_x select 0);
    if(isNull _cargo) then {
        _activeRopesWithoutCargo pushBack _x;
    };
} forEach _activeRopes;

_activeRopesWithoutCargo;

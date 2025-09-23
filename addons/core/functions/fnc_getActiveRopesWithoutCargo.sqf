#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_getActiveRopesWithoutCargo
 *
 * Public: No
 */

params ["_vehicle"];

private ["_activeRopesWithoutCargo","_existingCargo","_activeRopes","_cargo"];

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

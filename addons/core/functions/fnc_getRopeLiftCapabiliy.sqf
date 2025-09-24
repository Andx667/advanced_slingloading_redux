#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Gets the Lift capability of a Vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Mass that can be liftet <INTEGER>
 *
 * Example:
 * [vehicle] call aslr_core_fnc_getRopeLiftCapabiliy
 *
 * Public: No
 */

params ["_vehicle"];

private ["_slingLoadMaxCargoMass"];

_slingLoadMaxCargoMass = getNumber (configOf _vehicle >> "slingLoadMaxCargoMass");
if(_slingLoadMaxCargoMass <= 0) then {
    _slingLoadMaxCargoMass = 4000;
};

_slingLoadMaxCargoMass;

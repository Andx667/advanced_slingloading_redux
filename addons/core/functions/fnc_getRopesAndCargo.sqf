#include "..\script_component.hpp"
/*
* Authors: Andx, sethduda
* Gets the ropes and cargo for a given rope index.
*
* Arguments:
* 0: Vehicle <OBJECT>
* 1: Rope Index <INTEGER>
*
* Return Value:
* List of the selected rope and the cargo. <ARRAY>
*
* Example:
* [vehicle, 0] call aslr_core_fnc_getRopesAndCargo
*
* Public: No
*/


params ["_vehicle", "_ropeIndex"];

private ["_selectedCargo", "_selectedRopes"];

_selectedCargo = (call FUNC(getCargo));
_selectedRopes = (call FUNC(getRopes));
[_selectedRopes, _selectedCargo];

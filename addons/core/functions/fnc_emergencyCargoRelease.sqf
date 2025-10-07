#include "..\script_component.hpp"
/*
 * Authors: Andx
 * Releases all current cargo.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call aslr_core_fnc_emergencyCargoRelease
 *
 * Public: No
 */

params ["_caller"];
TRACE_1("fnc_emergencyCargoRelease",_this);

private _vehicle = vehicle _caller;
private _ropesWithCargo = [_vehicle] call FUNC(getActiveRopesWithCargo);

{
    [_vehicle, _caller, _x] call FUNC(releaseCargo);
} forEach _ropesWithCargo;

[QGVAR(API_emergencyCargoRelease), [_vehicle, _caller, _ropesWithCargo]] call CBA_fnc_localEvent;

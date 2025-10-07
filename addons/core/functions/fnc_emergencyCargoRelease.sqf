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

INFO_1("%1", _ropesWithCargo);

{
    [_vehicle, _caller, _x select 0] call FUNC(releaseCargo);
} forEach _ropesWithCargo;

[QGVAR(API_emergencyCargoRelease), [_vehicle, _caller, _ropesWithCargo]] call CBA_fnc_localEvent;

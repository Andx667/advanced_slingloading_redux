#include "..\script_component.hpp"
/*
 * Authors: Andx
 * Returns the Co-Pilot of a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Array of copilot units, or objNull if no copilot exists.
 *
 * Example:
 * [helicopter] call aslr_core_fnc_getCopilot
 *
 * Public: No
 */

params ["_caller"];
TRACE_1("fnc_getCopilot",_this);

private _vehicle = vehicle _caller;

//From https://community.bistudio.com/wiki/currentPilot
private _copilotTurrets = allTurrets _vehicle select { getNumber ([_vehicle, _x] call BIS_fnc_turretConfig >> "isCopilot") > 0 };
private _copilots = _copilotTurrets apply { _vehicle turretUnit _x };

_copilots;

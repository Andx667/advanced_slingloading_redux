#include "..\script_component.hpp"
/*
 * Authors: Andx
 * Returns the Co-Pilot of a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [helicopter] call aslr_core_fnc_getCopilot
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("fnc_getCopilot",_this);

//From https://community.bistudio.com/wiki/currentPilot
private _copilotTurrets = allTurrets _vehicle select { getNumber ([_vehicle, _x] call BIS_fnc_turretConfig >> "isCopilot") > 0 };
private _copilot = _copilotTurrets apply { _vehicle turretUnit _x };

_copilot

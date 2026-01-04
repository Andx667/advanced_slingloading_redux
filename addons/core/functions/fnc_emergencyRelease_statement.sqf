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
 * [player] call asr_core_fnc_emergencyCargoRelease
 *
 * Public: No
 */

params ["_player"];
TRACE_1("fnc_emergencyCargoRelease",_this);

///////////////////////
// Get Variables
///////////////////////

private _airframe = vehicle _player;

// passive, damaged
private _hooks = [_airframe, false, false] call asr_core_fnc_getHooks;


///////////////////////
// Get Damage Hooks
///////////////////////
// During Emergency Release, hooks or cables are destroyed/released with explosives, resulting in damage.

_airframe setVariable [QGVAR(EmergencyReleaseUsed), true, true];

if (missionNamespace getVariable [QSET(damageOnEmergencyRelease), false]) then { { _x set ["damaged", true]; } forEach _hooks; };

///////////////////////
// Detatch the Ropes
///////////////////////



// TODO: Handle the actual cargo release and stuff


///////////////////////
// API
///////////////////////

[ QGVAR(API_emergencyCargoRelease), [_airframe, _player] ] call CBA_fnc_localEvent;

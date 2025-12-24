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

// During Emergency Release, hooks or cables are destroyed/released with explosives, resulting in damage.

///////////////////////
// Get Damage Hooks
///////////////////////

if (missionNamespace getVariable [QSET(damageOnEmergencyRelease), false]) then {

    { _x set ["damaged", true]; } forEach _hooks;

};



private _ropesWithCargo = [_airframe] call FUNC(getActiveRopesWithCargo); // TODO

INFO_1("%1",_ropesWithCargo);


{
    [_airframe, _player, _x select 0] call FUNC(releaseCargo);
} forEach _ropesWithCargo;




///////////////////////
// API
///////////////////////

[QGVAR(API_emergencyCargoRelease), [_airframe, _player, _ropesWithCargo]] call CBA_fnc_localEvent;

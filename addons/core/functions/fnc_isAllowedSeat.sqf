#include "..\script_component.hpp"
/*
 * Authors: You
 * Checks if user is in an allowed seat to operate slingloading. If he is outside its always true.
 *
 * Arguments:
 * 0: Caller <OBJECT>
 *
 * Return Value:
 * Caller is in allowed seat <BOOLEAN>
 *
 * Example:
 * [helicopter, player] call asr_core_fnc_isAllowedSeat
 *
 * Public: No
 */

params [ "_target", "_player"];
TRACE_1("fnc_isAllowedSeat",_this);

if (isNull objectParent _player) exitWith { true; };

private _pilot = currentPilot _target;
private _copilots = [_target] call FUNC(getCopilots);
private _crew = fullCrew [_target, "turret"];
private _crewArray = [];

{
    _crewArray pushBack (_x select 0);
} forEach _crew;

switch (SET(allowedSeats)) do {
    //Pilot
    case 4: { _player isEqualTo _pilot };
    //Co-Pilot
    case 3: { _player in _copilots };
    //Pilot or Co-Pilot
    case 2: { _player isEqualTo _pilot || { _player in _copilots } };
    //Crew
    case 1: { _player in _crewArray || { _player isEqualTo _pilot }  || { _player in _copilots } };
    //all
    case 0: { true };

    default { false };
} // return

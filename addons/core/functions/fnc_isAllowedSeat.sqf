#include "..\script_component.hpp"
/*
 * Authors: You
 * Checks if user is in an allowed seat to operate slingloading.
 *
 * Arguments:
 * 0: Caller <OBJECT>
 *
 * Return Value:
 * Caller is in allowed seat <BOOLEAN>
 *
 * Example:
 * [player] call aslr_core_fnc_isAllowedSeat
 *
 * Public: No
 */

params [ "_caller"];
TRACE_1("fnc_isAllowedSeat",_this);

private _vehicle = vehicle _caller;
private _pilot = currentPilot _vehicle;
private _copilots = [_vehicle] call FUNC(getCopilots);
private _crew = fullCrew [_vehicle, "turret"];
private _crewArray = [];

{
    _crewArray pushBack (_x select 0);
} forEach _crew;

switch (SET(allowedSeats)) do {
    //Pilot
    case 4: { _caller isEqualTo _pilot };
    //Co_Pilot
    case 3: { _caller in _copilots };
    //Pilot or Co-Pilot
    case 2: { _caller isEqualTo _pilot || { _caller in _copilots } };
    //Crew
    case 1: { _caller in _crewArray || { _caller isEqualTo _pilot }  || { _caller in _copilots } };
    //all
    case 0: { true };
};

_isAllowedSeat

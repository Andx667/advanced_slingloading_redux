#include "..\script_component.hpp"
/*
 * Authors: You
 * Checks if user is in an allowed seat to operate slingloading.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Caller <OBJECT>
 *
 * Return Value:
 * Caller is in allowed seat <BOOLEAN>
 *
 * Example:
 * [helicopter] call aslr_core_fnc_isAllowedSeat
 *
 * Public: No
 */

params ["_vehicle", "_caller"];
TRACE_1("fnc_isAllowedSeats",_this);

private _isAllowedSeat = false;

private _pilot = currentPilot _vehicle;
private _copilot = [_vehicle] call FUNC(getCopilot);
private _crew = fullCrew [_vehicle, "gunner", true]; //is array of arrays -> select
private _crewArray = [];
{
    _crewArray pushBack (_x select 0);
} forEach _crew;

switch (SET(allowedSeats)) do {
    case "4": { //Pilot or Co-Pilot
        if ((_caller isEqualTo _pilot) || (_caller isEqualTo _copilot)) then { _isAllowedSeat = true; };
    };
    case "3": { //Pilot
        if (_caller isEqualTo _pilot) then { _isAllowedSeat = true; };
    };
    case "2": { //Co_Pilot
        if (_caller isEqualTo _copilot) then { _isAllowedSeat = true; };
    };
    case "1": { //Crew
        if (_caller in _crewArray ) then { _isAllowedSeat = true; };
    };
    case "0": {//all
        _isAllowedSeat = true;
    };
    default {
        _isAllowedSeat = false;
    };
};

_isAllowedSeat

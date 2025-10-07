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
 * [helicopter, player] call aslr_core_fnc_isAllowedSeat
 *
 * Public: No
 */

params [ "_caller"];
TRACE_1("fnc_isAllowedSeat",_this);

private _isAllowedSeat = false;

private _vehicle = vehicle _caller;
private _pilot = currentPilot _vehicle;
private _copilot = [_vehicle] call FUNC(getCopilots) select 0;
private _crew = fullCrew [_vehicle, "turret"];
private _crewArray = [];

{
    _crewArray pushBack (_x select 0);
} forEach _crew;

switch (SET(allowedSeats)) do {

    case 4: { //Pilot
        if (_caller == _pilot) then { _isAllowedSeat = true; };
    };
    case 3: { //Co_Pilot
        if (_caller == _copilot) then { _isAllowedSeat = true; };
    };
    case 2: { //Pilot or Co-Pilot
        if ((_caller == _pilot) || (_caller == _copilot)) then { _isAllowedSeat = true; };
    };
    case 1: { //Crew
        if ((_caller in _crewArray) || (_caller == _pilot) || (_caller == _copilot)) then { _isAllowedSeat = true; };
    };
    case 0: {//all
        _isAllowedSeat = true;
    };
    default {
        _isAllowedSeat = false;
    };
};

_isAllowedSeat

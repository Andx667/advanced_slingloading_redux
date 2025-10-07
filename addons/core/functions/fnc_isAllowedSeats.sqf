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
 * [helicopter] call aslr_core_fnc_isAllowedSeats
 *
 * Public: No
 */

params ["_vehicle", "_caller"];
TRACE_1("fnc_isAllowedSeats",_this);

private _pilot = currentPilot _vehicle;
private _copilot = [_vehicle] call FUNC(getCopilot);
private _crew = fullCrew [_vehicle, "gunner", true]; //is array of arrays -> select

switch (SET(allowedSeats)) do {
    case "4": { //Pilot or Co-Pilot
        if ((_caller isEqualTo _pilot) || (_caller isEqualTo _copilot)) exitWith { true };
        false
    };
    case "3": { //Pilot
        if (_caller isEqualTo _pilot) exitWith { true };
        false
    };
    case "2": { //Co_Pilot
        if (_caller isEqualTo _copilot) exitWith { true };
        false
    };
    case "1": { //Crew
        if (_caller in _crew ) exitWith { true };
        false
    };
    case "0": {//all
        true
    };
    default {
        false
    };
};

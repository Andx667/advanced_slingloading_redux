#include "..\script_component.hpp"
/*
 * Authors: Zorn
 * Emergency Cargo Release Condition Check.
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

params ["_player", ["_skipCounter", false, [true]] ];

private _airframe = vehicle _player;

///////////////////////
// Prerequisits
///////////////////////

if !( [_airframe] call FUNC(isSupportedAirframe)             ) exitWith { false };
if !( [_airframe, _player] call FUNC(isSupportedAirframe)    ) exitWith { false };
if !( _airframe isNil QGVAR(EmergencyReleaseUsed)           ) exitWith { false };


if (_skipCounter) exitWith { true };

///////////////////////
// Handle Counter
///////////////////////

private _counter = ( missionNamespace getVariable [QGVAR(EmergencyReleaseCounter), 0] ) + 1;

if (_counter isEqualTo 3) then {

    // Allow Emergency Release
    missionNamespace setVariable [QGVAR(EmergencyReleaseCounter), nil];

    true // Return

} else {

    // Handle Counter
    missionNamespace setVariable [QGVAR(EmergencyReleaseCounter), _counter];
    [
        {
            private _counter = ( missionNamespace getVariable [QGVAR(EmergencyReleaseCounter), 0] ) - 1;
            if (_counter isEqualTo 0) then { _counter = nil; };
            missionNamespace setVariable [QGVAR(EmergencyReleaseCounter), _counter];
        },
        nil,
        1
    ] call CBA_fnc_waitAndExecute;

    false // Return
};

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * List of nearby vehicles that can be slingloaded <ARRAY>
 *
 * Example:
 * call asr_core_fnc_findNearbyVehicles
 *
 * Public: No
 */

private _nearVehicles = [];

{
    _nearVehicles append (ACE_player nearObjects [_x, 30]);
} forEach (missionNamespace getVariable [QGVAR(Supported_Vehicles_OVERRIDE), GVAR(Supported_Vehicles)]);

private _nearVehiclesWithRopes = [];

{
    private _vehicle = _x;
    {
        private _ropes = _vehicle getVariable [QGVAR(custom_ropes), []];

        if (count _ropes > (_x select 0)) then {

            _ropes = _ropes select (_x select 0);

            {
                private _ends = ropeEndPosition _x;

                if (count _ends == 2) then {
                    _ends params ["_end1", "_end2"];
                    private _playerPosAGL = ASLToAGL getPosASL ACE_player;

                    if ((_playerPosAGL distance _end1) < 5 || {(_playerPosAGL distance _end2) < 5}) then {
                        _nearVehiclesWithRopes pushBack _vehicle;
                    };

                };

            } forEach _ropes;

        };

    } forEach ([_vehicle] call FUNC(getActiveRopes));

} forEach _nearVehicles;

_nearVehiclesWithRopes // return

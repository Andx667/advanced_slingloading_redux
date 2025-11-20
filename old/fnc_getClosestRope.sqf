#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Gets the closest rope to the player.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Array of the closest rope and the closest cargo <ARRAY>
 *
 * Example:
 * call asr_core_fnc_getClosestRope
 *
 * Public: No
 */

private _nearbyVehicles = missionNamespace getVariable [QGVAR(Nearby_Vehicles), []];

private _closestVehicle = objNull;

private _closestRopeIndex = 0;

private _closestDistance = -1;

{
    private _vehicle = _x;
    {
        private _activeRope = _x;
        {
            private _ends = ropeEndPosition _x;
            if (count _ends == 2) then {
                _ends params ["_end1", "_end2"];

                private _minEndDistance = ((position ACE_player) distance _end1) min ((position ACE_player) distance _end2);

                if (_closestDistance == -1 || { _closestDistance > _minEndDistance }) then {
                    _closestDistance = _minEndDistance;
                    _closestRopeIndex = (_activeRope select 0);
                    _closestVehicle = _vehicle;
                };
            };
        } forEach ([_vehicle, (_activeRope select 0)] call FUNC(getRopes));

    } forEach ([_vehicle] call FUNC(getActiveRopes));

} forEach _nearbyVehicles;

[_closestVehicle, _closestRopeIndex];

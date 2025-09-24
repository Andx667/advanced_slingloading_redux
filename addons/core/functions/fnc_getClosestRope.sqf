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
 * call aslr_core_fnc_getClosestRope
 *
 * Public: No
 */

private ["_nearbyVehicles", "_closestVehicle", "_closestRopeIndex", "_closestDistance"];
private ["_vehicle", "_activeRope", "_ropes", "_ends"];
private ["_end1", "_end2", "_minEndDistance"];

_nearbyVehicles = missionNamespace getVariable [QGVAR(Nearby_Vehicles), []];
_closestVehicle = objNull;
_closestRopeIndex = 0;
_closestDistance = -1;
{
    _vehicle = _x;
    {
        _activeRope = _x;
        _ropes = [_vehicle, (_activeRope select 0)] call FUNC(getRopes);
        {
            _ends = ropeEndPosition _x;
            if(count _ends == 2) then {
                _end1 = _ends select 0;
                _end2 = _ends select 1;
                _minEndDistance = ((position ACE_player) distance _end1) min ((position ACE_player) distance _end2);
                if(_closestDistance == -1 || _closestDistance > _minEndDistance) then {
                    _closestDistance = _minEndDistance;
                    _closestRopeIndex = (_activeRope select 0);
                    _closestVehicle = _vehicle;
                };
            };
        } forEach _ropes;
    } forEach ([_vehicle] call FUNC(getActiveRopes));
} forEach _nearbyVehicles;

[_closestVehicle, _closestRopeIndex];

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 2: Rope Index (optional, default: 0) <INTEGER>
 * 3: Rope Length (optional, default: 15) <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call aslr_core_fnc_deployRopesIndex
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_ropesIndex", 0], ["_ropeLength", 15]];

if !(local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(deployRopesIndex)], _vehicle] call CBA_fnc_targetEvent; };

private _existingRopes = [_vehicle,_ropesIndex] call FUNC(getRopes);
private _existingRopesCount = [_vehicle] call FUNC(getRopesCount);

if (_existingRopes isEqualTo []) then {
    private _slingLoadPoints = [_vehicle] call FUNC(getSlingLoadPoints);
    private _cargoRopes = [];

    for "_i" from 0 to 3 do {
        private _rope = ropeCreate [_vehicle, (_slingLoadPoints select (_existingRopesCount - 1)) select _ropesIndex, 0];
        ropeUnwind [_rope, 5, _ropeLength];
        _cargoRopes pushBack _rope;
    };

    _allRopes = _vehicle getVariable [QGVAR(custom_ropes), []];
    _allRopes set [_ropesIndex, _cargoRopes];
    _vehicle setVariable [QGVAR(custom_ropes), _allRopes, true];
};

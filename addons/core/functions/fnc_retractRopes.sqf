#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda, Zorn
 * Retracts cargo ropes.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 2: Rope Index (optional, default: 0) <INTEGER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call aslr_core_fnc_retractRopes
 *
 * Public: No
 */

params ["_vehicle", "_player", ["_ropeIndex", 0]];

if !(local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(retractRopes)], _vehicle] call CBA_fnc_targetEvent; };

[_vehicle,_ropeIndex] call FUNC(getRopesAndCargo) params ["_existingRopes", "_existingCargo"];

if (isNull _existingCargo) then {

    call FUNC(dropRopes);

    // Pull in Rope
    {
        ropeUnwind [_x, 3, 0];
        [
            { ropeUnwound _this },
            { ropeDestroy _this },
            _x,
            20,
            { ropeDestroy _this }
        ] call CBA_fnc_waitUntilAndExecute;
    } forEach _existingRopes;

    private _allRopes = _vehicle getVariable [QGVAR(custom_ropes), []];
    _allRopes set [_ropeIndex, []];
    _vehicle setVariable [QGVAR(custom_ropes), _allRopes, true];
};

// Cleanup when no more ropes
if ([_vehicle] call FUNC(getActiveRopes) isEqualTo []) then { _vehicle setVariable [QGVAR(custom_ropes), nil, true]; };

[QGVAR(ropeRetractedEvent), [_vehicle, _player, _ropeIndex]] call CBA_fnc_globalEvent;

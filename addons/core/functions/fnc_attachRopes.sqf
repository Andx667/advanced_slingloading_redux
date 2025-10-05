#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Attaches ropes to cargo.
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cargo, player] call aslr_core_fnc_attachRopes
 *
 * Public: No
 */

params ["_cargo", "_player"];

private _vehicleWithIndex = _player getVariable [QGVAR(ropes_vehicle), [objNull, 0]];
private _vehicle = _vehicleWithIndex select 0;

if (isNull _vehicle) exitWith {};

if !(local _vehicle) exitWith { [QGVAR(EH_execQFUNC), [_this, QFUNC(attachRopes)], _vehicle] call CBA_fnc_targetEvent; };

private _ropes = [_vehicle, (_vehicleWithIndex select 1)] call FUNC(getRopes);

if (count _ropes == 4) then {

    private _ropeLength = (ropeLength (_ropes select 0));
    private _objDistance = (_cargo distance _vehicle) + 2;

    if (_objDistance > _ropeLength) exitWith { [QGVAR(EH_customHint), [LLSTRING(too_short), false], _player] call CBA_fnc_targetEvent; };

    private _attachmentPoints = [_cargo] call FUNC(getCornerPoints);

    [_vehicle, _player, (_vehicleWithIndex select 1)] call FUNC(dropRopes);

    for "_i" from 0 to 3 do { [_cargo, _attachmentPoints select _i, [0,0,-1]] ropeAttachTo (_ropes select _i); };

    private _allCargo = _vehicle getVariable [QGVAR(cargo),[]];
    _allCargo set [(_vehicleWithIndex select 1),_cargo];
    _vehicle setVariable [QGVAR(cargo), _allCargo, true];

    if (SET(ignore_liftCapacity)) then { [_cargo, _vehicle, _ropes] call FUNC(ropeAdjustMass); };
};

[QGVAR(ropeAttachedEvent), [_cargo, _player]] call CBA_fnc_globalEvent;

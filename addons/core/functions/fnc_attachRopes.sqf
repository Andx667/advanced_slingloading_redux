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
 * [cargo, player] call asr_core_fnc_attachRopes
 *
 * Public: No
 */

//_player, _ropeHelper, cursorObject
params ["_player", "_ropeHelper", "_target"];

systemChat "attachRopes FNC";

private _airframe = ropeAttachedTo _ropeHelper;
private _hookClass = _ropeHelper getVariable QGVAR(hook);

private _ropes = _airframe getVariable _hookClass get "ropes";
private _ropeLength = _airframe getVariable _hookClass get "length";

private _attachmentPoints = [_target] call FUNC(getCornerPoints);
private _outOfRange = _attachmentPoints findIf {
    _ropeLength * 1.1 < ( ( _target modelToWorld _x ) distance ( _airframe modelToWorld (_ropeHelper getVariable QGVAR(hookOffset)) ) )
} isNotEqualTo -1;

if (_outOfRange) exitWith { [QGVAR(EH_customHint), [LLSTRING(too_short), false], _player] call CBA_fnc_targetEvent; }; // ToDo: Add Hint for Target being to far away

{
    private _rope = _ropes select _forEachIndex;

    _ropeHelper ropeDetach _rope;
    [_target, _x] ropeAttachTo _rope;

} forEach _attachmentPoints;


deleteVehicle _ropeHelper;

// Store Cargo in hook
private _hook = _airFrame getVariable _hookClass;
_hook set ["cargo", _target];
_airframe setVariable [_hookClass, _hook, true];


if (SET(ignore_liftCapacity)) then { [_target, _airFrame, _ropes] call FUNC(ropeAdjustMass); };

[QGVAR(API_ropeAttached), [_airFrame, _target, _player]] call CBA_fnc_localEvent;

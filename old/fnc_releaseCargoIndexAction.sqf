#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Releases Cargo at the given rope index
 *
 * Arguments:
 * 0: Rope Index <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call asr_core_fnc_releaseCargoIndexAction
 *
 * Public: No
 */

params ["_ropeIndex"];

private _vehicle = ACE_player getVariable [QGVAR(Release_Cargo_Index_Vehicle), objNull];

if (_ropeIndex >= 0 && {!isNull _vehicle && {[_vehicle] call FUNC(canReleaseCargo)}}) then {
    [_vehicle, ACE_player, _ropeIndex] call FUNC(releaseCargo);
};

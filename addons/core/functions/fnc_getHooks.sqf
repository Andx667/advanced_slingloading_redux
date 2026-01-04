#include "..\script_component.hpp"

/*
 * Author: OverlordZorn
 *
 * Returns all Hooks of an Airframe as a hashmap
 *
 * Arguments:
 * 0: Airframe <OBJECT>
 * 1: _excludePassive <BOOLEAN>
 * 2: _excludeDamaged <BOOLEAN>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [_airframe, false, false] call asr_core_fnc_getHooks
 *
 * Public: No
*/

params [
    "_airframe",
    [ "_excludePassive", false, [true] ],
    [ "_excludeDamaged", false, [true] ]
];

if (isNil "_airframe") exitWith { nil };

private _hookIDs = _airframe getVariable QGVAR(hooksData) get "hookIDs";

private _hooksMap = createHashMap;

{
    private _value = _airframe getVariable _x;

    if (_excludePassive && { _value isEqualTo false } ) then { continue };
    if (_excludeDamaged && { _value get "damaged" isEqualTo true } ) then { continue };

    _hooksMap set [_x, _value];
} forEach _hookIDs;

_hooksMap

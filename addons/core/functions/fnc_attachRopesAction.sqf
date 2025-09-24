#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call aslr_core_fnc_attachRopesAction
 *
 * Public: No
 */

private ["_vehicle", "_cargo", "_canBeAttached"];

_cargo = cursorTarget;
_vehicle = (ACE_player getVariable [QGVAR(ropes_vehicle), [objNull, 0]]) select 0;
if([_vehicle, _cargo] call FUNC(canAttachRopes)) then {

    _canBeAttached = true;

    if!(missionNamespace getVariable [QGVAR(LOCKED_VEHICLES_ENABLED), false]) then {
        if(locked _cargo > 1 ) then {
            [LLSTRING(locked_vehicle), false] call FUNC(customHint);
            _canBeAttached = false;
        };
    };

    if(_canBeAttached) then {
        [_cargo, ACE_player] call FUNC(attachRopes);
    };

};

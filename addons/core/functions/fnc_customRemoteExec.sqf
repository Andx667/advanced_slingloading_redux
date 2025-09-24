#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_remoteExec
 *
 * Public: No
 */

params ["_params","_functionName","_target",["_isCall",false]];

if(_isCall) then {
    _params remoteExecCall [_functionName, _target];
} else {
    _params remoteExec [_functionName, _target];
};

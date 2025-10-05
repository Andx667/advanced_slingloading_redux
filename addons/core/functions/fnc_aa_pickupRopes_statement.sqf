#include "\z\aslr\addons\main\data\hpp\defineDIKCodes.hpp"
#include "..\script_component.hpp"

/*
* Author: Zorn
* Ace Action Statement for "Pick Up Ropes" Action
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_ropeHelper", "_player", "_params"];
_params params  [""];

//  Set Player Flag
_player setVariable [QGVAR(isCarryingRope), true, true];

//  Set Status Effects
[_player, "forceWalk", QADDON, true] call ace_common_fnc_statusEffect_set;
[_player, "blockThrow", QADDON, true] call ace_common_fnc_statusEffect_set;

// put Weapon Away
_player action ["SwitchWeapon", _unit, _unit, 299];


private _airframe = _ropeHelper getVariable [QGVAR(airframe), objNull];


private _parameters = [ _player, _ropeHelper, _airframe ];
private _condition = {
    params ["_player", "_ropeHelper", "_airframe"];

    currentWeapon _player isEqualTo ""
    &&
    {
        _player isNil QGVAR(dropRope)
        &&
        {
            !(isNull _ropeHelper)
            &&
            {
                lifeState _player in ["HEALTHY", "INJURED"]
            }
        }
    }
};

private _codeToRun = {

    params ["_player", "_ropeHelper", "_airframe"];

    // RightClick: Handle Drop Rope
    if (inputAction "closeContext") exitWith { _player setVariable [QGVAR(dropRope), true]; };

    if (inputAction "defaultAction") then {};

    private _target = cursorObject;

    private _isNull = isNull _target;

    private _distance = if _isNull then { -1 } else { _target distance _player };

    private _validTarget = (
        ! _isNull
        &&
        {
            _distance < 10   // ToDo? Could be Setting?
            &&
            {
                [_airframe, _target] call FUNC(isSupportedCargo)
            }
        }
    );

    private _leftClickDisplay = switch (true) do {
        case _validTarget: { "attach" };            // Valid Target LLSTRING(AttachRopes)       //ToDo Stringtable
        case _validTarget: { "attach" };            // LLSTRING(AttachRopes)       //ToDo Stringtable
        default { "Not Valid Cargo" };              // LLSTRING(notValidCargo),    //ToDo Stringtable
    };

    // Handle Mouse Hints
    [
        // LeftClick
        [
            "not valid target",

        ] select _validTarget,
        // RightClick
        "drop ropes"                    // LLSTING(DropRopes)              //ToDo Stringtable
    ] call ace_interaction_fnc_showMouseHint;
};

private _exitCode = {
    params ["_player", "_ropeHelper", "_airframe"];


    // ToDo: Drop Ropes
    if (_player getVariable [QGVAR(dropRope), false]) then {

        detach _ropeHelper;
    };


    // Player Flags
    _player setVariable [QGVAR(isCarryingRope), nil, true];
    _player setVariable [QGVAR(dropRope), nil];

    // Mouse Hints
    [] call ace_interaction_fnc_hideMouseHint;

    // Status Effects
    [_player, "forceWalk", QADDON, false] call ace_common_fnc_statusEffect_set;
    [_player, "blockThrow", QADDON, false] call ace_common_fnc_statusEffect_set;
};

[{
    params ["_args", "_handle"];
    _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

    if (_parameters call _condition) then {
        _parameters call _codeToRun;
    } else {
        _handle call CBA_fnc_removePerFrameHandler;
        _parameters call _exitCode;
    };
}, 0, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;

// { _ropeHelper ropeDetach _x; } forEach ([_vehicle, _ropesIndex] call FUNC(getRopes));

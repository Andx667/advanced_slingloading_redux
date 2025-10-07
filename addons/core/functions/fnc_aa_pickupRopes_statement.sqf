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
* [cursorObject, player] call aslr_core_fnc_aa_pickupRopes_statement;
*
* Public: No
*/

#define PFH_DELAY 0
#define MAX_DIST 10 // ToDo? Could be Setting?

params ["_ropeHelper", "_player", "_params"];
_params params  [""];

//  Set Player Flag
_player setVariable [QGVAR(isCarryingRope), true, true];
_ropeHelper setVariable [QGVAR(isBeingCarried), true, true];

//  Set Status Effects
[_player, "forceWalk", QADDON, true] call ace_common_fnc_statusEffect_set;
[_player, "blockThrow", QADDON, true] call ace_common_fnc_statusEffect_set;

// put Weapon Away
_player action ["SwitchWeapon", _player, _player, 299];


// ToDo Pickup Ropes -> Attach Rope Helper or something to player
_ropeHelper attachTo [_player, [-0.1, 1, 0.15], "Pelvis"];
// ToDo

private _airframe = ropeAttachedTo _ropeHelper;

private _parameters = [ _player, _ropeHelper, _airframe ];
private _condition = {
    params ["_player", "_ropeHelper", "_airframe"];

    currentWeapon _player isEqualTo ""
    &&
    {
        _player isNil QGVAR(player_input)
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
    if ( ["closeContext", "optics", "opticsTemp"] findIf { inputAction _x == 1} != -1) exitWith { _player setVariable [QGVAR(player_input), "DROP"]; };


    private _target = cursorObject;
    if ( _target in [_ropeHelper, _airframe] ) then { _target = objNull };
    private _isNull = isNull _target;
    private _isInRange = if ( _isNull ) then { false } else { (_target distance _player) < MAX_DIST };
    private _validTarget = ( !_isNull && {  _isInRange && { [_airframe, _target] call FUNC(isSupportedCargo) } } );

    if (_validTarget && { inputAction "defaultAction" isEqualTo 1 }) exitWith { _player setVariable [QGVAR(player_input), "ATTACH"]; };


    private _leftClickDisplay = switch (true) do {
        case (_isInRange && {  _validTarget }): { "Attach" };            // ToDo Stringtable LLSTRING(AttachRopes)
        case (_isInRange && { !_validTarget }): { "Not Valid Cargo" };   // ToDo Stringtable LLSTRING(notValidCargo)
        default { "" };                                                  // ToDo Stringtable LLSTRING(NoCargoDetected) or leave empty?
    };

    // Handle Mouse Hints
    // [LeftClick, Rightclick] //ToDo Stringtable LLSTING(DropRopes)
    [ _leftClickDisplay, "drop ropes" ] call ace_interaction_fnc_showMouseHint;
};

private _exitCode = {
    params ["_player", "_ropeHelper", "_airframe"];

    _ropeHelper setVariable [QGVAR(isBeingCarried), nil, true];
    detach _ropeHelper;

    // ToDo
    private _playerInput = _player getVariable QGVAR(player_input);
    if !(isNil "_playerInput") then {
        switch (_playerInput) do {
            case "DROP": { systemChat "drop ropes" }; // ToDo
            case "ATTACH": { systemChat "attach ropes" }; // ToDo
        };
        _player setVariable [QGVAR(player_input), nil];
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
}, PFH_DELAY, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;

#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Creates the addActions for the player to interact with the ropes and cargo.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call aslr_core_fnc_addPlayerActions
 *
 * Public: No
 */

player addAction [
    LLSTRING(extend_cargo_ropes),
    {
        [FUNC(extendRopesAction), _this] call CBA_fnc_directCall;
    },
    nil,
    0,
    false,
    true,
    "",
    QUOTE([ARR_2(FUNC(extendRopesActionCheck),_this)] call CBA_fnc_directCall)
];

player addAction [
    LLSTRING(shorten_cargo_ropes),
    {
        [FUNC(shortenRopesAction), _this] call CBA_fnc_directCall;
    },
    nil,
    0,
    false,
    true,
    "",
    QUOTE([ARR_2(FUNC(shortenRopesActionCheck),_this)] call CBA_fnc_directCall)
];

player addAction [
    LLSTRING(release_cargo_ropes),
    {
        [FUNC(releaseCargoAction), _this] call CBA_fnc_directCall;
    },
    nil,
    0,
    false,
    true,
    "",
    QUOTE([ARR_2(FUNC(releaseRopesActionCheck),_this)] call CBA_fnc_directCall)
];

player addAction [
    LLSTRING(retract_cargo_ropes),
    {
        [FUNC(retractRopesAction), _this] call CBA_fnc_directCall;
    },
    nil,
    0,
    false,
    true,
    "",
    QUOTE([ARR_2(FUNC(retractRopesActionCheck),_this)] call CBA_fnc_directCall)
];

player addAction [
    LLSTRING(deploy_cargo_ropes),
    {
        [FUNC(deployRopesAction), _this] call CBA_fnc_directCall;
    },
    nil,
    0,
    false,
    true,
    "",
    QUOTE([ARR_2(FUNC(deployRopesActionCheck),_this)] call CBA_fnc_directCall)
];

player addAction [
    LLSTRING(attach_to_cargo_ropes),
    {
        [FUNC(attachRopesAction), _this] call CBA_fnc_directCall;
    },
    nil,
    0,
    false,
    true,
    "",
    QUOTE([ARR_2(FUNC(attachRopesActionCheck),_this)] call CBA_fnc_directCall)
];

player addAction [
    LLSTRING(drop_cargo_ropes),
    {
        [FUNC(dropRopesAction), _this] call CBA_fnc_directCall;
    },
    nil,
    0,
    false,
    true,
    "",
    QUOTE([ARR_2(FUNC(dropRopesActionCheck),_this)] call CBA_fnc_directCall)
];

player addAction [
    LLSTRING(pickup_cargo_ropes),
    {
        [FUNC(pickupRopesAction), _this] call CBA_fnc_directCall;
    },
    nil,
    0,
    false,
    true,
    "",
    QUOTE([ARR_2(FUNC(pickupRopesActionCheck),_this)] call CBA_fnc_directCall)
];

player addEventHandler ["Respawn", {
    player setVariable [QGVAR(actions_loaded),false];
}];

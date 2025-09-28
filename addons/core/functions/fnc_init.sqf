#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Initializes the sling load system.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call aslr_core_fnc_init
 *
 * Public: No
 */

// Prevent advanced sling loading from installing twice
if !(isNil QGVAR(ROPE_INIT)) exitWith {};

GVAR(ROPE_INIT) = true;
INFO("Advanced Sling Loading Loading...");

GVAR(Sling_Load_Point_Class_Height_Offset) = [ //move these to config? compat mods?
    ["All", [-0.05, -0.05, -0.05]],
    ["CUP_CH47F_base", [-0.05, -2, -0.05]],
    ["CUP_AW159_Unarmed_Base", [-0.05, -0.06, -0.05]],
    ["RHS_CH_47F", [-0.75, -2.6, -0.75]],
    ["rhsusf_CH53E_USMC", [-0.8, -1, -1.1]],
    ["rhsusf_CH53E_USMC_D", [-0.8, -1, -1.1]],
    ["Cup_B_MV22_USMC", [-0.05, -0.05, -0.05]],
    ["CUP_B_MI6A_CDF", [-0.8, -1, -1.1]],
    ["B_Heli_Transport_03_F", [-0.35, -0.15, -0.05]],
    ["RHS_UH60M2_d", [-0.05, -0.05, -0.05]],
    ["B_T_VTOL_01_Vehicle_F", [-0.9, -0.9, -0.9]] //ToDo Hatchet Mod
];

GVAR(Supported_Vehicles) = [
    "Helicopter",
    "VTOL_Base_F"
];


GVAR(Sling_Rules) = [
    ["All", "CAN_SLING", "All"]
    // ["Helicopter", "CAN_NOT_SLING", "Tank"]
];


if (hasInterface) then {
    [
        {
            private _condition = !(isNull ACE_player) && { isPlayer ACE_player && { ! (ACE_player getVariable [QGVAR(actions_loaded), false]) } };

            if _condition then {
                call FUNC(addPlayerActions);
                ACE_player setVariable [QGVAR(actions_loaded), true];
            };
            missionNamespace setVariable [QGVAR(nearby_vehicles), (call FUNC(findNearbyVehicles))];
        },
        2
    ] call CBA_fnc_addPerFrameHandler;
};

if (isServer) then {
    // Install Advanced Sling Loading on all clients (plus JIP) //

    publicVariable "ASL_Advanced_Sling_Loading_Install";
    remoteExecCall ["ASL_Advanced_Sling_Loading_Install", -2, true];
};

// Disable Old Script Version on SA Server
SA_Rope_Action_Check = {false};
SA_Rope_Pickup_Rope_Action_Check = {false};
SA_Rope_Drop_Rope_Action_Check = {false};
SA_Rope_Attach_Rope_Action_Check = {false};

INFO("Advanced Sling Loading Loaded");

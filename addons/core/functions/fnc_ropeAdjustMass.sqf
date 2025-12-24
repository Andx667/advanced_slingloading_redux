#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda, Zorn
 * Description:
 * Adjusts object mass during slingloading for loads that exceed 80% of the heli's lift capacity (if its above a minimum lift capacity).
 * Handles reset on rope detach.
 *
 * !!! Needs to be Server Event !!! otherwise, when client disconnects, the mass might not get resetted
 *
 *
 * Arguments:
 * 0: Object being lifted <OBJECT>
 * 1: Helicopter doing the lift <OBJECT>
 * 2: Ropes (optional, default: []) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [obj, heli, ropes] call asr_core_fnc_ropeAdjustMass
 *
 * Public: No
 */

params [ "_cargo", "_airframe", ["_ropes",[]] ];

private _liftCapability   = getNumber (configOf _airframe >> "slingLoadMaxCargoMass");
private _originalMass     = getMass _cargo;

if !(_originalMass >= (_liftCapability * 0.8)) exitWith {};

// ─────────────────────────────
// 1) PFH to wait until rope is taut
// ─────────────────────────────
[
    {
        params ["_args", "_handle"];
        _args params ["_cargo","_airframe","_ropes","_liftCapability","_originalMass"];

        if (isNull ropeAttachedTo _cargo) exitWith { _handle call CBA_fnc_removePerFrameHandler; };

        // Check if any rope is taut
        private _taut = _ropes findIf {
            private _ends = ropeEndPosition _x;
            ( ropeLength _x * 0.9 ) <= ( _ends#0 distance _ends#1 )
        } > -1;

        if (_taut) then {
            // Reduce mass once
            [QGVAR(EH_ropeSetMass), [_cargo, ((_liftCapability) * 0.8)], _cargo] call CBA_fnc_targetEvent;

            // ─────────────────────────────
            // 2) WUAE to restore mass on detach
            // ─────────────────────────────
            [
                { isNull ropeAttachedTo (_this#0) }, // cond
                {
                    params ["_cargo","_airframe","_originalMass"];
                    [QGVAR(EH_ropeSetMass), [_cargo, _originalMass], _cargo] call CBA_fnc_targetEvent;
                    _handle call CBA_fnc_removePerFrameHandler;
                },
                [_cargo,_airframe,_originalMass]
            ] call CBA_fnc_waitUntilAndExecute;
        };
    },
    0.1, // check interval for taut rope
    [_cargo,_airframe,_ropes,_liftCapability,_originalMass]
] call CBA_fnc_addPerFrameHandler;

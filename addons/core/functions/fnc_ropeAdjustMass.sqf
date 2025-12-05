#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda, Zorn
 * Description:
 * Adjusts object mass during slingloading for loads that exceed 80% of the heli's lift capacity (if its above a minimum lift capacity).
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

if (_originalMass >= (_liftCapability * 0.8)) then {

    // ─────────────────────────────
    // 1) PFH to wait until rope is taut
    // ─────────────────────────────
    private _tautPFH = [
        {
            params ["_args", "_handle"];
            _args params ["_cargo","_airframe","_ropes","_liftCapability","_originalMass"];

            // Check if any rope is taut
            private _taut = _ropes findIf {
                private _ends        = ropeEndPosition _x;
                private _endDistance = (_ends select 0) distance (_ends select 1);
                (ropeLength _x - 2) <= _endDistance
            } > -1;

            if (_taut) then {
                // Reduce mass once
                [QGVAR(EH_ropeSetMass), [_cargo, ((_liftCapability) * 0.8)], _cargo] call CBA_fnc_targetEvent;

                // ─────────────────────────────
                // 2) PFH to restore mass on detach
                // ─────────────────────────────
                [
                    {
                        params ["_args", "_handle"];
                        _args params ["_cargo","_airframe","_originalMass"];

                        if (!(_cargo in (ropeAttachedObjects _airframe))) then {
                            [QGVAR(EH_ropeSetMass), [_cargo, _originalMass], _cargo] call CBA_fnc_targetEvent;
                            _handle call CBA_fnc_removePerFrameHandler;
                        };
                    },
                    0.5, // check interval for detach (can adjust) //maybe make a detached Event to check instead of a PFH?
                    [_cargo,_airframe,_originalMass]
                ] call CBA_fnc_addPerFrameHandler;

                _handle call CBA_fnc_removePerFrameHandler;
            } else {

                // Exit 1. PFH if obj isnt slung anymore.
                if !(_cargo in (ropeAttachedObjects _airframe)) then { _handle call CBA_fnc_removePerFrameHandler; };

            };
        },
        0.1, // check interval for taut rope
        [_cargo,_airframe,_ropes,_liftCapability,_originalMass]
    ] call CBA_fnc_addPerFrameHandler;
};

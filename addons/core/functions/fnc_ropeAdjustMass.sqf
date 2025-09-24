#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * ToDo
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Ropes (optional, default: []) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cargo, helicopter] call aslr_core_fnc_ropeAdjustMass
 *
 * Public: No
 */

params ["_obj", "_heli", ["_ropes", []]];

private _liftCapacity = [_heli] call FUNC(getRopeLiftCapabiliy);
private _originalMass = getMass _obj;
private _heavyLiftMinLift = missionNamespace getVariable [QGVAR(SET_MASS), 4000];


// When Cargo Mass is bigger then Lift Capacity while Lift Capacity is considered Heavy Lifter => make heavy lifters be able to lift everything
if( _originalMass >= ((_liftCapacity) * 0.8) && _liftCapacity >= _heavyLiftMinLift ) then {

    private ["_originalMassSet", "_ends", "_endDistance", "_ropeLength"];

    private _originalMassSet = (getMass _obj) isEqualTo _originalMass;


    _cond1 = ; // only a one time check
    _cond2 = _obj in (ropeAttachedObjects _heli); // needs to be checked constantly
    _cond3 = (_ropeLength - 2) <= _endDistance && ((position _heli) select 2) > 0;

    // If cargo mass is same as original Mass   // This whole check doesnt make much sense cause it had no chance to change since _originalMass got established ?!
    if ((getMass _obj) isEqualTo _originalMass) then {

        while { _obj in (ropeAttachedObjects _heli)  } do {
            {
                _ends = ropeEndPosition _x;
                _endDistance = (_ends select 0) distance (_ends select 1);
                _ropeLength = ropeLength _x;
                if(_cond3) then {

                    [QGVAR(EH_ropeSetMass), [_obj, ((_liftCapacity) * 0.8)], _obj] call CBA_fnc_targetEvent;     //_target can be single object or group or an array of those - will be executed only once per mashine

                    _originalMassSet = false;
                };
            } forEach _ropes;
            sleep 0.1;
        };

    };




    // Reset Cargo Mass to Original once Detatched
    [
        {
            !( (_this#0#0) in ropeAttachedObjects (_this#0#1) )
        },
        {
            _this#1 call CBA_fnc_targetEvent;
        },
        [
            [_obj, _heli],
            [QGVAR(EH_ropeSetMass), [_obj, _originalMass], _obj]
        ]
    ] call CBA_fnc_waitUntilAndExecute;
};

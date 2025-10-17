#include "..\script_component.hpp"

/*
* Author: Zorn
* ACE Action - Statement Condition Function
*
* Arguments:
*
*
* Return Value:
* Boolean
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

diag_log format ['[CVO](debug)(fnc_aa_deployRopes_condition) _this: %1', _this];

params ["_target", "_player", "_params"];
_params params  [""];


// Are there unused hooks remaining AND while non exclusive hook is being used?


/* - required checks:

private _existingRopes = count (_vehicle getVariable [QGVAR(custom_ropes), []]);
_existingRopes isEqualTo 0
|| { _existingRopes isNotEqualTo count ([_vehicle] call FUNC(getActiveRopes)) }


*/




// Previous Code
/*

if (isNull objectParent ACE_player) then {
    [cursorTarget] call FUNC(canDeployRopes);
} else {
    [vehicle ACE_player] call FUNC(canDeployRopes);
};


ACE_player distance _vehicle < 10   // Not needed - ace action framework handles that
&&
{
    [_vehicle] call FUNC(isSupportedVehicle)
    &&
    {
        ACE_player getVariable [QGVAR(ropes_vehicle), []] isEqualTo []
        &&
        {
            private _existingRopes = count (_vehicle getVariable [QGVAR(custom_ropes), []]);
            _existingRopes isEqualTo 0
            ||
            {
                _existingRopes isNotEqualTo count ([_vehicle] call FUNC(getActiveRopes))
            }
        }
    }
}
*/

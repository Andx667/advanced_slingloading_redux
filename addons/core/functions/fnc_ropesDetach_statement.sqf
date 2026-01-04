#include "..\script_component.hpp"

/*
* Author: Zorn
* ACE ACTION Statement
* Function to Detatch Sling Ropes from a Cargo
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

params ["_cargo", "_player", "_params"];
_params params  ["_offset"];


// ACE Progress Bar

[
    10                            // * 0: Total Time (in game "time" seconds) <NUMBER>      // ToDo: Could be Setting
    ,[_cargo, _player, _offset]   // * 1: Arguments, passed to condition, fail and finish <ARRAY>

    // * 2: On Finish: Code called or STRING raised as event. <CODE, STRING>
    ,{
        params ["_args", "", "", ""];
        _args params ["_cargo", "_player"];

        _args call FUNC(ropesDetach);


    }

    // * 3: On Failure: Code called or STRING raised as event. <CODE, STRING>
    ,{}

    ,"Detaching Ropes..."                     // * 4: Localized Title <STRING> (default: "")

    // * 5: Code to check each frame <CODE> (default: {true})
    ,{
        params ["_args", "", "", ""];
        _args params ["_cargo", "_player", "_offset"];

        (_cargo modelToWorld _offset distance _player) <= 3
        // (_cargo modelToWorld _offset distance _player) <= sizeOf typeOf _cargo

    }
    ,[]                     // * 6: Exceptions for checking ace_common_fnc_canInteractWith <ARRAY> (default: [])
    ,false                  // * 7: Create progress bar as dialog, this blocks user input <BOOL> (default: true)

] call ace_common_fnc_progressBar;

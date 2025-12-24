#include "..\script_component.hpp"

/*
 * Author: OverlordZorn
 * _jipID
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument which contains sub values <ARRAY>
 * - 0: Number of bannanas <NUMBER>
 * - 1: Bannana Color <STRING>
 * 2: Multiple input types <STRING|ARRAY|CODE>
 * 3: Optional input <BOOL> (default: true)
 * 4: Optional input with multiple types <CODE|STRING> (default: {true})
 * 5: Not mandatory input <STRING> (default: nil)
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * ['something', player] call ace_wardrobe_fnc_cargo_attachRopes_addActions_client
 *
 * Public: No
*/

if !(hasInterface) exitWith {};

// Mode: true: add Actions - false: remove Actions
params [ "_cargo", "_mode" ];

//  ToDo: Handle Creation of ACE Actions

//  ToDo: Handle Removal of ACE Actions

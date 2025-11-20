#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"Andx", "sethduda", "OverlordZorn"};
        url = ECSTRING(main,url);
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "asr_main",
            "cba_main"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"

#include "CfgEventHandlers.hpp"

#include "asr_Hooks.hpp"
#include "asr_Hooks_HeightOffset.hpp"

class CfgVehicles {

    #include "CfgVehiclesAceActions.hpp"

    class Land_Can_V2_F;    // TODO Later: check if Helper_base_F can be viable base class?
    class GVAR(ropeHelper): Land_Can_V2_F {
        scope = 1;
        author = ECSTRING(main,author);
        displayName = "ASLR Rope Helper";
        icon = QPATHTOF(data\icon_aslr.paa);
    };
};

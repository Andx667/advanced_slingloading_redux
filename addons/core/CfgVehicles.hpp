class CfgVehicles {

    #include "CfgVehiclesAceActions.hpp"

    // TODO Later: check if Helper_base_F can be viable base class?
    #define BASECLASS Land_Can_V1_F

    class BASECLASS;
    class GVAR(ropeHelper): BASECLASS {
        scope = 1;
        author = ECSTRING(main,author);
        displayName = "ASLR Rope Helper";
        icon = QPATHTOF(data\icon_aslr.paa);

    };
};

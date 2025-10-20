class CfgVehicles {

    #include "CfgVehiclesAceActions.hpp"

    // TODO Later: check if Helper_base_F can be viable base class?
    #define BASECLASS Land_Can_V1_F

    class BASECLASS;
    class PVAR(ropeHelper): BASECLASS {
        scope = 1;
        author = ECSTRING(main,author);
        displayName = "ASLR Rope Helper";
        icon = QPATHTOF(data\icon_aslr_ca.paa);
        model = QPATHTOF(data\ropeEndLoop\ropeEndLoop.p3d);

        class ACE_Actions {
            class PVAR(pickUp) {
                displayName = "Pickup Ropes"; // ToDo Stringtable
                condition = Q(_this call FUNC(aa_pickupRopes_condition));
                statement = Q(_this call FUNC(aa_pickupRopes_statement));
                icon = QPATHTOF(data\icon_aslr_ca.paa); // ToDo Icon

                distance = 5;
                selection = "";
                doNotCheckLOS = 1;
            };
        };
    };
};

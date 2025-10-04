// for now during dev only use helicopters
// TODO  also add to Planes/VTOL later via macro - see example: ACE addons attach cfgVehicles
#define ROOT_PROPERTIES\
displayName = "Slingloading Controls";\
icon = QPATHTOF(data\icon_aslr_ca.paa);\
statement = "true";\
condition = "true";\
showDisabled = 1


#define ACTION_DEPLOY\
    class PVAR(deployRopes) {\
        displayName = "something";\
        condition = "true";\
        statement = "systemChat 'testsub'";\
        showDisabled = 1;\
        icon = QPATHTOF(data\icon_aslr_ca.paa);\
    }




class Air;
class Helicopter: Air {
    class ACE_Actions {
        class ACE_MainActions {
            class PVAR(root) {
                ROOT_PROPERTIES;
                ACTION_DEPLOY;
            };
        };
    };

    class ACE_SelfActions {
        class PVAR(root) {
            ROOT_PROPERTIES;
            ACTION_DEPLOY;
        };
    };
};

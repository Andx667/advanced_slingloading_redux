// for now during dev only use helicopters
// TODO  also add to Planes/VTOL later via macro - see example: ACE addons attach cfgVehicles

#define ROOT_PROPERTIES\
displayName = "Slingloading Controls";\
icon = QPATHTOF(data\icon_asr_ca.paa);\
statement = "";\
condition = Q(_this call FUNC(actionRoot_conditions))

#define ACTION_DEPLOY\
class PVAR(ropesDeploy) {\
    displayName = "something";\
    condition = Q(_this call FUNC(actionRoot_conditions));\
    statement = "systemChat 'testsub'";\
    insertChildren  = Q(_this call FUNC(actionRoot_children));\
    icon = QPATHTOF(data\icon_asr_ca.paa);\
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

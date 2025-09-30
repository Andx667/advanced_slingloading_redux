// These Height Offsets are only going to be used, when the "default" approximation of hook points is being used.
// If an airframe is defined in configFile >> "ASLR_Hooks" , these here offsets will not be taken into account.

class PVAR(Hooks_HeightOffset) {
    class default {
        front  = -0.05;
        center = -0.05;
        rear   = -0.05;

        blockInheritance = 0;
    };
    class CUP_CH47F_base: default {
        front  = -0.05;
        center = -2.00;
        rear   = -0.05;
    };
    class CUP_AW159_Unarmed_Base: default {
        front  = -0.05;
        center = -0.06;
        rear   = -0.05;
    };
    class RHS_CH_47F: default {
        front  = -0.75;
        middle = -2.6;
        rear   = -0.75;
    };
    class rhsusf_CH53E_USMC: default {
        front  = -0.8;
        middle = -1;
        rear   = -1.1;
    };
    class rhsusf_CH53E_USMC_D: default {
        front  = -0.8;
        middle = -1;
        rear   = -1.1;
    };
    class Cup_B_MV22_USMC: default {
        front  = -0.05;
        middle = -0.05;
        rear   = -0.05;
    };
    class CUP_B_MI6A_CDF: default {
        front  = -0.8;
        middle = -1;
        rear   = -1.1;
    };
    class B_Heli_Transport_03_F: default {
        front  = -0.35;
        middle = -0.15;
        rear   = -0.05;
    };
    class RHS_UH60M2_d: default {
        front  = -0.05;
        middle = -0.05;
        rear   = -0.05;
    };
    class B_T_VTOL_01_Vehicle_F: default {
        front  = -0.9;
        middle = -0.9;
        rear   = -0.9;
    };
};

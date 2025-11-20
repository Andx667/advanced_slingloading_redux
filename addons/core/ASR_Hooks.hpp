// This configures the hooks an airframe does have directly. If an airframe is defined here, it will take these coordinates instead of using the calculated positions.

/*
Example Hook Class:

class huron_or_sth: base {

    blockInheritance = 0;

    class front {
        displayName = "Front";
        x = 13;
        y = 47;
        z = 69;
    };
    class center {
        isExclusive = 1;          // Means this hook can only be used exclusively, not parallel with other hooks
        displayName = "Center";
        x = 13;
        y = 47;
        z = 69;
    };
    class rear {
        displayName = "Rear";
        x = 13;
        y = 47;
        z = 69;
    };
};
*/

class PVAR(hooks) {
    class base {
        blockInheritance = 0;
        class baseHook {
            isExclusive = 0;
            displayName = "Front";
            x = 0;
            y = 0;
            z = 0;
        };
    };
};

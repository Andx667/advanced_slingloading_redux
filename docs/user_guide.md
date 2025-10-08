# User Guide

This page describes how to use Advanced Slingloading Redux as a User.

## CBA Settings

The following settings are available:

### Enable

Enables the whole slingload system.

Valid settings are:

- `true` Slingloading enabled (*default*)
- `false` Slingloading disabled

```sqf
aslr_core_set_enable = true;
```

### Ignore Lift Capacity

Controls if a helicopter can transport cargo that is heavier than the lift capacity of the helicopter.

Valid settings are:

- `true` airframes can lift above their capacity
- `false` airframes are restricted to their defined capacity (*default*)

```sqf
aslr_core_set_ignoreLiftCapacity = false;
```

### Supported Vehicles

Defines the vehicle types that are allowed to use the slingloading system.

Valid settings are:

- `0` all Helicopters and VTOLs (*default*)
- `1` only Helicopters
- `2` only VTOLs

```sqf
aslr_core_set_supportedVehicle = 0;
```

### Allow Locked Vehicles

Setting to allow slingloading of and from locked vehicles.

Valid settings:

- `true` locked vehicles can sling and be slung
- `false` locked vehicles can't sling and be slung (*default*)

```sqf
aslr_core_set_allow_locked = false;
```

### Allowed Seats

Controls which seats in a vehicle are allowed to control the slingloadsystem.

Valid settings are:

- `0` - All Seats (*default*)
- `1` - Only Crew (Turrets and Pilot / Co-Pilot)
- `2` - Only Co-Pilot and Pilot
- `3` - Only Co-Pilot
- `4` - Only Pilot

```sqf
aslr_core_set_allowedSeats = 0;
```

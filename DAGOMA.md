
# Marlin firmware

Install and use platform-io.

## Build

First, configure required printer configuration, e.g:
```
LinuxAddons/Dagoma/bin/apply_configuration -gcof E200
```

Then compile:
```
pio run -d Marlin
```

Fresh compiled firmware is generated at the following path:
```
<THIS_PROJECT_SOURCES>/Marlin/.pioenvs/default/firmware.hex
```

Compile and flash (with a plugged board):
```
pio run -d Marlin -t upload
```

For more firmware configuration, use:
```
LinuxAddons/Dagoma/bin/apply_configuration --help
```


# Bootloader MKS fixes

From folder
```
<THIS_PROJECT_SOURCES>/ArduinoAddons/Arduino_1.6.x/hardware/avr/bootloaders/stk500v2
```

Setup your build env if not:
```
sudo apt-get install build-essential gcc-avr avr-libc
```

Build bootloader with:
```
make mega2560
```

A new bootloader hex is generated called:
```
stk500boot_v2_mega2560.hex

```


# Better Purge
Old cold expulsion
```
enqueue_and_echo_commands_P(PSTR("G28\nM104 S180\nG0 F150 X0 Y0 Z100\nM109 S180\nG91\nG0 F200 E30\nD600\nM106 S255\nM104 S0\nG28"));
```


```
// Filament extraction case
      if (
        filament_direction == FILAMENT_NEED_TO_BE_EXPULSED
        && printer_states.hotend_state == HOTEND_HOT
      ) {
        SERIAL_ECHOLNPGM( "pause: filament extraction" );
        float destination_to_purge;
        destination_to_purge = destination[E_AXIS] + 30;
        float destination_to_reach;
        destination_to_reach = destination_to_purge + FILAMENTCHANGE_FINALRETRACT;
        
        float destination_at_least_to_reach;
        destination_at_least_to_reach = destination_to_purge - FILAMENT_PRE_INSERTION_LENGTH;
        SET_FEEDRATE_FOR_PURGE;
        //tap tap help to remove filament
        destination[E_AXIS] += 30;
        prepare_move();
        st_synchronize();
        SET_FEEDRATE_FOR_EXTRUDER_MOVE;
        do {
          destination[E_AXIS] -= FILAMENT_AUTO_INSERTION_VERIFICATION_LENGTH_MM;
          prepare_move();
          st_synchronize();
        } while(
          destination[E_AXIS] > destination_to_reach
          && (
            FILAMENT_PRESENT || destination[E_AXIS] > destination_at_least_to_reach
          )
        );
```


```
#if ENABLED(DELTA)
    #define SET_FEEDRATE_FOR_MOVE                   feedrate = homing_feedrate[X_AXIS];
    #define SET_FEEDRATE_FOR_EXTRUDER_MOVE          feedrate = (0.5*max_feedrate[E_AXIS] * 60.0);
    #define SET_FEEDRATE_FOR_PURGE                  feedrate = (0.1*max_feedrate[E_AXIS] * 60.0);
    #define SET_FEEDRATE_FOR_PREMABLE_EXTRUDER_MOVE feedrate = (max_feedrate[E_AXIS] * 60.0 * FILAMENT_PRE_INSERTION_FEEDRATE_FACTOR);
    #define SET_FEEDRATE_FOR_FINAL_EXTRDUDER_MOVE   feedrate = (max_feedrate[E_AXIS] * 60.0 * FILAMENT_AUTO_INSERTION_FINAL_FEEDRATE_FACTOR);
```

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
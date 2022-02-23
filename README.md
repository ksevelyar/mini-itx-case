# [mini-itx case](https://github.com/ksevelyar/mini-itx-case/blob/main/build/case.stl)

* minimalistic case for mini-itx motherboards 
* 180*194mm
* 2 ssd mounts

## Requirements

* passive cooling design (like in Celeron J4125)
* pico PSU + External PSU
* SSD
* Power switch
* 10 M3 screws
* ~250g PET-G or PLA

## Tools

```
nix-shell -p openscad prusa-slicer
```

## Generate .stl & .gcode

```
sh generate-stl.sh
sh generate-gcode.sh
```

## NixOS

Designed for tv box: https://github.com/ksevelyar/idempotent-desktop/blob/main/hosts/tv.nix

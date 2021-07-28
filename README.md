# mini-itx-case

* 180*194mm
* universal case for mini-itx motherboards 
* aligned by grid
* 2 ssd mounts

## Requirements

* passive cooling design (like in Celeron J4125)
* pico PSU + External PSU
* SSD
* Power switch
* 10 M2 screws
* ~250g PET-G

## Tools

```
nix-shell -p openscad prusa-slicer
```

## Generate .stl & .gcode

```
sh deploy.sh
```

## NixOS

Designed for tv box: https://github.com/ksevelyar/idempotent-desktop/blob/main/hosts/tv.nix

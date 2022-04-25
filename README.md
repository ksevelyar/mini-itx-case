# [mini-itx case](https://github.com/ksevelyar/mini-itx-case/blob/main/build/case.stl)

* minimalistic case for mini-itx motherboards 
* 180*194mm
* 2 ssd mounts

## Requirements

* passive cooling design (like Celeron J4125 or Atom D2700)
* pico PSU + External PSU
* SSD
* Power switch
* 10 M3 screws
* ~250g PET-G or PLA

## Tools

```
nix-shell -p openscad prusa-slicer

sh generate-stl.sh
sh generate-gcode.sh
```

## NixOS

I use this declarative chassis for the declarative Linux:

* [skynet.nix](https://github.com/ksevelyar/idempotent-desktop/blob/main/hosts/skynet.nix)
* [tv.nix](https://github.com/ksevelyar/idempotent-desktop/blob/main/hosts/tv.nix)

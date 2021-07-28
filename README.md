# mini-itx case

![2021-07-29-00-37-04-region](https://user-images.githubusercontent.com/725959/127399547-038b64f2-606d-4b5e-9f14-ba24ff95835a.png)

* minimalistic case for mini-itx motherboards 
* 180*194mm
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

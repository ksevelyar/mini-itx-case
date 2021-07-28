echo "lid.stl 🐗"
openscad -o build/lid.stl lid.scad

echo "case.stl 🐗"
openscad -o build/case.stl case.scad

echo "lid.gcode 🐗"
prusa-slicer -g build/lid.stl --load config.ini

echo "case.gcode 🐗"
prusa-slicer -g build/case.stl --load config.ini

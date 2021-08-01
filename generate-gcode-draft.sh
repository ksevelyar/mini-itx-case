rm -rf build/*.gcode

echo "lid.gcode 🐗"
prusa-slicer -g build/lid.stl --load ender3-petg-draft.ini

echo "case.gcode 🐗"
prusa-slicer -g build/case.stl --load ender3-petg-draft.ini

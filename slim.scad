$fn=256;

module leg() {
  translate([8,8,0]) difference() {
    cylinder(15, d = 10);
    translate([0,0,-0.1]) cylinder($fn=5, 21, d = 3);
  }
}

module legs() {
leg();
translate([157.48,0,0]) leg();
translate([0,154.94,0]) leg();
translate([157.48,154.94-22.86,0]) leg();  
}

module bottom(edge,h) {
difference() {
  cube([edge,edge,h]);
  rotate([0,0,180]) fillet(10,h+2);
  translate([edge,edge,0]) fillet(10,h+2);
  translate([edge,0,0]) rotate([0,0,-90]) fillet(10,h+2);
  translate([0,edge,0]) rotate([0,0,90]) fillet(10,h+2);
  //translate([10,10,-0.1]) cube([154,154,5]);
}
}

module fillet(edge,height) {
translate([-edge/2, -edge/2, -1]) difference() {
  cube([edge,edge,height]);
  cylinder(h = height, d = edge);
}
}

legs();
difference() {
  bottom(174,20);
  translate([2,2,2]) bottom(170,20);
}
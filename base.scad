$fn=256;
height = 15 + 44.5;
edge = 180;
longer_edge = 195;
wall = 2;
border_radius = 10;
screw_diameter = 3;
screw_hole = screw_diameter - 0.1;

module bottom(x_edge,y_edge,h) {
  difference() {
    cube([x_edge,y_edge,h]);
    rotate([0,0,180]) fillet(10,h+2);
    translate([x_edge,y_edge,0]) fillet(border_radius,h+2);
    translate([x_edge,0,0]) rotate([0,0,-90]) fillet(border_radius,h+2);
    translate([0,y_edge,0]) rotate([0,0,90]) fillet(border_radius,h+2);
  }
}

module fillet(edge,height) {
  translate([-edge/2, -edge/2, -1]) difference() {
    cube([edge,edge,height]);
    cylinder(h = height, d = edge);
  }
}

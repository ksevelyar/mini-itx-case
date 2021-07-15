$fn=256;

module leg() {
  translate([8,8,0]) difference() {
    cylinder(10, d = 10);
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
    cube([edge+15,edge,h]);
    rotate([0,0,180]) fillet(10,h+2);
    translate([edge+15,edge,0]) fillet(10,h+2);
    translate([edge+15,0,0]) rotate([0,0,-90]) fillet(10,h+2);
    translate([0,edge,0]) rotate([0,0,90]) fillet(10,h+2);
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
  bottom(174,15);
  translate([2,2,2]) bottom(170,56);

  translate([15,170,5]) rotate([90,-90,180]) cube([44.5,160,30]);
}

module ssd_holders() {
  translate([12,60,0]) cube([4,102,7]);
  translate([82,60,0]) cube([4,102,7]);
  translate([152,60,0]) cube([4,102,7]);
  translate([82,60,0]) cube([4,102,7]);
}

difference() {
  ssd_holders();
  translate([10,73,4.5]) rotate([0,90,0]) cylinder($fn=5, h = 150, d = 3);
  translate([10,149,4.5]) rotate([0,90,0]) cylinder($fn=5, h = 150, d = 3);
}

include <base.scad>;

module lid_hole() {
  translate([7,7,-0.1]) {
    translate([0,0,1]) cylinder(h = 5.1, d = screw_hole);  
    cylinder(h=1.3, d1 = screw_hole * 2, d2 = screw_hole);
  }
}

module lid() {
  difference() {
    translate([wall,wall,0]) bottom(longer_edge-wall*2,edge-wall*2,3);
    translate([(longer_edge-wall*2)/2-10,(edge-wall*2)/2-40,-1]) bottom(20,80,10);

    union () {
      translate([0,0,-0.5]) lid_hole();

      translate([longer_edge,0,-0.5]) rotate([0,0,90]) lid_hole();

      translate([longer_edge,edge,-0.5]) rotate([0,0,180]) lid_hole();

      translate([0,edge,-0.5]) rotate([0,0,-90]) lid_hole();

    }
  }

  translate([(longer_edge-159)/2+0.1,0.1,0]) cube([158.8,2.1,4]);
}

lid();

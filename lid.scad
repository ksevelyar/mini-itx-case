include <base.scad>;

module lid_hole() {
  translate([0,0,1]) cylinder(h=5.1,d=2.1);  
  cylinder(h=2,d1=3.5,d2=2.1);
}

module lid() {
  translate([0,0,0]) {
    difference() {
      translate([wall,wall,0]) bottom(longer_edge-wall*2,edge-wall*2,3);
      translate([(longer_edge-wall*2)/2-40,(edge-wall*2)/2-15,-1]) bottom(80,30,10);

      union () {
        translate([0,0,-0.5]) translate([7,7,-1]) { 
          lid_hole();
        }
        translate([longer_edge,0,-0.5]) rotate([0,0,90]) translate([7,7,-1]) {
          lid_hole();
        }
        translate([longer_edge,edge,-0.5]) rotate([0,0,180]) translate([7,7,-1]) {
          lid_hole();
        }
        translate([0,edge,-0.5]) rotate([0,0,-90]) translate([7,7,-1]) {
          lid_hole();
        }

      }
    }

    translate([(longer_edge-159)/2,0.1,0]) cube([159,2.1,6]);
  }
}

lid();

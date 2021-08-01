include <base.scad>;

module leg() {
  translate([10,10,0]) difference() {
    cylinder(13, d = 10);
    translate([0,0,-0.1]) cylinder(21, d = screw_hole);
  }
}

module legs() {
  translate([2.5,0,0]) leg();
  translate([159.98,0,0]) leg();
  translate([2.5,154.94,0]) leg();
  translate([159.98,154.94-22.86,0]) leg();  
}

module ssd_holders() { 
  difference() {
    union() {
      translate([(longer_edge-100)/2,147,0]) cube([100,2,9]);
      translate([(longer_edge-100)/2,72.5,0]) cube([100,2,9]);
    }

    translate([57,10,6.2]) rotate([0,90,90]) cylinder($fn=64, h = 150, d = 2.5);
    translate([134,10,6.2]) rotate([0,90,90]) cylinder($fn=64, h = 150, d = 2.5);
  }
}

module lid_mount() {
  intersection() {
    difference() {
      translate([0,0,-36]) cube([12,12,40]);
      translate([7,7,-1]) cylinder(h=40, d = screw_hole);
    }

    intersection() {
      translate([0,0,-17]) cube([12,12,20]);
      translate([-10,-10,-14]) rotate([0,45,45]) cylinder(d=16,h=40); 
    }
  }
}

module lid_mouts() {
  intersection() { 
    translate([2,2,0]) bottom(longer_edge-wall*2,edge-wall*2,height-3);


    union () {
      translate([0,0,height-6]) lid_mount();
      translate([longer_edge,0,height-6]) rotate([0,0,90]) lid_mount();
      translate([longer_edge,edge,height-6]) rotate([0,0,180]) lid_mount();
      translate([0,edge,height-6]) rotate([0,0,-90]) lid_mount();  

      translate([2,(edge-100)/2,height-5]) rotate([0,-45,0]) cube([4,100,4]);
      translate([longer_edge - 2,(edge-100)/2,height-5]) rotate([0,-45,0]) cube([4,100,4]);
      translate([(longer_edge - 100)/2,2,height-5]) rotate([45,0,0]) cube([100,4,4]);
    }
  }
}

module case() {
  legs();
  difference() {
    bottom(longer_edge,edge,height);
    translate([wall,wall,wall]) bottom(longer_edge-wall*2, edge-wall*2, height * 2 );

    translate([longer_edge/2-159/2,172,10]) rotate([90,-90,180]) cube([444.5,159,30]);
    translate([10,170,height/2]) rotate([90,-90,180]) cylinder(d=6,h=100);
    translate([longer_edge-10,170,height/2]) rotate([90,-90,180]) cylinder(d=8.1,h=100);  
  }

  ssd_holders();

  lid_mouts();

}

case();

$fn=256;

module leg() {
  translate([10,10,0]) difference() {
    cylinder(10, d = 10);
    translate([0,0,-0.1]) cylinder($fn=6, 21, d = 3);
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
    cube([edge+10,edge,h]);
    rotate([0,0,180]) fillet(10,h+2);
    translate([edge+10,edge,0]) fillet(10,h+2);
    translate([edge+10,0,0]) rotate([0,0,-90]) fillet(10,h+2);
    translate([0,edge,0]) rotate([0,0,90]) fillet(10,h+2);
  }
}

module fillet(edge,height) {
  translate([-edge/2, -edge/2, -1]) difference() {
    cube([edge,edge,height]);
    cylinder(h = height, d = edge);
  }
}

module ssd_holders() {
  translate([40,147,0]) cube([100,4,8]);
  translate([40,72.5,0]) cube([100,4,8]);
}

module lid_mount() {
  intersection() {
    difference() {
      translate([0,0,-36]) cube([12,12,40]);
      translate([7,7,-1]) cylinder(h=40,d=2);
    }

    intersection() {
      translate([0,0,-17]) cube([12,12,20]);
      translate([-10,-10,-14]) rotate([0,45,45]) cylinder(d=16,h=40); 
    }
  }
}

module case() {
  legs();
  difference() {
    height = 12 + 44.5;
    bottom(180,height);
    translate([2,2,2]) bottom(176,56);

    translate([(190-159)/2,172,7]) rotate([90,-90,180]) cube([444.5,159,30]);
    translate([8.5,170,height/2]) rotate([90,-90,180]) cylinder(d=8,h=100);
    translate([181.5,170,height/2]) rotate([90,-90,180]) cylinder(d=6,h=100);  
  }

  difference() {
    ssd_holders();
    translate([53,10,5]) rotate([0,90,90]) cylinder($fn=64, h = 150, d = 2.5);
    translate([130,10,5]) rotate([0,90,90]) cylinder($fn=64, h = 150, d = 2.5);
  }

  intersection() { 
    translate([2,2,2]) bottom(176,56);

    union () {
      translate([0,0,50]) lid_mount();
      translate([190,0,50]) rotate([0,0,90]) lid_mount();
      translate([190,180,50]) rotate([0,0,180]) lid_mount();
      translate([0,180,50]) rotate([0,0,-90]) lid_mount();  

    }
  }
}

module lid() {
  translate([200,0,0]) {
    difference() {
      translate([2,2,0]) bottom(176,2.5);
      translate([(176-40)/2,(174-40)/2,-1]) bottom(40,10);

      union () {
        translate([0,0,-0.5]) translate([7,7,-1]) cylinder(h=40,d=2);
        translate([190,0,-0.5]) rotate([0,0,90]) translate([7,7,-1]) cylinder(h=40,d=2);
        translate([190,180,-0.5]) rotate([0,0,180]) translate([7,7,-1]) cylinder(h=40,d=2);
        translate([0,180,-0.5]) rotate([0,0,-90]) translate([7,7,-1]) cylinder(h=40,d=2);  

      }
    }
  }
}

case();
//lid();

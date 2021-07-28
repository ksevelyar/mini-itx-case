$fn=256;
height = 15 + 44.5;
edge = 180;
longer_edge = 194;
wall = 2;
border_radius = 10;

module leg() {
  translate([10,10,0]) difference() {
    cylinder(13, d = 10);
    translate([0,0,-0.1]) cylinder($fn=6, 21, d = 2.1);
  }
}

module legs() {
  translate([2,0,0]) leg();
  translate([159.48,0,0]) leg();
  translate([2,154.94,0]) leg();
  translate([159.48,154.94-22.86,0]) leg();  
}

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

module ssd_holders() {
  translate([(longer_edge-100)/2,147,0]) cube([100,4,8]);
  translate([(longer_edge-100)/2,72.5,0]) cube([100,4,8]);
}

module lid_mount() {
  intersection() {
    difference() {
      translate([0,0,-36]) cube([12,12,40]);
      translate([7,7,-1]) cylinder(h=40,d=2.1);
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
    bottom(longer_edge,edge,height);
    translate([wall,wall,wall]) bottom(longer_edge-wall*2, edge-wall*2, height * 2 );

    translate([longer_edge/2-159/2,172,10]) rotate([90,-90,180]) cube([444.5,159,30]);
    translate([10,170,height/2]) rotate([90,-90,180]) cylinder(d=8,h=100);
    translate([longer_edge-10,170,height/2]) rotate([90,-90,180]) cylinder(d=6,h=100);  
  }

  difference() {
    ssd_holders();
    translate([55,10,5]) rotate([0,90,90]) cylinder($fn=64, h = 150, d = 2.5);
    translate([132,10,5]) rotate([0,90,90]) cylinder($fn=64, h = 150, d = 2.5);
  }

  intersection() { 
    translate([2,2,0]) bottom(longer_edge-wall*2,edge-wall*2,height-3);

    union () {
      translate([0,0,height-6]) lid_mount();
      translate([longer_edge,0,height-6]) rotate([0,0,90]) lid_mount();
      translate([longer_edge,edge,height-6]) rotate([0,0,180]) lid_mount();
      translate([0,edge,height-6]) rotate([0,0,-90]) lid_mount();  

    }
  }
}

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

case();
//  lid();

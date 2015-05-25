include <parts.scad>;

facets = 50;

module control_pod() {
  difference() {
    difference() {
      difference() {
        difference() {
          difference() {
            difference() {
              difference() {
                difference() {
                  difference() {
                    hemisphere();
                    translate([8,-9,3]) {
                      rotate([-90,0,-140]) {
                        color("blue") { power_sw(); }
                      }
                    }
                  }
                  translate([5,-11.5,2]) {
                    rotate([0,0,40]) {
                      // extra channel for power_sw
                      color("green") { cube([8,11,1]); }
                    }
                  }
                }
                translate([0,12,1]) {
                  rotate([0,0,0]) {
                    color("red") { micro_usb_board(); }
                  }
                }
              }
              mount_holes();
            }
            translate([-6.0,-8.0,4.5]) {
              rotate([60,0,-35]) {
                color("orange") { navigation_switch(); }
              }
            }
            translate([12,0,4]) {
              rotate([0,90,0]) {
                // reset button
                color("orange") { button(); }
              }
            }
          }
        }

        translate([-5,-4.9,0]) {
          // access
          cube([10,10,12.5]);
        }
      }
      translate([-5,-12,2]) {
        // channel on base layer
        cube([10,25,1]);
      }
    }
    screw_countersinks();
  }
}

module base_layer() {
  difference() {
    control_pod();
    translate([-25,-25,3]) {
      cube([50, 50, 20]);
    }
  }
}

module second_layer() {
  difference() {
    difference() {
      control_pod();
      translate([-25,-25,5.5]) {
        cube([50, 50, 20]);
      }
    }
    translate([-25,-25,-7]) {
      cube([50, 50, 10]);
    }
  }
}

module third_layer() {
  difference() {
    difference() {
      control_pod();
      translate([-25,-25,12.5]) {
        cube([50, 50, 20]);
      }
    }
    translate([-25,-25,-4.5]) {
      cube([50, 50, 10]);
    }
  }
}

module top_layer() {
  intersection() {
    control_pod();
    translate([-25,-25,12.5]) {
      cube([50, 50, 20]);
    }
  }
}


explode = true;
// // explode = falses;

if (explode) {
  explosion = 5;
  base_layer();
  translate([0,0,explosion]) { second_layer() ; }
  translate([0,0,explosion*2]) { third_layer() ; }
  translate([0,0,explosion*3]) { top_layer() ; }
} else {
  base_layer();
  second_layer();
  third_layer();
  top_layer();
}

// for single stl export
// translate([0,35,0]) { base_layer(); }
// translate([35,0,-3.0]) { second_layer() ; }
// translate([0,-30,-5.5]) { third_layer() ; }
// translate([-25,0,-12.5]) { top_layer() ; }
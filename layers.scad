/*
TODO:

rotate nav switch so that it's even closer to the mount hole?
lower height of second layer, increase height of top layer.
lower power_sw so cutout is exposed on bottom.?

add keyboard toggle button.
add home button.
add status led.
add power connected led?
*/


include <parts.scad>;

facets = 50;

mount_hole_rotation = 0;

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
                    difference() {
                      difference() {
                        hemisphere();
                        translate([-0.0,8.5,9.5]) {
                          rotate([-90,0,-0]) {
                            color("blue") { power_sw(); }
                          }
                        }
                      }
                      translate([-3.5,5,9]) {
                        rotate([0,0,0]) {
                          // extra channel for power_sw
                          color("red") { cube([7,4,2.5]); }
                        }
                      }
                    }
                    translate([0,12,1]) {
                      rotate([0,0,0]) {
                        color("red") { micro_usb_board(); }
                      }
                    }
                  }
                  rotate([0,0,mount_hole_rotation]) {
                    mount_holes();
                  }
                }
                translate([-6.0,-8.0,4.0]) {
                  rotate([60,0,-35]) {
                    color("orange") { navigation_switch(); }
                  }
                }
                translate([13,0,3]) {
                  rotate([0,90,0]) {
                    // reset button
                    color("orange") { button(); }
                  }
                }
              }
              translate([3,-11,3]) {
                rotate([65,0,15]) {
                  // home button
                  color("white") { button(); }
                }
              }
            }
            translate([10,-7,3]) {
              rotate([65,0,53]) {
                // keyboard toggle button
                color("white") { button(); }
              }
            }
          }
        }

        translate([-5,-4.9,0]) {
          // access
          cube([10,10,11.5]);
        }
      }
      translate([-5,-12,2]) {
        // channel on base layer
        cube([10,25,1]);
      }
    }
    rotate([0,0,mount_hole_rotation]) {
      screw_countersinks();
    }
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
      translate([-25,-25,11.5]) {
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
    translate([-25,-25,11.5]) {
      cube([50, 50, 20]);
    }
  }
}

export = false;
// export = true;

if (!export) {
  explode = false;
  explode = true;

  if (explode) {
    explosion = 5;
    base_layer();
    translate([0,0,explosion]) { second_layer() ; }
    translate([0,0,explosion*2]) { third_layer() ; }
    translate([0,0,explosion*3]) { top_layer() ; }
  } else {
    base_layer();
    // second_layer();
    // third_layer();
    // top_layer();
  }
} else {
  // for single stl export
  translate([0,35,0]) { base_layer(); }
  translate([35,0,-3.0]) { second_layer() ; }
  translate([0,-30,-5.5]) { third_layer() ; }
  translate([-25,0,-11.5]) { top_layer() ; }
}
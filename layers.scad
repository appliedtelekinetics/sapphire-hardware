/*
TODO:
rotate nav switch so that it's even closer to the mount hole?

space home and kbbd buttons father apart so third layer is more reliable.
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
                  union() {
                    translate([-6.0,-8.0,4.0]) {
                      rotate([60,0,-35]) {
                        color("orange") { navigation_switch(); }
                      }
                    }
                    // access for nav switch
                    color("red") {
                      translate([-6.5,-8.5,5.5]) {
                        rotate([0,90,55]) {
                          cylinder(d=4, h=6, $fn=facets);
                          // cube([12,2,2]);
                        }
                      }
                    }
                  }
                  union() {
                    translate([12,4,2.5]) {
                      rotate([0,90,17]) {
                        // reset button
                        color("orange") { button(); }
                      }
                    }
                    // access for reset button
                    color("red") {
                      translate([13,5,3]) {
                        rotate([0,90,-165]) {
                          cylinder(d=3, h=9, $fn=facets);
                          // cube([12,2,2]);
                        }
                      }
                    }
                  }
                }
                union() {
                  translate([4.0,-10,5]) {
                    rotate([80,0,-4]) {
                      // home button
                      color("white") { button(); }
                    }
                  }
                  // access for home button
                  color("red") {
                    translate([2,-4,3]) {
                      rotate([0,90,-80]) {
                        cylinder(d=3, h=7, $fn=facets);
                        // cube([12,2,2]);
                      }
                    }
                  }
                }
              }
              union() {
                translate([11,-6,3]) {
                  rotate([90,0,53]) {
                    // keyboard toggle button
                    color("white") { button(); }
                  }
                }
                // access for keyboard toggle button
                color("red") {
                  translate([4,-1,3]) {
                    rotate([0,90,-37]) {
                      cylinder(d=3, h=12, $fn=facets);
                      // cube([12,2,2]);
                    }
                  }
                }
              }
            }
          }
          union() {
            translate([-16,-5,3]) {
              rotate([90,0,287]) {
                // status led
                micro_led();
              }
            }
            // access for led
            color("red") {
              translate([-16.1,-5.1,3]) {
                rotate([0,90,15]) {
                  cylinder(d1=3.75, d2=2, h=12, $fn=facets);
                  // cube([12,2,2]);
                }
              }
            }
          }
        }
        translate([-5,-4.9,0]) {
          // access
          cube([10,10,11.5]);
        }
      }
      translate([-4,2,2]) {
        // channel on base layer
        color("blue") { cube([8,5,1]); }
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
    // base_layer();
    second_layer();
    // third_layer();
    // top_layer();
  }
} else {
  //prevent wear on same area of build platform
  rotate([0,0,30]) {
    // for single stl export
    translate([0,35,0]) { base_layer(); }
    translate([35,0,-3.0]) { second_layer() ; }
    translate([0,-30,-5.5]) { third_layer() ; }
    translate([-25,0,-11.5]) { top_layer() ; }
  }
}
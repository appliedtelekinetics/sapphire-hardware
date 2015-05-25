include <parts.scad>;

facets = 50;

// navigation_switch();
// button();
// slim_button();
// power_sw();
// micro_usb_board();

// difference() {
//   hemisphere();
//   mount_holes();
// }

// difference() {
//   difference() {
//     difference() {

//       difference() {
//         difference() {
//           difference() {
//             difference() {
//               hemisphere();
//               translate([0,-12,4]) {
//                 rotate([90,0,0]) {
//                   power_sw();
//                 }
//               }
//             }
//             translate([0,13,2]) {
//               rotate([0,0,0]) {
//                 micro_usb_board();
//               }
//             }
//           }
//           translate([-25,-25,-8]) {
//             cube([50, 50, 12]);
//           }
//         }
//         translate([-25,-25,6]) {
//           cube([50, 50, 12]);
//         }
//       }

//       mount_holes();
//     }
//     translate([-5,-4.9,0]) {
//       // access
//       cube([10,10,4]);
//     }
//   }
//   translate([-5,-12.5,2]) {
//       // channel
//       cube([10,29.5,2]);
//     }
// }



module control_pod() {
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
                translate([5,-12,2]) {
                  rotate([0,0,40]) {
                    // extra channel for power_sw
                    color("green") { cube([9,11,1]); }
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
          translate([0,-7.5,8]) {
            rotate([35,0,0]) {
              navigation_switch();
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


base_layer();
// second_layer();
// third_layer();
// top_layer();
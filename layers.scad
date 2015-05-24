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

difference() {
  difference() {
    difference() {
      difference() {
        difference() {
          difference() {
            hemisphere();
            translate([0,-12,4]) {
              rotate([90,0,0]) {
                power_sw();
              }
            }
          }
          translate([0,13,2]) {
            rotate([0,0,0]) {
              micro_usb_board();
            }
          }
        }
        translate([-25,-25,4]) {
          cube([50, 50, 20]);
        }
      }
      mount_holes();
    }
    translate([-5,-4.9,0]) {
      // access
      cube([10,10,4]);
    }
  }
  translate([-5,-12.5,2]) {
      // channel
      cube([10,29.5,2]);
    }
}
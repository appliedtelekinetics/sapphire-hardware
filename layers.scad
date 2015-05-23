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

difference() {
  difference() {
    difference() {
      difference() {
        difference() {
          difference() {
            hemisphere();
            translate([0,-12,3]) {
              rotate([90,0,0]) {
                power_sw();
              }
            }
          }
          translate([0,12,4.5]) {
            rotate([-180,0,180]) {
              micro_usb_board();
            }
          }
        }
        translate([-20,-20,4]) {
          cube([40, 40, 20]);
        }
      }
      mount_holes();
    }
    translate([-5,-4.9,0]) {
      // access
      cube([10,10,5]);
    }
  }
  translate([-5,-12.5,2]) {
      // channel
      cube([10,19.5,2]);
    }
}
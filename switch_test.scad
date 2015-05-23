facets = 50;

module hemisphere() {
  translate([0,0,-0]) {
    difference() {
      sphere(d=26, center=true, $fn=facets);
      translate([0,0,-25]) {
        cube([60,60,50],center=true);
      }
    }
  }
}

// Navigation Switch Dimensions in millimetres:
// Base: (10.08 or 10.68 at leads) x 10.05 x (3.11 or 3.62 at nubs)
// Stick lower: 7 (diameter at base) x 2.6
// Stick upper: 3.17 x 3.16 x 4.4
// 10.13 total height from base bottom to stick top.
module navigation_switch() {
  base_width=11.0;
  base_length=11.0;
  base_height=3.65;
  stick_lower_height=3.4; // 4.4 really
  stick_upper_width=3.17;
  stick_upper_length=3.16;
  // base
  translate([-(base_width/2), -(base_length/2), 0])
    cube([base_width, base_length, base_height]); // no nubs
  // stick lower
  translate([0,0,base_height])
    cylinder(d=7.5, h=stick_lower_height, $fn=facets);
  // stick upper
  // translate([-(stick_upper_width/2),-(stick_upper_length/2),base_height+stick_lower_height])
  //   cube([stick_upper_width, stick_upper_length, 4.4]);  
}

module rotated_navigation_switch() {
  translate([0,-3,5]) {
    rotate([30,0,0]) {
      translate([0,0,1]) {
        navigation_switch();
      }
    }
  }
}

difference() {
  difference() {
    difference() {
      hemisphere();
      union() {
        rotated_navigation_switch();
        union() {
          translate([-(11.0/2),-2.5,-1])
            cube([11.0,7.0,11.6]);
          translate([-(11.0/2),-9.6,-1])
            cube([11.0,7.5,7.5]);
        }
      }
    }
    translate([-15, 5, 0])
      cube(30,30,30);
  }
  union() {
    translate([6,-15,0])
      cube(30,30,30);
    translate([-26,-15,0])
      cube(20,20,20);
  }
}
module hemisphere() {
  translate([0,0,-6]) {
    difference() {
      sphere(r=22, center=true, $fn=facets);
      translate([0,0,-19]) {
        cube([60,60,50],center=true);
      }
    }
  }
}

module mount_holes() {
  union() {
    translate([-9.4, 0, 0]) {
      cylinder(r=1.5, h=20, $fn=facets);
    }

    translate([+9.4, 0, 0]) {
      cylinder(r=1.5, h=20, $fn=facets);
    }
  }
}

module navigation_switch() {
  base_width=11.0;
  base_length=11.0;
  base_height=3.65;
  stick_lower_height=3.4; // 4.4 really
  stick_upper_width=3.17;
  stick_upper_length=3.16;

  union() {
    // base
    translate([-(base_width/2), -(base_length/2), 0])
      cube([base_width, base_length, base_height]); // no nubs
    // stick lower
    translate([0,0,base_height])
      cylinder(d=7.5, h=stick_lower_height, $fn=facets);
    // stick upper
    translate([-(stick_upper_width/2),-(stick_upper_length/2),base_height+stick_lower_height])
      cube([stick_upper_width, stick_upper_length, 4.4]);
  }
}

module button() {
  base_width = 8.0; // including leads
  base_length = 7.1;
  base_height = 4; // including nubs
  button_height = 2;
  button_width = 4;

  union() {
    // base
    translate([-(base_width/2), -(base_length/2), 0])
      cube([base_width, base_length, base_height]); // no nubs
    // button
    translate([0,0,base_height])
      cylinder(d=button_width, h=button_height, $fn=facets);
  }
}

module slim_button() {
  base_width = 8.0; // including leads
  base_length = 4;
  base_height = 4; // including nubs
  button_height = 2;
  button_width = 3;

  union() {
    // base
    translate([-(base_width/2), -(base_length/2), 0])
      cube([base_width, base_length, base_height]); // no nubs
    // button
    translate([0,0,base_height])
      cylinder(d=button_width, h=button_height, $fn=facets);
  }
}

module power_sw() {
  base_width = 12;
  base_length = 4.5;
  base_height = 6; // including nubs

  switch_height = 5;
  switch_width = 7;
  switch_length = 3;
  switch_x_offset = -3.5;
  switch_y_offset = -1.5;

  union() {
    // base
    translate([-(base_width/2), -(base_length/2), 0])
      cube([base_width, base_length, base_height]); // no nubs
    // switch
    translate([switch_x_offset,switch_y_offset,base_height])
      cube([switch_width, switch_length, switch_height]);
  }
}

module micro_usb_board() {
  board_width = 21.5;
  board_length = 12;
  board_height = 2;

  connector_height = 3;
  connector_width = 9;
  connector_length = 11.5;
  connector_x_offset = -4.5;
  connector_y_offset = 0.5;
  connector_z_offset = 1.50;

  mount_hole_diameter = 3.5;
  mount_hole_x_offset = 7.5;
  mount_hole_y_offset = 3.5;

  union() {
    // base
    translate([-(board_width/2), -(board_length/2), 0])
      cube([board_width, board_length, board_height]);
    // button
    translate([connector_x_offset,connector_y_offset,connector_z_offset])
      cube([connector_width, connector_length, connector_height]);
  }
}
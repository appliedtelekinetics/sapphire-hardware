facets = 100;

upper_cylinder_radius = 15.4;
upper_cylinder_height = 9;
upper_cylinder_wall_thickness = 1;

lower_cylinder_radius = 13.7;
lower_cylinder_height = 15;
lower_cylinder_wall_thickness = 0.5;

flange_cylinder_height = 3;
flange_outer_radius = upper_cylinder_radius - upper_cylinder_wall_thickness;
flange_width = 6;
flange_inner_radius = (flange_outer_radius - flange_width)-3;
flange_channel_width = 3;
flange_wall_width = flange_width - flange_channel_width;


// attachment for control pod, angled surface
module upper_cylinder() {
  difference() {
    union() {
      difference() {
        cylinder(h=upper_cylinder_height, r=upper_cylinder_radius, $fn=facets);
      
        // create a second smaller cylinder to ensure enough overlap in print
        // to solidly join upper to lower
        // joint_inner_radius = upper_cylinder_radius - (
        //   upper_cylinder_radius - lower_cylinder_radius
        // )-lower_cylinder_wall_thickness;
        // cylinder(h=upper_cylinder_height, r=joint_inner_radius, $fn=facets);

        // translate([0, 0, 1]) {
          cylinder(h=upper_cylinder_height, r=lower_cylinder_radius-lower_cylinder_wall_thickness, $fn=facets);
        // }
        
        // no tapered width  
        //cylinder(h=upper_cylinder_height, r=upper_cylinder_radius, $fn=facets);
        //cylinder(h=upper_cylinder_height, r=lower_cylinder_radius-lower_cylinder_wall_thickness, $fn=facets);
      }

      // draw flanges
      // the z of the transform needs to put the flange piece very slightly
      // lower than the top of the enclosing cylinder or else the printer
      // won't properly print both the cylinder and the flanges.
      translate([0.5, 0.0, (upper_cylinder_height-flange_cylinder_height)*0.66]) {
        rotate([3.5, -5.5, -30]) {
        
          rotate([0,0,45]) {
            flange();
          }
      
          rotate([0,0,225]) {
            flange();
          }
        }
      }
    }

    // angle the top
    rotate([0, -6.7, 0]) {
      translate([-upper_cylinder_radius,-upper_cylinder_radius,+6.9]) {
        cube([upper_cylinder_radius*2.2,upper_cylinder_radius*2, 5]); 
      }
    }
  }
}

// anchor to inside of handle, includes centering notch
module lower_cylinder() {
  difference() {
    difference() {
      cylinder(h=lower_cylinder_height, r=lower_cylinder_radius, $fn=facets);
      cylinder(h=lower_cylinder_height, r=lower_cylinder_radius-lower_cylinder_wall_thickness, $fn=facets);
    }

    // create the notch
    translate([lower_cylinder_radius-(lower_cylinder_wall_thickness*1.2),-1.4,0]) {
      cube([1.6,2.5,lower_cylinder_height]);
    }
  }
}

// radial screw channel flange
module flange() {
  difference() {
    difference() {

      // flange segment
      difference() {
        intersection() {
          rotate_extrude($fn=facets) {
            square([flange_outer_radius,flange_cylinder_height]);
          }
          // controls the rotational length of the flange
          translate([-3,-3,0]) {
            cube([flange_outer_radius*2.5,flange_outer_radius*2.5,flange_cylinder_height]);
          }
        }
      

        intersection(){
          rotate_extrude($fn=facets) {
            square([flange_inner_radius,flange_cylinder_height]);
          }
          // controls the rotational length of the flange
          translate([-3,-3,0]) {
            cube([flange_outer_radius*2.5,flange_outer_radius*2.5,flange_cylinder_height]);
          }
        }
      }

      // flange channel
      difference() {
        intersection() {
          rotate_extrude($fn=facets) {
            flange_outer_wall_modifier = -0.0;
            square([flange_outer_radius-flange_wall_width+flange_outer_wall_modifier,flange_cylinder_height]);
          }
          // the -3 corresponds withthe -3 in the flange segment above
          translate([(flange_width/flange_channel_width)-3, (flange_width/flange_channel_width)-3, 0]) {
            cube([flange_outer_radius*2.5,flange_outer_radius*2.5,flange_cylinder_height]);
          }
        }
      

        intersection(){
          rotate_extrude($fn=facets) {
            flange_inner_wall_modifier = -0.5;
            square([flange_inner_radius+flange_wall_width+flange_inner_wall_modifier,flange_cylinder_height]);
          }
          // the -3 corresponds withthe -3 in the flange segment above
          translate([(flange_width/flange_channel_width)-3, (flange_width/flange_channel_width)-3, 0]) {
            cube([flange_outer_radius*2.5,flange_outer_radius*2.5,flange_cylinder_height]);
          }
        }
      }
    }
    // clip the flange corners
    union() {
      rotate([0,0,40]) {
        translate([1.0,-8,0]) {
          cube([3,5,flange_cylinder_height]);
        }
      }
      rotate([0,0,40]) {
        translate([0.0,4,0]) {
          cube([3,5,flange_cylinder_height]);
        }
      }
    }
  }
}

module full_insert() {
  translate([0, 0, lower_cylinder_height]) {
    upper_cylinder();
  }

  lower_cylinder();

}

full_insert();
// flange();


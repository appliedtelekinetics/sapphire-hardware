facets = 100;

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

difference() {
  hemisphere();
  union() {
    translate([-9.4, 0, 0]) {
      cylinder(r=1.5, h=20, $fn=facets);
    }

    translate([+9.4, 0, 0]) {
      cylinder(r=1.5, h=20, $fn=facets);
    }
  }
}
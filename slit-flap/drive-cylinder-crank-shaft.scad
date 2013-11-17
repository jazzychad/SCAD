$fn=100;

module crank_shaft(_r, _h) {

	union() {
		cylinder(r=_r, h=_h);
		hull() {
			translate([0, 0, _h]) cylinder(r=1.5*_r, 1);
			translate([3*_r, 0, _h]) cylinder(r=_r, 1);
		}
		translate([3*_r, 0, _h]) cylinder(r=0.5*_r, 5);

	}

}

crank_shaft(1, 20);
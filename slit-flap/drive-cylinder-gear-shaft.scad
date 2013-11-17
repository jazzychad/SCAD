$fn=100;

module gear_shaft(_r, _h, _teeth) {

	difference() {
		cylinder(r=_r, h=_h);

		for (_angle = [0 : 360 / _teeth : 359]) {
			translate([_r * cos(_angle), _r * sin(_angle), _h/2])
				rotate([0, 0, _angle + 45])
					cube([_r/4, _r/4, _h+2], true);
		}
	}

}

gear_shaft(2.5, 10, 20);

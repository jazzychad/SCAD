use <drive-cylinder-endcap.scad>

$fn=100;

module drive_cylinder(_r, _h, _numholes) {

	difference() {
		union () {
			endcap(_r, _numholes);
			cylinder(r=_r/2, h=_h);
			translate([0, 0, _h-1]) endcap(_r, _numholes);
		}
		translate([0,0,-1]) cylinder(r=2, h=_h+2);
	}
}

drive_cylinder(10, 10, 10);

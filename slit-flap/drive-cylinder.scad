use <drive-cylinder-endcap.scad>
use <drive-cylinder-gear-shaft.scad>

$fn=100;

module drive_cylinder(_r, _h, _numholes) {

	difference() {
		union () {
			endcap(_r, _numholes);
			cylinder(r=_r/2, h=_h);
			translate([0, 0, _h-1]) endcap(_r, _numholes);
			translate([0, 0, _h]) gear_shaft(_r/2, 1, 20);
		}

		// hole 
		translate([0,0,-1]) cylinder(r=1, h=_h+3);
	}
}

// slip-flat tags are 6 wide, so make cylinder 8 tall.
// if scaled, make sure the drive-cylinder and tags are
// scaled by the same factor
drive_cylinder(5, 8, 10);

use <drive-cylinder-crank-shaft.scad>
use <drive-cylinder.scad>
use <housing.scad>
use <slit-flap.scad>

$fn=100;

_housingdim = [14, 16, 26];
color("MediumSeaGreen") housing(_housingdim);

translate([-2, _housingdim[1]/2, _housingdim[2]/2])
	rotate([0, 90, 0])
		color("aqua") crank_shaft(1, _housingdim[0]+5);

translate([_housingdim[0]/2 - 8/2, _housingdim[1]/2, _housingdim[2]/2])
	rotate([0, 90, 0])
		color("FireBrick") drive_cylinder(5, 8, 10);


_digit = 7;

// start with bottom half of display digit and loop around
_angles = [-90, -90, -90, -90, -80, -35, 0, 45, 85, 90];

for (_i = [0 : 9]) {
	translate([_housingdim[0]/2 - 6/2, _housingdim[1]/2 - 5 * 0.8 * cos(18 + _i*36) - 1.2 * cos(-1*_angles[_i]), _housingdim[2]/2 - 5 * 0.8 * sin(18 + _i*36) + 1.20 * sin(-1*_angles[_i])])
		rotate([_angles[_i], 0, 0])
			combined_half_tag((_digit - 1 - _i + 10) % 10);
}

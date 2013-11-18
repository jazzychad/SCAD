use <drive-cylinder-crank-shaft.scad>
use <drive-cylinder.scad>
use <housing.scad>
use <slit-flap.scad>

$fn=100;

_r = 25;

_housingdim = [12, 60, 60];
housing(_housingdim);

translate([-2, _housingdim[1]/2, _housingdim[2]/2])
	rotate([0, 90, 0])
		# color("aqua") crank_shaft(1, _housingdim[0]+5);

translate([_housingdim[0]/2 - 9/2, _housingdim[1]/2, _housingdim[2]/2])
	rotate([0, 90, 0])
		% drive_cylinder(_r, 8, 40);


_digit = 7;

// start with bottom half of display digit and loop around
_angles = [90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -90, -85, -80, -75, -65, -60, -50, -40, -30, -15, 0, 10, 20, 30, 40, 50, 60, 70, 75, 80, 85, 90];//, -90, -90];

for (_i = [0 : 39]) {
	translate([_housingdim[0]/2 - 7/2, _housingdim[1]/2 - _r * 0.8 * cos(0 + _i*(360/40)) - 1.2 * cos(-1*_angles[_i]), _housingdim[2]/2 - _r * 0.8 * sin(0 + _i*(360/40)) + 1.20 * sin(-1*_angles[_i])])
		rotate([_angles[_i], 0, 0])
			combined_half_tag((_digit - 1 - _i + 10) % 10);
}

use <numbers.scad>

$fn=50;

module num(_n) {
	if (_n == 0) zero();
	if (_n == 1) one();
	if (_n == 2) two();
	if (_n == 3) three();
	if (_n == 4) four();
	if (_n == 5) five();
	if (_n == 6) six();
	if (_n == 7) seven();
	if (_n == 8) eight();
	if (_n == 9) nine();
}

// create full digit tag
module tag(_num) {

		union() {
			translate([0.5, 0.5, 0]) {
				minkowski() {
					cube([5,7,0.25]);
					cylinder(h=0.25, r=0.5);
				}
			}
			translate([-2,0,0.25]) color("red") num(_num);
		}

}

// make a top or bottom half of a digit tag
module half_tag(_num, _top=1) {
	// top half
	if (_top != 0) {
		translate([0, -4, 0]) {
			difference() {
				tag(_num);
				translate([0, 0, -1]) cube([8,4, 8]);
			}
		}
	}

	// bottom half
	if (_top == 0) {
		difference() {
			tag(_num);
			translate([-0.5, 4, -1]) cube([8, 8, 8]);
		}
	}
}

// create the combined front/back digit tag
module combined_half_tag(_num) {
	_front = _num;
	_back = (_num + 1) % 10;

	union() {
		half_tag(_front, 1);
		translate([0, 4, 0]) {
			rotate([180, 0, 0]) {
				half_tag(_back, 0);
			}
		}
	}
}

// create the set of tags
for (_i = [0 : 9]) {
	translate([_i*8, 0, 0]) combined_half_tag(_i);
}

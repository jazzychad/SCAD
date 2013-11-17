use <drive-cylinder-crank-shaft.scad>

module housing(_dim) {

	difference() {
		union() {
			// base
			cube([_dim[0], _dim[1], 1]);

			// left wall
			cube([1, _dim[1], _dim[2]]);

			// right wall
			translate([_dim[0]-1, 0, 0]) cube([1, _dim[1], _dim[2]]);

			// top
			translate([0, 0, _dim[2]-1]) cube([_dim[0], _dim[1], 1]);
		}
	
		// make holes for (gear) shaft
		translate([_dim[0]/-2, _dim[1]/2, _dim[2]/2])
			rotate([0, 90, 0])
				crank_shaft(1, 2*_dim[0]);
	}

}

housing([20, 20, 20]);
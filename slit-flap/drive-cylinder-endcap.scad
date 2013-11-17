$fn=100; 

module endcap(_radius, _numholes) {
	difference() {
		cylinder(r=_radius, h=1);
		for (_angle = [0 : 360 / _numholes : 359]) {
			 translate([_radius * 0.8*cos(_angle), _radius * 0.8*sin(_angle), -1]) 
				cylinder(r=0.5, h=3);
		}

	}

}


endcap(10, 10);
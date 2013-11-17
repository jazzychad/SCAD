// numbers
// a simple number font
// mono-spaced designed for 10x10mm per digit

// Copyright (C) 2012 t00tie
// This work is licensed under the 
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/

ink=0.5;// ink width and height. Set to nozzle width for "one squirt"-width font !!!untested

$fn=33;// wild guess
//translate([0,0,-1]) cube([100,10,1]);
color("red") union(){
translate([0,0,0]) zero();
translate([10,0,0]) one();
translate([20,0,0]) two();
translate([30,0,0]) three();
translate([40,0,0]) four();
translate([50,0,0]) five();
translate([60,0,0]) six();
translate([70,0,0]) seven();
translate([80,0,0]) eight();
translate([90,0,0]) nine();
}

module arc(){
	translate([0,0,0]) difference(){
		cylinder(r=2, h=ink);
		translate([0,0,-1]) cylinder(r=2-ink, h=3);
		translate([-11,-22,-1]) cube([22,22,3]);
	}
}

module one(){
	translate([5,1,0]) cube([ink,6,ink]);
}

module two(){
	translate([5,5,0]) arc();
	translate([3,1,0]) cube([4,ink,ink]);
	translate([3,1,0]) rotate([0,0,45]) cube([4*sqrt(2),ink,ink]);
}

module three(){
	translate([5,3,0]) rotate([0,0,180]) arc();
	translate([5,3,0]) rotate([0,0,-90]) arc();
	translate([5,5,0]) rotate([0,0,-30]) arc();
}

module four(){
	translate([3,3,0]) cube([4,ink,ink]);
	translate([3,3,0]) rotate([0,0,90]) cube([4,ink,ink]);
	translate([5,1,0]) rotate([0,0,90]) cube([4,ink,ink]);
}

module five(){
	translate([5,3,0]) rotate([0,0,180]) arc();
	translate([5,3,0]) rotate([0,0,-90]) arc();
	translate([3+ink,5-ink,0]) cube([2,ink,ink]);
	translate([3+ink,5-ink,0]) rotate([0,0,90]) cube([2+ink,ink,ink]);
	translate([3+ink,7-ink,0]) cube([3,ink,ink]);
}

module six(){
	translate([5,3,0]) rotate([0,0,180]) arc();
	translate([5,5,0]) rotate([0,0,0]) arc();
	translate([5,3,0]) rotate([0,0,0]) arc();
	translate([3+ink,3,0]) rotate([0,0,90]) cube([2,ink,ink]);
	//translate([5,7-ink,0]) rotate([0,0,90]) arc();
}

module seven(){
	foo=sqrt((3+ink)*(3+ink)+(7-ink)*(7-ink));
	translate([3+ink,7-ink,0]) cube([4,ink,ink]);
	translate([3+ink,1,0]) rotate([0,0,55]) cube([foo-ink,ink,ink]);
}

module eight(){
	translate([5,3,0]) rotate([0,0,90]) arc();
	translate([5,3,0]) rotate([0,0,-90]) arc();
	translate([5,5,0]) rotate([0,0,-30]) arc();
	translate([5,5,0]) rotate([0,0,30]) arc();
}

module nine(){
	translate([5,3,0]) rotate([0,0,180]) arc();
	translate([5,5,0]) rotate([0,0,0]) arc();
	translate([5,5,0]) rotate([0,0,180]) arc();
	translate([7,3,0]) rotate([0,0,90]) cube([2,ink,ink]);
}

module zero(){
	translate([5,3,0]) rotate([0,0,180]) arc();
	translate([5,5,0]) rotate([0,0,0]) arc();
	translate([7,3,0]) rotate([0,0,90]) cube([2,ink,ink]);
	translate([3+ink,3,0]) rotate([0,0,90]) cube([2,ink,ink]);
}
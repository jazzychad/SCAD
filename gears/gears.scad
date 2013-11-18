use <gear-shaft.scad>

$fn=100;

M_PI = 3.141592653589;

// notes:
// pitch diameter == effective size of gear
// pitch diameter can be derived from:
//  - tooth spacing
//  - number of teeth

// spoke width is same as tooth spacing (projected linerally)
//  = (pitch_diameter / 2) * 2 * sin(theta/2)
// spoke holes are centered between shaft hole and pitch diameter
//   with distance of spoke width on either side

// Ideally, the pitch is 2.25 times the height of the teeth.
// pitch == tooth spacing
// http://reprap.org/wiki/Gear_design#teeth_shape

// addendum:dedendum typically 1:1.25
// http://school.mech.uwa.edu.au/~dwright/DANotes/gears/generation/generation.html

module gear(_r, _h, _teeth, _tooth_spacing, _pitch_angle, _shaft_diameter, _use_gear_shaft=1, _spokes=0) {

    _pitch_diameter = _teeth * _tooth_spacing / M_PI;
    _pitch_radius = _pitch_diameter / 2.0;
    _tooth_angle = 360 / _teeth;
    _tooth_chord_length = 2.0 * _pitch_radius * sin(_tooth_angle/2.0);
    _spoke_width = _tooth_chord_length;
    _tooth_height = _tooth_spacing / 2.25;
    _tooth_inset = _tooth_height * 1.25 / (1 + 1.25);
    _cylinder_radius = _pitch_radius - _tooth_inset;

    difference() {
        // base cylinder for gear
        cylinder(r = _cylinder_radius, h = _h);

        // spokes
        if (_spokes > 0) {
            difference() {
                translate([0,0,-1]) cylinder(r = _cylinder_radius - _spoke_width, h = _h+2);
                translate([0,0,-1]) cylinder(r = _shaft_diameter / 2.0 + _spoke_width, h = _h+2);
                for (_i = [0 : _spokes - 1]) {
                    rotate([0, 0, _i * 360 / _spokes])
                      translate([0, -_spoke_width / 2.0, 0])
                        cube([_cylinder_radius - _spoke_width, _spoke_width, _h]);
                }
            }
        }

        // shaft hole
        translate([0, 0, -1]) gear_shaft(_r = _shaft_diameter / 2.0, _h = _h + 2, _teeth = _use_gear_shaft);
    }

    // gear teeth
    for (_i = [0 : _teeth - 1]) {
        translate([_cylinder_radius * cos(_i * 360 / _teeth), _cylinder_radius * sin(_i * 360 / _teeth), 0])
          rotate([0, 0, _i * 360 / _teeth])
            translate([0, -_tooth_spacing / 2.0 / 2.0, 0])
              difference() {
                  // base tooth
                  translate([-1, 0, 0])
                  cube([_tooth_height + 1, _tooth_spacing / 2.0, _h]);


                  // mask off teeth with pitch angle at pitch radius

                  translate([_tooth_inset, _tooth_spacing / 2.0, -1])
                  rotate([0, 0, -_pitch_angle])
                  cube([_tooth_height, _tooth_spacing / 2.0, _h+2]);

                  // guide cube for debugging
                  translate([_tooth_inset, _tooth_spacing / 2.0, -1])
                  * cube([_tooth_height, _tooth_spacing / 2.0, _h+2]);


                  translate([_tooth_inset, 0/*-_tooth_spacing / 2.0*/, -1])
                  translate([0, 0, _h+2])
                  rotate([-180, 0, 0])
                  rotate([0, 0, -_pitch_angle])
                  cube([_tooth_height, _tooth_spacing / 2.0, _h+2]);

                  // guide cube for debugging
                  translate([_tooth_inset, -_tooth_spacing / 2.0, -1])
                  * cube([_tooth_height, _tooth_spacing / 2.0, _h+2]);
              }
    }

}

gear(0, 3, 30, 10, 20, 10, 8, 3);


/*
translate([0, 0, 3])
//translate([30 * 10 / M_PI / 2 + 10 * 10 / M_PI / 2, 0, 0])
//rotate([0, 0, 360 / 10 / 2])
color("green") gear(0, 3, 10, 10, 20, 0, 0, 3);



translate([0, 0, -15])
color("red") gear_shaft(5, 30, 8);
*/
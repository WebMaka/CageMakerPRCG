/*

 CageMaker PRCG - The Parametric Rack Cage Generator v. 0.70 (TBA)
 --------------------------------------------------------------------------------
 Copyright © 2025-2026 by WebMaka - this file is licensed under CC BY-NC-SA 4.0.
 To view a copy of this license, visit
   https://creativecommons.org/licenses/by-nc-sa/4.0/

 Quickly create a 3D-printable object file for a rack cage for any device
 of a given size. Simply provide the device's dimensions, and optionally
 tweak a few settings, then press F6 then F7 to generate and save a STL
 file.


 For the latest version of this file, report bugs, etc., please visit my
 Github repo:

   https://github.com/WebMaka/CageMakerPRCG


 If this is useful to you, please consider donating and/or subscribing to my
 Patreon. I fund my projects entirely out-of-pocket, and any additional
 funding will help.

   https://ko-fi.com/webmaka
   https://thanks.dev/webmaka
   https://patreon.com/webmaka

*/



/*

    Core Component & Structure Creation

*/



// Create a three-dimensional rectangular prism with four rounded corners (e.g., faceplate)
module four_rounded_corner_plate(plate_height, plate_width, plate_thickness, corner_radius)
{
    linear_extrude(plate_thickness, center=true, twist=0, $fn=this_fn)
        offset(r=corner_radius, $fn=this_fn)
            offset(delta=-corner_radius)
                square([plate_width, plate_height], center=true);
}

// Create a three-dimensional rectangular prism with two rounded corners (e.g., support frame)
module two_rounded_corner_plate(plate_height, plate_width, plate_thickness, corner_radius)
{
    linear_extrude(plate_thickness, center=true, twist=0, $fn=this_fn)
        hull()
        {
            translate([0 - (plate_width / 2) + corner_radius, (plate_height / 2) - corner_radius, 0])
                circle(r=corner_radius, $fn=this_fn);
            translate([(plate_width / 2) - corner_radius, (plate_height / 2) - corner_radius, 0])
                circle(r=corner_radius, $fn=this_fn);
            translate([0 - (plate_width / 2), 0 - (plate_height / 2), 0])
                circle(r=0.0001, $fn=this_fn);
            translate([(plate_width / 2), 0 - (plate_height / 2), 0])
                circle(r=0.0001, $fn=this_fn);
        }
}

// Create a three-dimensional rectangular prism with two rounded corners and 
// a rounded-rectangle cutout in its center (e.g., ventilated support frame)
module ventilated_side_plate(plate_height, plate_width, plate_thickness, side_thickness, outer_corner_radius=10, inner_corner_radius=5, split=false)
{
    union()
    {
        difference()
        {
            two_rounded_corner_plate(plate_height, plate_width, plate_thickness, outer_corner_radius);
                
            translate([0, side_thickness / 2, 0])
                four_rounded_corner_plate(plate_height - (side_thickness * 3), plate_width - (side_thickness * 2), plate_thickness + 2, inner_corner_radius);
        }

        if ((split) && (device_width > 80))
        {
            //translate([0, 0, 0])
                cube([20, plate_height - (side_thickness * 2) + 2, plate_thickness], center=true);
            translate([6, 0, 0 - (support_cage_base_size / 4)])
                cube([plate_thickness, plate_height, plate_thickness + (support_cage_base_size / 2)], center=true);
            translate([-6, 0, 0 - (support_cage_base_size / 4)])
                cube([plate_thickness, plate_height, plate_thickness + (support_cage_base_size / 2)], center=true);
        }
    }
}

// Create a three-dimensional rectangular prism with sharp corners and a 
// rounded-rectangle cutout in its center (e.g., back of cage)
module ventilated_back_plate(plate_height, plate_width, plate_thickness, side_thickness, outer_corner_radius=10, inner_corner_radius=5)
{
    difference()
    {
        four_rounded_corner_plate(plate_height, plate_width, plate_thickness, outer_corner_radius);
        four_rounded_corner_plate(plate_height - (side_thickness * 2), plate_width - (side_thickness * 2), plate_thickness + 2, inner_corner_radius);
    }
}

// Create faceplate slotted screw hole
module faceplate_screw_hole_slot(mounting_hole_diameter, xx, yy, zz)
{
    // Calculate how wide the holes need to be to produce a slot width of 5mm regardless of
    // screw size.
    slot_width = 5 - (mounting_hole_diameter / 2);

    translate([xx, yy, zz])
        linear_extrude(plate_thickness + 2, center=true, twist=0, $fn=this_fn)
            if (hole_instead_of_slot)
                circle(d=mounting_hole_diameter, $fn=this_fn, false);
            else
            {
                hull()
                {
                    translate([0 - slot_width, 0, 0])
                        circle(d=mounting_hole_diameter, $fn=this_fn, false);
                    translate([slot_width, 0, 0])
                        circle(d=mounting_hole_diameter, $fn=this_fn, false);    
                }
            }
}

// Create a hollow tube of a given diameter/height with a given wall thickness
module tube(diameter, height, wall_thickness, facet_count, cone=false)
{
    difference()
    {
        cylinder(h=height, d1=diameter, d2=diameter * (cone ? 2 : 1), center=true, $fn=facet_count);
        cylinder(h=height + 0.002, d=diameter - (wall_thickness * 2), center=true, $fn=facet_count);
    }
}

// Create a fan grill cutout shape of a given diameter
module fan_grill_cutout(size)
{
    grill_support_thickness = size / 36;

    difference()
    {
        cylinder(h=16, d=size, center=true, $fn=this_fn);
        union()
        {
            tube(size + grill_support_thickness, 16, grill_support_thickness, this_fn);
            tube((size / 5) * 4, 16, grill_support_thickness, this_fn);
            tube((size / 5) * 2.875, 16, grill_support_thickness, this_fn);
            cylinder(h=16, d=size / 3, center=true, $fn=this_fn);

            rotate([0, 0, 0])
                cube([grill_support_thickness * 2, size, 16.2], center=true);
            rotate([0, 0, 60])
                cube([grill_support_thickness * 2, size, 16.2], center=true);
            rotate([0, 0, 120])
                cube([grill_support_thickness * 2, size, 16.2], center=true);
        }
    }
}

// Create fan screw holes relative to a center offset value relative to
// the dead-center of a rack faceplate.
module fan_screws(screw_centers, hole_diameter)
{
    rect_screws(screw_centers, screw_centers, hole_diameter);
}

// Create rectangular-pattern screw holes relative to a center offset value relative to
// the dead-center of a rack faceplate.
module rect_screws(screw_horizontal_centers, screw_vertical_centers, hole_diameter)
{
    translate([0 - (screw_horizontal_centers / 2), 0 - (screw_vertical_centers / 2), 3.5])
        rotate([0, 0, 90])
            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
    translate([0 + (screw_horizontal_centers / 2), 0 - (screw_vertical_centers / 2), 3.5])
        rotate([0, 0, 90])
            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
    translate([0 - (screw_horizontal_centers / 2), (screw_vertical_centers / 2), 3.5])
        rotate([0, 0, 90])
            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
    translate([0 + (screw_horizontal_centers / 2), (screw_vertical_centers / 2), 3.5])
        rotate([0, 0, 90])
            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
}

// Create an alignment pin hole (1.75mm) object for subtraction.
module alignment_pin_hole(xx, yy, zz)
{
    translate([xx, yy, zz])
        rotate([0, 90, 0])
            cylinder(d=1.75, h=8, $fn=this_fn, center=true);                      
}

// Create an attaching tab for connecting the halves of a split cage together.
module split_cage_attaching_tab(xx, yy, zz, flip=false, oversize=false)
{
    // Calculate how wide the holes need to be to produce a tab length of 20mm regardless of
    // screw size.
    slot_width = 20 - ((screw_clearance_hole * 3) / 2);

    translate([xx, yy, zz])
        difference()
        {
            translate([0, 0, 0])
                rotate([90, 0, 0])
                    linear_extrude(plate_thickness + 2 + (oversize ? snap_fit_tolerance : 0), center=true, twist=0, $fn=this_fn)
                        offset(r=(oversize ? snap_fit_tolerance : 0))
                            hull()
                            {
                                translate([0 - slot_width, 0, 0])
                                    circle(d=(screw_clearance_hole * 3), $fn=this_fn, false);
                                translate([slot_width, 0, 0])
                                    circle(d=(screw_clearance_hole * 3), $fn=this_fn, false);    
                            }

            translate([flip ? 0 - slot_width : slot_width, 0, 0])
                rotate([90, 90, 0])
                    linear_extrude(plate_thickness + 4, center=true, twist=0, $fn=this_fn)
                        circle(d=screw_clearance_hole, $fn=this_fn, false);    
        }
}



// END!
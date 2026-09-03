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

    Faceplate Modification Handlers

*/



// These are set up so that adding new mods is pretty easy - whatever mod is
// called for is basically created in place and in-lined by difference() and
// union() calls in other segments of the generation code.

// Faceplate modification subtractions (difference)
module faceplate_mod_subtraction(mod_type, horizontal_offset, vertical_offset, mod_width, mod_height, grid_rows, grid_columns)
{
    // Calculate the dimensions of the grid of mods to place, and cut both axes in
    // half - this will be our placement coordinate range for the mod grid.
    half_width = (mod_width * (grid_columns - 1)) / 2;
    half_height = (mod_height * (grid_rows - 1)) / 2;

    // Time to place the grid
    for(y_offset = [-half_height:mod_height:half_height])
        for(x_offset = [-half_width:mod_width:half_width])
        {
            // Keystone Receptacle - Lock-Down
            if (mod_type == "Keystone")
                place_keystone(horizontal_offset + x_offset, vertical_offset + 1.5 + y_offset, 0);

            // Keystone Receptacle - Lock-Up
            if (mod_type == "KeystoneFlipped")
                rotate([0, 0, 180])
                    // Because we're flipping the keystone object, we have to invert the X-axis 
                    // placement so it's positioned properly because the rotate call rotates about the
                    // placement axis, which is the center of the "world."
                    place_keystone(0 - horizontal_offset + x_offset, vertical_offset + 1.5 + y_offset, 0);

            // Neutrik D-Series Cutout
            if (mod_type == "DSeries")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=24, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    rect_screws(19, 24, 3.2);
            }
            
            
            // PC Motherboards - Rear IO
            if (mod_type == "RearIO")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cube([159, 44.7, 12], center=true);
            }
            
            // PC Motherboards - PCI Slot
            if (mod_type == "PCISlot")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset + 5, 5 + surface_thickness])
                    cube([12, 90, 12], center=true);
                translate([horizontal_offset + x_offset + 2.54, vertical_offset + y_offset + 60, 5 + surface_thickness])
                    cube([22, 5, 12], center=true);
            }
            
            // PC Motherboards - PCI Slot
            if (mod_type == "PCISlot_LP")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset + 5, 5 + surface_thickness])
                    cube([12, 55, 12], center=true);
                translate([horizontal_offset + x_offset + 2.54, vertical_offset + y_offset + 40, 5 + surface_thickness])
                    cube([22, 5, 12], center=true);
            }
            
            
            
            // 85x58 SBCs - Horizontal
            if (mod_type == "SBC85x58_H")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset - 1.75, 3 + (surface_thickness / 2)])
                    cube([56, 22, 3 + surface_thickness], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset - 3.0, 5 /*+ surface_thickness*/])
                    cube([54, 17, 12], center=true);
            }
            
            // 85x58 SBCs - Verical (Right Oriented)
            if (mod_type == "SBC85x58_VR")
            {
                translate([horizontal_offset + x_offset + 1.75, vertical_offset + y_offset, 3 + (surface_thickness / 2)])
                        cube([22, 56, 3 + surface_thickness], center=true);
                translate([horizontal_offset + x_offset + 3.0, vertical_offset + y_offset, 5 /*+ surface_thickness*/])
                        cube([17, 54, 12], center=true);
            }
            
            // 85x58 SBCs - Verical (Left Oriented)
            if (mod_type == "SBC85x58_VL")
            {
                translate([horizontal_offset + x_offset - 1.75, vertical_offset + y_offset, 3 + (surface_thickness / 2)])
                        cube([22, 56, 3 + surface_thickness], center=true);
                translate([horizontal_offset + x_offset - 3.0, vertical_offset + y_offset, 5 /*+ surface_thickness*/])
                        cube([17, 54, 12], center=true);
            }


            // 30mm fan
            if (mod_type == "30mmFan")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cube([30.2, 30.2, 3], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    fan_grill_cutout(30);
                    fan_screws(24, 2.4);
                }
            }

            // 40mm fan
            if (mod_type == "40mmFan")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cube([40.2, 40.2, 3], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    fan_grill_cutout(40);
                    fan_screws(32, 3.25);
                }
            }

            // 60mm fan
            if (mod_type == "60mmFan")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cube([60.2, 60.2, 3], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    fan_grill_cutout(60);
                    fan_screws(50, 3.25);
                }
            }

            // 80mm fan
            if (mod_type == "80mmFan")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cube([80.2, 80.2, 3], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    fan_grill_cutout(80);
                    fan_screws(71.5, 3.25);
                }
            }

            // 92mm fan
            if (mod_type == "92mmFan")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cube([92.2, 92.2, 3], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    fan_grill_cutout(92);
                    fan_screws(82.5, 4.4);
                }
            }

            // 120mm fan
            if (mod_type == "120mmFan")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cube([120.2, 120.2, 3], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    fan_grill_cutout(120);
                    fan_screws(105, 4.4);
                }
            }

            // 140mm fan
            if (mod_type == "140mmFan")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cube([140.2, 140.2, 3], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    fan_grill_cutout(140);
                    fan_screws(125, 4.4);
                }
            }


            // 10mm Hole (For Button/Light/etc.)
            if (mod_type == "10mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=10, center=true, $fn=this_fn);

            // 12mm Hole (For Button/Light/etc.)
            if (mod_type == "12mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=12, center=true, $fn=this_fn);

            // 16mm Hole (For Button/Light/etc.)
            if (mod_type == "16mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=16, center=true, $fn=this_fn);

            // 19mm Hole (For Button/Light/etc.)
            if (mod_type == "19mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=19, center=true, $fn=this_fn);

            // 24mm Hole (For Button/Light/etc.)
            if (mod_type == "24mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=24, center=true, $fn=this_fn);


            // VESA-B Mount - 20×50
            if (mod_type == "VESAB")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    rect_screws(50, 20, 4.2);

            // VESA-C Mount - 35×75
            if (mod_type == "VESAC")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    rect_screws(75, 35, 4.2);

            // VESA-D Mount - 50/75×75
            if (mod_type == "VESAD75")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    rect_screws(75, 50, 4.2);
                    rect_screws(75, 75, 4.2);
                }

            // VESA-D Mount - 50/100×100
            if (mod_type == "VESAD100")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    rect_screws(100, 50, 4.2);
                    rect_screws(100, 100, 4.2);
                }

            // VESA-E Mount - 50×200
            if (mod_type == "VESAE50")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    rect_screws(200, 50, 4.2);

            // VESA-E Mount - 100×200
            if (mod_type == "VESAE100")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    rect_screws(200, 100, 4.2);

            // VESA-F Mount - 200×200
            if (mod_type == "VESAF200")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    rect_screws(200, 200, 5.3);


            // 16A (20A NA) Power Inlet - 3-Wire
            if (mod_type == "16A3")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=50, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    fan_screws(47, 5.5);
            }

            // 16A (20A NA) Power Inlet - 4-7-Wire
            if (mod_type == "16A4")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=67, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    fan_screws(60, 5.5);
            }

            // 32A (30A NA) Power Inlet - 3-Wire
            if (mod_type == "32A3")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=71, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    fan_screws(60, 5.5);
            }

            // 32A (30A NA) Power Inlet - 4-7-Wire
            if (mod_type == "32A4")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                    cylinder(16, d=71, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    fan_screws(60, 5.5);
            }


            // C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal
            if (mod_type == "C13H")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([33, 26, plate_thickness + 2], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2 + 2])
                    cube([37, 30, plate_thickness], center=true);
            }

            // C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical
            if (mod_type == "C13V")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([26, 33, plate_thickness + 2], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2 + 2])
                    cube([30, 37, plate_thickness], center=true);
            }

            // C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal
            if (mod_type == "C14H")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([32.5, 25, plate_thickness + 2], center=true);
                translate([horizontal_offset - 20 + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cylinder(16, d=3.5, center=true, $fn=this_fn);
                translate([horizontal_offset + 20 + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cylinder(16, d=3.5, center=true, $fn=this_fn);
            }

            // C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical
            if (mod_type == "C14V")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([25, 32.5, plate_thickness + 2], center=true);
                translate([horizontal_offset + x_offset, -20 + vertical_offset + y_offset, plate_thickness / 2])
                    cylinder(16, d=3.5, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, 20 + vertical_offset + y_offset, plate_thickness / 2])
                    cylinder(16, d=3.5, center=true, $fn=this_fn);
            }

            // C19 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal
            if (mod_type == "C19H")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([37.5, 29.5, plate_thickness + 2], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2 + 2])
                    cube([41.5, 33.5, plate_thickness + 2], center=true);
            }

            // C19 IEC Power Socket/Outlet (Snap-In Mount) - Vertical
            if (mod_type == "C19V")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([29.5, 37.5, plate_thickness + 2], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2 + 2])
                    cube([33.5, 41.5, plate_thickness + 2], center=true);
            }

            // C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal
            if (mod_type == "C20H")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([33, 25, plate_thickness + 2], center=true);
                translate([horizontal_offset - 21 + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cylinder(16, d=3.5, center=true, $fn=this_fn);
                translate([horizontal_offset + 21 + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cylinder(16, d=3.5, center=true, $fn=this_fn);
            }

            // C20 IEC Power Socket/Outlet (Screw Mount) - Vertical
            if (mod_type == "C20V")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([25, 33, plate_thickness + 2], center=true);
                translate([horizontal_offset + x_offset, -21 + vertical_offset + y_offset, plate_thickness / 2])
                    cylinder(16, d=3.5, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, 21 + vertical_offset + y_offset, plate_thickness / 2])
                    cylinder(16, d=3.5, center=true, $fn=this_fn);
            }


            // 1/32-DIN Cutout (Horizontal)
            if (mod_type == "DIN1/32H")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([45, 22.5, plate_thickness + 2], center=true);

            // 1/16-DIN Cutout
            if (mod_type == "DIN1/16")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([45, 45, plate_thickness + 2], center=true);

            // 1/8-DIN Cutout (Horizontal)
            if (mod_type == "DIN1/8H")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([92, 45, plate_thickness + 2], center=true);

            // 1/8-DIN Cutout (Vertical)
            if (mod_type == "DIN1/8V")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([45, 92, plate_thickness + 2], center=true);

            // 1/4-DIN Cutout
            if (mod_type == "DIN1/4")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                    cube([92, 92, plate_thickness + 2], center=true);


            // Custom cutouts

            // Custom Cutout A
            if (mod_type == "CustomA")
            {
                corner_radius_max = min(custom_cutout_a_width, custom_cutout_a_diameter_height) / 2 - 1;
                corner_radius = custom_cutout_a_corner_radius <= corner_radius_max ? custom_cutout_a_corner_radius : corner_radius_max;
                if (custom_cutout_a_shape == "Round")
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                        cylinder(16, d=custom_cutout_a_diameter_height, center=true, $fn=this_fn);
                    if (custom_cutout_a_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 4 + surface_thickness])
                            cylinder(plate_thickness, d=custom_cutout_a_diameter_height + 6, center=true, $fn=this_fn);
                }
                else
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness - 1])
                        four_rounded_corner_plate(custom_cutout_a_diameter_height, custom_cutout_a_width, plate_thickness * 2, corner_radius);
                    if (custom_cutout_a_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, (plate_thickness / 2) + 2])
                            four_rounded_corner_plate(custom_cutout_a_diameter_height + 6, custom_cutout_a_width + 6, plate_thickness, corner_radius);
                }
            }

            // Custom Cutout B
            if (mod_type == "CustomB")
            {
                corner_radius_max = min(custom_cutout_b_width, custom_cutout_b_diameter_height) / 2 - 1;
                corner_radius = custom_cutout_b_corner_radius <= corner_radius_max ? custom_cutout_b_corner_radius : corner_radius_max;
                if (custom_cutout_b_shape == "Round")
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                        cylinder(16, d=custom_cutout_b_diameter_height, center=true, $fn=this_fn);
                    if (custom_cutout_b_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 4 + surface_thickness])
                            cylinder(plate_thickness, d=custom_cutout_b_diameter_height + 6, center=true, $fn=this_fn);
                }
                else
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness - 1])
                        four_rounded_corner_plate(custom_cutout_b_diameter_height, custom_cutout_b_width, plate_thickness * 2, corner_radius);
                    if (custom_cutout_b_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, (plate_thickness / 2) + 2])
                            four_rounded_corner_plate(custom_cutout_b_diameter_height + 6, custom_cutout_b_width + 6, plate_thickness, corner_radius);
                }
            }

            // Custom Cutout C
            if (mod_type == "CustomC")
            {
                corner_radius_max = min(custom_cutout_c_width, custom_cutout_c_diameter_height) / 2 - 1;
                corner_radius = custom_cutout_c_corner_radius <= corner_radius_max ? custom_cutout_c_corner_radius : corner_radius_max;
                if (custom_cutout_c_shape == "Round")
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + surface_thickness])
                        cylinder(16, d=custom_cutout_c_diameter_height, center=true, $fn=this_fn);
                    if (custom_cutout_c_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 4 + surface_thickness])
                            cylinder(plate_thickness, d=custom_cutout_c_diameter_height + 6, center=true, $fn=this_fn);
                }
                else
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness - 1])
                        four_rounded_corner_plate(custom_cutout_c_diameter_height, custom_cutout_c_width, plate_thickness * 2, corner_radius);
                    if (custom_cutout_c_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, (plate_thickness / 2) + 2])
                            four_rounded_corner_plate(custom_cutout_c_diameter_height + 6, custom_cutout_c_width + 6, plate_thickness, corner_radius);
                }
            }
    }
}

// Faceplate modification additions (union)
module faceplate_mod_addition(mod_type, horizontal_offset, vertical_offset, mod_width, mod_height, grid_rows, grid_columns)
{
    // Calculate the dimensions of the grid of mods to place, and cut both axes in
    // half - this will be our placement coordinate range for the mod grid.
    half_width = (mod_width * (grid_columns - 1)) / 2;
    half_height = (mod_height * (grid_rows - 1)) / 2;

    // Time to place the grid
    for(y_offset = [-half_height:mod_height:half_height])
        for(x_offset = [-half_width:mod_width:half_width])
        {
            // Common addition: place a solid cuboid covering the total size of the
            // mod - this solidifies the mod's area when placed onto a ventilated
            // region of faceplate.
            //
            // Mods that don't need any additional structure won't need any
            // additions here.
            translate([horizontal_offset + x_offset, vertical_offset + y_offset, plate_thickness / 2])
                cube([mod_width, mod_height, plate_thickness], center=true);

            // Uncommon additions follow...

            // Keystone Receptacle(s)
            // NOTE: The "5.5001" Z-axis translate is to produce a clean pre-render without
            // the flicker effect OpenSCAD has when two planes overlap precisely.
            if (mod_type == "Keystone")
                translate([horizontal_offset + x_offset, vertical_offset + 2.5 + y_offset, 5.5001])
                    cube([19, 28, 11], center=true);
            if (mod_type == "KeystoneFlipped")
                translate([horizontal_offset + x_offset, vertical_offset - 2.5 + y_offset, 5.5001])
                    cube([19, 28, 11], center=true);


            // 85x58 SBCs - Horizontal
            if (mod_type == "SBC85x58_H")
            {
                // Support frame
                difference()
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset + 11.25, 46.5 /*+ surface_thickness*/])
                        rotate([90, 0, 0])
                            ventilated_side_plate(87, 58, 4, 10, 5, 5, false);

                    // Through holes for support screws
                    translate([horizontal_offset + x_offset + 24.5, vertical_offset + y_offset + 8.1, 26.5 /*+ surface_thickness*/])
                        rotate([0, 90, 90])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset - 24.5, vertical_offset + y_offset + 8.1, 26.5 /*+ surface_thickness*/])
                        rotate([0, 90, 90])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset + 24.5, vertical_offset + y_offset + 8.1, 84.5 /*+ surface_thickness*/])
                        rotate([0, 90, 90])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset - 24.5, vertical_offset + y_offset + 8.1, 84.5 /*+ surface_thickness*/])
                        rotate([0, 90, 90])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                }
                
                // M2 screw bosses, 4mm tall, 49x58mm pattern
                translate([horizontal_offset + x_offset + 24.5, vertical_offset + y_offset + 8.1, 26.5 /*+ surface_thickness*/])
                    rotate([0, 90, 90])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset - 24.5, vertical_offset + y_offset + 8.1, 26.5 /*+ surface_thickness*/])
                    rotate([0, 90, 90])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset + 24.5, vertical_offset + y_offset + 8.1, 84.5 /*+ surface_thickness*/])
                    rotate([0, 90, 90])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset - 24.5, vertical_offset + y_offset + 8.1, 84.5 /*+ surface_thickness*/])
                    rotate([0, 90, 90])
                        tube(4, 4, 1.2, this_fn, true);
            }

            // 85x58 SBCs - Vertical (Right Oriented)
            if (mod_type == "SBC85x58_VR")
            {
                // Support frame
                difference()
                {
                    translate([horizontal_offset + x_offset - 11.25, vertical_offset + y_offset, 46.5 /*+ surface_thickness*/])
                        rotate([90, 0, 90])
                            ventilated_side_plate(87, 58, 4, 10, 5, 5, false);
                
                    // Through holes for support screws
                    translate([horizontal_offset + x_offset - 8.1, vertical_offset + y_offset + 24.5, 26.5 /*+ surface_thickness*/])
                        rotate([0, 270, 0])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset - 8.1, vertical_offset + y_offset - 24.5, 26.5 /*+ surface_thickness*/])
                        rotate([0, 270, 0])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset - 8.1, vertical_offset + y_offset + 24.5, 84.5 /*+ surface_thickness*/])
                        rotate([0, 270, 0])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset - 8.1, vertical_offset + y_offset - 24.5, 84.5 /*+ surface_thickness*/])
                        rotate([0, 270, 0])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                }
                // M2 screw bosses, 4mm tall, 49x58mm pattern
                translate([horizontal_offset + x_offset - 8.1, vertical_offset + y_offset + 24.5, 26.5 /*+ surface_thickness*/])
                    rotate([0, 270, 0])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset - 8.1, vertical_offset + y_offset - 24.5, 26.5 /*+ surface_thickness*/])
                    rotate([0, 270, 0])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset - 8.1, vertical_offset + y_offset + 24.5, 84.5 /*+ surface_thickness*/])
                    rotate([0, 270, 0])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset - 8.1, vertical_offset + y_offset - 24.5, 84.5 /*+ surface_thickness*/])
                    rotate([0, 270, 0])
                        tube(4, 4, 1.2, this_fn, true);
            }

            // 85x58 SBCs - Vertical (Left Oriented)
            if (mod_type == "SBC85x58_VL")
            {
                // Support frame
                difference()
                {
                    translate([horizontal_offset + x_offset + 11.25, vertical_offset + y_offset, 46.5 /*+ surface_thickness*/])
                        rotate([90, 0, 90])
                            ventilated_side_plate(87, 58, 4, 10, 5, 5, false);
                
                    // Through holes for support screws
                    translate([horizontal_offset + x_offset + 8.1, vertical_offset + y_offset + 24.5, 26.5 /*+ surface_thickness*/])
                        rotate([0, 90, 0])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset + 8.1, vertical_offset + y_offset - 24.5, 26.5 /*+ surface_thickness*/])
                        rotate([0, 90, 0])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset + 8.1, vertical_offset + y_offset + 24.5, 84.5 /*+ surface_thickness*/])
                        rotate([0, 90, 0])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                    translate([horizontal_offset + x_offset + 8.1, vertical_offset + y_offset - 24.5, 84.5 /*+ surface_thickness*/])
                        rotate([0, 90, 0])
                            cylinder(h=12, d=1.6, center=true, $fn=this_fn);
                }

                // M2 screw bosses, 4mm tall, 49x58mm pattern
                translate([horizontal_offset + x_offset + 8.1, vertical_offset + y_offset + 24.5, 26.5 /*+ surface_thickness*/])
                    rotate([0, 90, 0])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset + 8.1, vertical_offset + y_offset - 24.5, 26.5 /*+ surface_thickness*/])
                    rotate([0, 90, 0])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset + 8.1, vertical_offset + y_offset + 24.5, 84.5 /*+ surface_thickness*/])
                    rotate([0, 90, 0])
                        tube(4, 4, 1.2, this_fn, true);
                translate([horizontal_offset + x_offset + 8.1, vertical_offset + y_offset - 24.5, 84.5 /*+ surface_thickness*/])
                    rotate([0, 90, 0])
                        tube(4, 4, 1.2, this_fn, true);
            }
        }
}



// END!
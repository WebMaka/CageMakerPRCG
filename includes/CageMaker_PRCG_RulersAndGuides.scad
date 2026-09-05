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

    Rulers and Guides

*/



// Create ruler and build outline.
module ruler_and_outline(unit_height)
{
    // Set up a couple variables.
    rack_cage_width_mm = to_mm(rack_cage_width);
    half_build_outline = show_build_outline / 2;

    // Optional build outline
    if (show_build_outline > 0)
    {
        color("red", 0.25)
        {
            translate([half_build_outline, half_build_outline, 0])
                    sphere(d=5, $fn = this_fn);
            translate([0 - half_build_outline, half_build_outline, 0])
                    sphere(d=5, $fn = this_fn);
            translate([half_build_outline, 0 - half_build_outline, 0])
                    sphere(d=5, $fn = this_fn);
            translate([0 - half_build_outline, 0 - half_build_outline, 0])
                    sphere(d=5, $fn = this_fn);
            translate([half_build_outline, half_build_outline, show_build_outline])
                    sphere(d=5, $fn = this_fn);
            translate([0 - half_build_outline, half_build_outline, show_build_outline])
                    sphere(d=5, $fn = this_fn);
            translate([half_build_outline, 0 - half_build_outline, show_build_outline])
                    sphere(d=5, $fn = this_fn);
            translate([0 - half_build_outline, 0 - half_build_outline, show_build_outline])
                    sphere(d=5, $fn = this_fn);
            translate([0, half_build_outline, 0])
                cube([show_build_outline, 1, 1], center=true);
            translate([0, 0 - half_build_outline, 0])
                cube([show_build_outline, 1, 1], center=true);
            translate([half_build_outline, 0, 0])
                cube([1, show_build_outline, 1], center=true);
            translate([0 - half_build_outline, 0, 0])
                cube([1, show_build_outline, 1], center=true);
            translate([0, half_build_outline, show_build_outline])
                cube([show_build_outline, 1, 1], center=true);
            translate([0, 0 - half_build_outline, show_build_outline])
                cube([show_build_outline, 1, 1], center=true);
            translate([half_build_outline, 0, show_build_outline])
                cube([1, show_build_outline, 1], center=true);
            translate([0 - half_build_outline, 0, show_build_outline])
                cube([1, show_build_outline, 1], center=true);

            translate([half_build_outline, half_build_outline, half_build_outline])
                cube([1, 1, show_build_outline], center=true);
            translate([half_build_outline, 0 - half_build_outline, half_build_outline])
                cube([1, 1, show_build_outline], center=true);
            translate([0 - half_build_outline, half_build_outline, half_build_outline])
                cube([1, 1, show_build_outline], center=true);
            translate([0 - half_build_outline, 0 - half_build_outline, half_build_outline])
                cube([1, 1, show_build_outline], center=true);
        }

        color("white")
            translate([0, 0 - half_build_outline - 15, 0])
            four_rounded_corner_plate(12, 100, 2, 5);
        color("blue", 0.75)
            translate([0, 0 - (half_build_outline) - 16, 1])
                linear_extrude(height=1, center=true)
                    text(str(show_build_outline, "mm^3 BUILD VOLUME"), halign="center", valign="center", size=5);   
    }

    if (!split_cage_into_two_halves)
        translate([0, ((print_cage_separately || safe_generate_rear_support_cage) ? 0 - (unit_height * unit_height_in_mm) / 2 - 5 : 0), 0])
        {    
            // Create dead zone indicators for the mounting area reservations on either side of
            // the faceplate. 
            translate([rack_cage_width_mm / 2 - (mounting_reservation_space / 2), 0, surface_thickness + 4.5])
                color("red", 1)
                    intersection()
                    {
                        cube([mounting_reservation_space, unit_height * unit_height_in_mm, 0.1], center=true);
                        for (y = [0 - (unit_height * unit_height_in_mm) : 5 : (unit_height * unit_height_in_mm)])
                            translate([0, (unit_height * unit_height_in_mm) / 2 + y - 5, 0])
                                rotate([0, 0, 45])
                                        cube([mounting_reservation_space * 2, 1, 1], center=true);
                    }
            translate([0 - (rack_cage_width_mm / 2) + (mounting_reservation_space / 2), 0, surface_thickness + 4.5])
                color("red", 1)
                    intersection()
                    {
                        cube([mounting_reservation_space, unit_height * unit_height_in_mm, 0.1], center=true);
                        for (y = [0 - (unit_height * unit_height_in_mm) : 5 : (unit_height * unit_height_in_mm)])
                            translate([0, (unit_height * unit_height_in_mm) / 2 + y - 5, 0])
                                rotate([0, 0, 45])
                                    cube([mounting_reservation_space * 2, 1, 1], center=true);
                    }

            // Show a callout for the dead zone indicator.
            translate([0 - (rack_cage_width_mm / 2) - 28, 4, 1])
                color("red")
                    linear_extrude(height=1, center=true)
                        text(str(mounting_reservation_space,"mm AREA RESERVED ON"), halign="right", valign="center", size=5);   
            translate([0 - (rack_cage_width_mm / 2) - 28, -4, 1])
                color("red")
                    linear_extrude(height=1, center=true)
                        text("EACH SIDE FOR MOUNTING", halign="right", valign="center", size=5);
            translate([0 - (rack_cage_width_mm / 2) - 79, 0, 0])
                color("white", 0.5)
                    four_rounded_corner_plate(20, 110, 2, 2);
            translate([0 - (rack_cage_width_mm / 2) - 79, 0, -1])
                color("white")
                    four_rounded_corner_plate(20, 110, 2, 1);
            translate([0 - (rack_cage_width_mm / 2) - 79, 0, 0.5])
                color("red", 0.25)
                    intersection()
                    {
                        four_rounded_corner_plate(20, 110, 0.5, 2.5);
                        for (y = [0 - (unit_height * unit_height_in_mm) : 5 : (unit_height * unit_height_in_mm)])
                            translate([25, (unit_height * unit_height_in_mm) / 2 + y, 0])
                                rotate([0, 0, 45])
                                        cube([250, 1, 1], center=true);
                    }

            // Create the horizontal-axis ruler grid
            for (i= [0 - ceil((rack_cage_width_mm / 2) / 5) * 5:5:ceil((rack_cage_width_mm / 2) / 5) * 5])
            {
                translate([i, 0, 6 + surface_thickness])
                {
                    if (i % 10 == 0)
                        color("red", 0.5)
                            cube([0.1, unit_height * unit_height_in_mm + 10, 1], center=true);
                    else
                        color("maroon", 0.5)
                            cube([0.1, unit_height * unit_height_in_mm + 3, 0.5], center=true);
                    if (i % 25 == 0)
                    {
                        translate([i / (rack_cage_width_mm / 2), (unit_height * unit_height_in_mm) / 2 + 9, 0.5 + surface_thickness])
                            color("red")
                                linear_extrude(height=1, center=true)
                                    text(str(i), halign="center", valign="center", size=5);   
                        translate([i / (rack_cage_width_mm / 2), 0 - (unit_height * unit_height_in_mm) / 2 - 9, 0.5 + surface_thickness])
                            color("red")
                                linear_extrude(height=1, center=true)
                                    text(str(i), halign="center", valign="center", size=5);
                        translate([i / (rack_cage_width_mm / 2), (unit_height * unit_height_in_mm) / 2 + 9, surface_thickness])
                            color("white")
                                four_rounded_corner_plate(10, 16, 1, 2.5);
                        translate([i / (rack_cage_width_mm / 2), 0 - (unit_height * unit_height_in_mm) / 2 - 9, surface_thickness])
                            color("white")
                                four_rounded_corner_plate(10, 16, 1, 2.5);
                    }
                }
            }

            // Create the vertical-axis ruler grid
            for (i= [0- ceil(((unit_height * unit_height_in_mm) / 2) / 5) * 5 - expand_faceplate_upward :5:ceil(((unit_height * unit_height_in_mm) / 2) / 5) * 5 + expand_faceplate_downward])
            {
                translate([0, i, 6 + surface_thickness])
                {
                    if (i % 10 == 0)
                        color("green", 0.5)
                            cube([rack_cage_width_mm + 10, 0.1, 1], center=true);
                    else
                        color("darkgreen", 0.5)
                            cube([rack_cage_width_mm + 3, 0.1, 0.5], center=true);
                    if (i % 25 == 0)
                    {
                        translate([(rack_cage_width_mm / 2) + 12, i / (unit_height * unit_height_in_mm / 2), 0.5 + surface_thickness])
                            color("green")
                                linear_extrude(height=1, center=true)
                                    text(str(i), halign="center", valign="center", size=5);   
                        translate([(0 - rack_cage_width_mm / 2) - 12, i / (unit_height * unit_height_in_mm / 2 - 9), 0.5 + surface_thickness])
                            color("green")
                                linear_extrude(height=1, center=true)
                                    text(str(i), halign="center", valign="center", size=5);
                        translate([(rack_cage_width_mm / 2) + 12,  i / (unit_height * unit_height_in_mm / 2 + 9), surface_thickness])
                            color("white")
                                four_rounded_corner_plate(10, 16, 1, 2.5);
                        translate([0 - (rack_cage_width_mm / 2) - 12,  i / (unit_height * unit_height_in_mm / 2 + 9), surface_thickness])
                            color("white")
                                four_rounded_corner_plate(10, 16, 1, 2.5);
                    }
                }
            }


            // Show markers to indicate which way is "up" for the cage.
            translate([0, 0 - (unit_height * unit_height_in_mm) / 2 - 30, 1])
                color("red")
                    linear_extrude(height=1, center=true)
                        text("CAGE TOP", halign="center", valign="center", size=5);
            translate([0, 0 - (unit_height * unit_height_in_mm) / 2 - 30, 0])
                            color("white")
                                four_rounded_corner_plate(10, 50, 2, 2.5);
            translate([0, 0 - (unit_height * unit_height_in_mm) / 2 - 30, -1])
            rotate([0, 180, 180])
                color("red")
                    linear_extrude(height=1, center=true)
                        text("CAGE TOP", halign="center", valign="center", size=5);


            // Show the cage's height in units.
            translate([(to_mm(rack_cage_width) / 2) + 25, 4, 1])
                color("green")
                    linear_extrude(height=1, center=true)
                        text(str(unit_height, "U"), halign="left", valign="center", size=5);   
            translate([(to_mm(rack_cage_width) / 2) + 25, -4, 1])
                color("green")
                    linear_extrude(height=1, center=true)
                        text("UNIT HEIGHT", halign="left", valign="center", size=5);
            translate([(to_mm(rack_cage_width) / 2) + 46, 0, 0])
                color("white")
                    four_rounded_corner_plate(20, 50, 2, 2.5);
        }
}

// Create and position a horizontal marker for positioning modifications.
// (Show a marker to indicate where a modification is horizontally centered.)
module mod_offset_marker(marker_offset, marker_height, units_required, marker_label,auto_marker=false)
{
    if ((show_ruler) && ($preview) && (!split_cage_into_two_halves))
    {
        translate([0, ((print_cage_separately || safe_generate_rear_support_cage) ? 0 - (units_required * unit_height_in_mm) / 2 - 5 : 0), 0])
        {
            translate([marker_offset, 0, marker_height])
                color("green")
                    cube([1, (units_required * unit_height_in_mm) + 15, 1], center=true);
            translate([marker_offset, 0 - (units_required * unit_height_in_mm) / 2 - 13, marker_height + 1])
                translate([0, 0, 0])
                    scale([0.5, 0.5, 1.0])
                        color("green")
                            linear_extrude(height=1, center=true)
                                text(str(marker_offset, auto_marker ? " (AUTO)" : ""), halign="center");
            translate([marker_offset, 0 - (units_required * unit_height_in_mm) / 2 - 20, marker_height + 1])
                translate([0, 0, 0])
                    scale([0.5, 0.5, 1.0])
                        color("green")
                            linear_extrude(height=1, center=true)
                                text(marker_label, halign="center");   
            translate([marker_offset, 0 - (units_required * unit_height_in_mm) / 2 - 14, marker_height])
                    color("white")
                        four_rounded_corner_plate(16, 80, 2, 5);
        }
    }
}

// Create a marker to show the print height (z-axis).
module print_height_marker(marker_height)
{
    rack_cage_width_mm = to_mm(rack_cage_width);

    // Determine the height in units that will be required to accommodate the device
    // to be caged, or, set the unit height to the faceplate_only setting.
    total_height_required = device_height + support_cage_base_size + (plate_thickness * 2);
    height_required_in_units = faceplate_only == 0.0 ? (ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1) : faceplate_only;
    height_required_in_mm = height_required_in_units * unit_height_in_mm;

    translate([0, (print_cage_separately ? height_required_in_mm + 5 : 0), marker_height])
        color("blue")
            cube([ceil(rack_cage_width_mm / 5) * 5, 1, 1], center=true);
    translate([(rack_cage_width_mm / 2) + 4, (print_cage_separately ? height_required_in_mm + 5 + 4 : 4), marker_height + 1])
        color("blue")
            linear_extrude(height=1, center=true)
                text(str(marker_height, "mm"), halign="left", valign="center", size=5);   
    translate([(rack_cage_width_mm / 2) + 4, (print_cage_separately ? height_required_in_mm + 5 - 4 : -4), marker_height + 1])
        color("blue")
            linear_extrude(height=1, center=true)
                text("PRINT HEIGHT", halign="left", valign="center", size=5);   
    translate([(rack_cage_width_mm / 2) + 28, (print_cage_separately ? height_required_in_mm + 5 : 0), marker_height])
            color("white")
                four_rounded_corner_plate(18, 56, 2, 5);
}



// END!
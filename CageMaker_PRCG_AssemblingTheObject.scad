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

    Assembling The Object ...

*/



// Create a faceplate and punch things out of it as required.
module create_faceplate(height_in_units, width_in_mm, left_ear=false, right_ear=false)
{
    // Determine the working area for the grid if we're creating one. Note that we will
    // avoid the top and bottom edges and mounting area behind both sides/ears.
    grid_height = (height_in_units * unit_height_in_mm) - (plate_thickness * 2);
    grid_width = width_in_mm - (mounting_reservation_space * 2);

    // Determine whether we're working with a half-unit-multiple height.
    // We have two different ways we can do this.
    //half_unit = (round(height_in_units) - unit_height == 0.5); // Integer subtraction
    half_unit = (height_in_units % 1 == 0.5); // Modulus checking

    // Origin Y coordinate for top edge of cage - used for offsets for things like
    // screw holes/slots.
    top_edge = 0 - ((height_in_units * unit_height_in_mm) / 2);

    // Determine the height and width of cage(s).
    cage_width = (device_width + (plate_thickness * 2) + support_cage_base_size);
    total_cage_width = (cage_width * number_of_devices) + (multiple_device_gap * (number_of_devices - 1));
    cage_height = device_height + (plate_thickness * 2) + support_cage_base_size;


    // Note that this process uses union/difference/union - the inner unions builds the faceplate,
    // the differences carve it out, and the outer unions finalize things such as ventilation
    // and faceplate modifications.
    union()
    {
        difference()
        {
            union()
            {
                // Create the actual faceplate.
                four_rounded_corner_plate(height_in_units * unit_height_in_mm, width_in_mm, plate_thickness, faceplate_radius);

                // Expand the faceplate upward/downward - this is accomplished via brute-force by
                // duplicating the faceplate with offsets. Note that none of the modifications to
                // or cutouts from the faceplate are moved during this process.
                if (expand_faceplate_upward > 0)
                    translate([0, 0 - expand_faceplate_upward, 0])
                        four_rounded_corner_plate(height_in_units * unit_height_in_mm, width_in_mm, plate_thickness, faceplate_radius);

                if (expand_faceplate_downward > 0)
                    translate([0, expand_faceplate_downward, 0])
                        four_rounded_corner_plate(height_in_units * unit_height_in_mm, width_in_mm, plate_thickness, faceplate_radius);

                // Add right-angle mounting ears if making bolt-together partial-width cages.
                if (left_ear)
                    translate([0 - (width_in_mm / 2) + 3, 0, (plate_thickness + 16) / 2 - (plate_thickness / 2)])
                        rotate([90, 0, 90])
                            two_rounded_corner_plate(plate_thickness + 16, height_in_units * unit_height_in_mm, 6, faceplate_radius);

                if (right_ear)
                    translate([(width_in_mm / 2) - 3, 0, (plate_thickness + 16) / 2 - (plate_thickness / 2)])
                        rotate([90, 0, 90])
                            two_rounded_corner_plate(plate_thickness + 16, height_in_units * unit_height_in_mm, 6, faceplate_radius);

                // Faceplate reinforcing
                if (reinforce_faceplate)
                {
                    translate([0 + (left_ear ? 8 : 15.875) - (right_ear ? 8 : 15.875), (height_in_units * unit_height_in_mm) / 2 - (plate_thickness / 2), ((plate_thickness + 6) / 2)])
                        rotate([90, 0, 0])
                            two_rounded_corner_plate(plate_thickness + 6, width_in_mm - (left_ear ? 0 : 15.875) - (right_ear ? 0 : 15.875), plate_thickness, faceplate_radius);

                    translate([0 + (left_ear ? 8 : 15.875) - (right_ear ? 8 : 15.875), 0 - (height_in_units * unit_height_in_mm) / 2 + (plate_thickness / 2), ((plate_thickness + 6) / 2)])
                        rotate([90, 0, 0])
                            two_rounded_corner_plate(plate_thickness + 6, width_in_mm - (left_ear ? 0 : 15.875) - (right_ear ? 0 : 15.875), plate_thickness, faceplate_radius);
                }
            } // union end


            // At this point, the faceplate's structure generation should be complete. The next steps
            // will remove material to produce the completed faceplate sans cutout(s) for device(s). 


            // Faceplate screw slots - by default these are set to EIA-310 standard 
            // 1/2-5/8-5/8 center spacing, sized for 10-24/M5 screws.
            // 
            // If we're not doing only the top/bottom holes, populate every hole.
            if ((!top_and_bottom_holes_only) || (vertically_shift_mounting_holes))
            {
                // Note that we're deliberately overshooting by a full unit more, above AND below, than
                // the actual number of units required for this faceplate. This allows for vertical hole
                // shifting of up to a full unit.
                for (unit_number = [-1:round(height_in_units)])
                {
                    for (y = mounting_hole_pattern)
                    {
                        if (left_ear)
                        {
                            // If a bolt-together ear is enabled on this side, punch bolt holes
                            // into the ear based on the tap or heat set hole parameter instead
                            // of adding slots for screw holes
                            translate([0 - ((width_in_mm / 2) - plate_thickness), top_edge + (unit_number * unit_height_in_mm) + y + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), plate_thickness + 8])
                                rotate([0, 90, 0])
                                if (tap_or_heat_set_holes == 0.00)
                                    cylinder(d=5.5, h=plate_thickness + 8, $fn=this_fn, center=true);
                                else
                                    cylinder(d=tap_or_heat_set_holes, h=plate_thickness + 8, $fn=this_fn, center=true);
                            // Optionally, add alignment pin holes if the option is enabled.
                            if (add_alignment_pin_holes)
                                alignment_pin_hole(0 - (width_in_mm / 2) + 2, top_edge + (unit_number * unit_height_in_mm) + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0) + y, 0);

                        }
                        else
                            // If there isn't an ear on this side, create screw holes normally.
                            faceplate_screw_hole_slot(mounting_hole_diameter, 0 - ((width_in_mm / 2) - (mounting_hole_center_difference / 2)), top_edge + (unit_number * unit_height_in_mm) + y + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);

                        if (right_ear)
                        {
                            translate([((width_in_mm / 2) - plate_thickness), top_edge + (unit_number * unit_height_in_mm) + y, plate_thickness + 8])
                                rotate([0, 90, 0])
                                if (tap_or_heat_set_holes == 0.00)
                                    cylinder(d=5.5, h=plate_thickness + 8, $fn=this_fn, center=true);
                                else
                                    cylinder(d=tap_or_heat_set_holes, h=plate_thickness + 8, $fn=this_fn, center=true);
                            // Optionally, add alignment pin holes if the option is enabled.
                            if (add_alignment_pin_holes)
                                alignment_pin_hole((width_in_mm / 2) - 2, top_edge + (unit_number * unit_height_in_mm) + y + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);

                        }
                        else
                            faceplate_screw_hole_slot(mounting_hole_diameter, ((width_in_mm / 2) - (mounting_hole_center_difference / 2)),top_edge + (unit_number * unit_height_in_mm) + y + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                    }
                }
            }
            else
            {
                // If we're only placing top and bottom holes, the situation is a little more
                // complicated - we have to either use the bottom hole of the bottom-most unit
                // OR the topmost hole on the bottom-most unit if it's a half-unit multiple.
                // And the situation becomes even more complicated if we're shifting the mounting
                // holes, as that suddenly throws everything off.
                if (left_ear)
                {
                    translate([0 - ((width_in_mm / 2) - plate_thickness), top_edge + mounting_hole_pattern[0] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), plate_thickness + 8])
                        rotate([0, 90, 0])
                        if (tap_or_heat_set_holes == 0.00)
                            cylinder(d=5.5, h=plate_thickness + 8, $fn=this_fn, center=true);
                        else
                            cylinder(d=tap_or_heat_set_holes, h=plate_thickness + 8, $fn=this_fn, center=true);
                    translate([0 - ((width_in_mm / 2) - plate_thickness), top_edge + ((round(height_in_units) - 1) * unit_height_in_mm) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), plate_thickness + 8])
                        rotate([0, 90, 0])
                        if (tap_or_heat_set_holes == 0.00)
                            cylinder(d=5.5, h=plate_thickness + 8, $fn=this_fn, center=true);
                        else
                            cylinder(d=tap_or_heat_set_holes, h=plate_thickness + 8, $fn=this_fn, center=true);

                    if (add_alignment_pin_holes)
                    {
                        alignment_pin_hole(0 - (width_in_mm / 2) + 2, top_edge + mounting_hole_pattern[0] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                        alignment_pin_hole(0 - (width_in_mm / 2) + 2, top_edge + ((round(height_in_units) - 1) * unit_height_in_mm) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                    }
                }
                else
                {
                    faceplate_screw_hole_slot(mounting_hole_diameter, 0 - ((width_in_mm / 2) - 8), top_edge + mounting_hole_pattern[0] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                    faceplate_screw_hole_slot(mounting_hole_diameter, 0 - ((width_in_mm / 2) - 8), top_edge + ((round(height_in_units) - 1) * unit_height_in_mm) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                }

                if (right_ear)
                {
                    translate([(width_in_mm / 2) - plate_thickness, top_edge + mounting_hole_pattern[0] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), plate_thickness + 8])
                        rotate([0, 90, 0])
                        if (tap_or_heat_set_holes == 0.00)
                            cylinder(d=5.5, h=plate_thickness + 8, $fn=this_fn, center=true);
                        else
                            cylinder(d=tap_or_heat_set_holes, h=plate_thickness + 8, $fn=this_fn, center=true);
                    translate([(width_in_mm / 2) - plate_thickness, top_edge + ((round(height_in_units) - 1) * unit_height_in_mm) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), plate_thickness + 8])
                        rotate([0, 90, 0])
                        if (tap_or_heat_set_holes == 0.00)
                            cylinder(d=5.5, h=plate_thickness + 8, $fn=this_fn, center=true);
                        else
                            cylinder(d=tap_or_heat_set_holes, h=plate_thickness + 8, $fn=this_fn, center=true);

                    if (add_alignment_pin_holes)
                    {
                        alignment_pin_hole((width_in_mm / 2) - 2, top_edge + mounting_hole_pattern[0] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                        alignment_pin_hole((width_in_mm / 2) - 2, top_edge + ((round(height_in_units) - 1) * unit_height_in_mm) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                    }
                }
                else
                {
                    faceplate_screw_hole_slot(mounting_hole_diameter, (width_in_mm / 2) - 8, top_edge + mounting_hole_pattern[0] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                    faceplate_screw_hole_slot(mounting_hole_diameter, (width_in_mm / 2 - 8), top_edge + ((round(height_in_units) - 1) * unit_height_in_mm) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1] + (vertically_shift_mounting_holes ? unit_height_in_mm / 2 : 0), 0);
                }
            }

            // Carve out a region for ventilation if a grid type is selected.
            if (faceplate_vent_hole_pattern != "None")
                four_rounded_corner_plate(grid_height, grid_width, plate_thickness + 2, 5);
        } // difference end

        // Create a ventilation grid and insert it into the hole we carved into the 
        // faceplate earlier.
        //
        // NOTE: We have deliberately chosen to have each grid generator module use
        // the exact same parameters, so that additional grids can be added easily.
        if (faceplate_vent_hole_pattern != "None")
            create_ventilation_grid(faceplate_vent_hole_pattern, grid_width + 2, grid_height + 2, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset);


        // Handle faceplate ventilation grid restrictions if enabled. Note
        // that we will center restrictions on the cage, shifting them to
        // keep with any offsets as required.
        if ((faceplate_vent_hole_pattern != "None") && (faceplate_vent_position != "All") && (faceplate_only == 0.0))
            translate([faceplate_vent_position == "S" ? cage_horizontal_offset : 0, faceplate_vent_position == "S" ? 0 : cage_vertical_offset, 0])
                cube([faceplate_vent_position == "S" ? total_cage_width : grid_width + 2, faceplate_vent_position == "S" ? grid_height + 2 : cage_height, plate_thickness], center=true);


        // Add reinforcing to the faceplate around where each cage will fit.
        if (faceplate_only == 0.0)
        {
            translate([0 - ((cage_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, plate_thickness / 2 + 1])
                union()
                {
                    for (index = [1:number_of_devices])
                    {
                        translate([0 + ((cage_width + multiple_device_gap) * (index - 1)), 0, (plate_thickness / 2) + (print_cage_separately ? 2 : 0)])
                        {
                            difference()
                            {
                                cube([device_width + (plate_thickness * 2) + (generate_rear_support_cage ? 8 : support_cage_base_size) + (print_cage_separately ? 4 : 0), device_height + (plate_thickness * 2) + support_cage_base_size + (print_cage_separately ? 2 : 0), plate_thickness + (print_cage_separately ? 12 : 6)], center=true);
//                                if (closed_faceplate)
                                cube([device_width - (plate_thickness * 1) + support_cage_base_size + (print_cage_separately ? 4 : 0) + device_clearance, device_height - (plate_thickness * 1) + support_cage_base_size + (print_cage_separately ? 2 : 0) + device_clearance, plate_thickness + (print_cage_separately ? 12 : 6) + 2], center=true);
                            }

                            // If we're printing the cage separately, place support/reinforcing blocks on the
                            // corners of the cage area.
                            if (print_cage_separately)
                            {
                                translate([0 - (device_width / 2) - (support_cage_base_size / 2) - 2, 0 + cage_vertical_offset + (device_height / 2) + (support_cage_base_size / 2) + 2, 3])
                                    cube([plate_thickness + support_cage_base_size + 4, plate_thickness + support_cage_base_size + 4, 21], center=true);
                                translate([0 + (device_width / 2) + (support_cage_base_size / 2) + 2, 0 + cage_vertical_offset + (device_height / 2) + (support_cage_base_size / 2) + 2, 3])
                                    cube([plate_thickness + support_cage_base_size + 4, plate_thickness + support_cage_base_size + 4, 21], center=true);
                                
                                translate([0 - (device_width / 2) - (support_cage_base_size / 2) - 2, 0 - (cage_vertical_offset + (device_height / 2) + (support_cage_base_size / 2)) - 2, 3])
                                    cube([plate_thickness + support_cage_base_size + 4, plate_thickness + support_cage_base_size + 4, 21], center=true);
                                translate([0 + (device_width / 2) + (support_cage_base_size / 2) + 2, 0 - (cage_vertical_offset + (device_height / 2) + (support_cage_base_size / 2)) - 2, 3])
                                    cube([plate_thickness + support_cage_base_size + 4, plate_thickness + support_cage_base_size + 4, 21], center=true);
                            }
                        }
                    }
                } // union end
        }
    } // union end
}

// Create the device cage.
module create_device_cage(oversize=false)
{
    // Determine sizes of the panels.
    top_bottom_panel_width = device_width + (plate_thickness * 2) + (generate_rear_support_cage ? 8 : support_cage_base_size);
    left_right_panel_width = device_height + (plate_thickness * 2) + support_cage_base_size;
    panel_depth = device_depth + plate_thickness + support_cage_base_size - 2 + device_clearance;

    // Determine how far on the Z-axis to move the panels so that they land 1mm above 
    // zero height.
    z_offset = (device_depth / 2) + (plate_thickness / 2) + (support_cage_base_size / 2) + 1;

    // If the oversize option is enabled, expand slightly based on the snap-fit tolerance
    // setting.
    expand = oversize ? snap_fit_tolerance : 0;


    // With the addition of backplate modifications in version 0.8, we essentially have to
    // duplicate the positioning and santy/error checking for these that we do for the mods
    // to the faceplate.

    // Determine the working area for the backplate minus mounting area.
    mod_working_height = device_height;
    working_width = device_width;
    working_width_left = 0 - working_width / 2;
    working_width_right = working_width / 2;

    // Determine the sizes of the backside modification arrays' bounding box areas.
    cage_back_left_side_mod_grid_width = cage_back_left_side_mod_width * cage_back_left_side_mod_grid_columns;
    cage_back_left_side_mod_grid_height = cage_back_left_side_mod_height * cage_back_left_side_mod_grid_rows;
    cage_back_right_side_mod_grid_width = cage_back_right_side_mod_width * cage_back_right_side_mod_grid_columns;
    cage_back_right_side_mod_grid_height = cage_back_right_side_mod_height * cage_back_right_side_mod_grid_rows;
    cage_back_centered_mod_grid_width = cage_back_centered_mod_width * cage_back_centered_mod_grid_columns;
    cage_back_centered_mod_grid_height = cage_back_centered_mod_height * cage_back_centered_mod_grid_rows;

    // Determine where the center points are for backplate modifications - we'll
    // check to see if they'll fit a bit later.
    left_difference = working_width_left - (cage_back_centered_mod_type != "None" ? 0 - (cage_back_centered_mod_grid_width / 2) : 0.0);
    left_mod_centerpoint = working_width_left - (left_difference / 2);
    right_difference = working_width_right - (cage_back_centered_mod_type != "None" ? cage_back_centered_mod_grid_width / 2 : 0.0);
    right_mod_centerpoint = working_width_right - (right_difference / 2);

    // And now that we know where those centerpoints are, let's assign them to the left
    // and right modifications if their offsets aren't already set to zero.
    safe_cage_back_left_side_mod_horizontal_offset = cage_back_left_side_mod_horizontal_offset == 0.0 ? left_mod_centerpoint : cage_back_left_side_mod_horizontal_offset;
    safe_cage_back_right_side_mod_horizontal_offset = cage_back_right_side_mod_horizontal_offset == 0.0 ? right_mod_centerpoint : cage_back_right_side_mod_horizontal_offset;

    // Show position markers for mods' centers.
    if (cage_back_geometry == "Solid")
    {
        mod_offset_marker(safe_cage_back_left_side_mod_horizontal_offset, device_depth + plate_thickness, 2, "L MOD CENTER", (cage_back_left_side_mod_horizontal_offset == 0.0));
        mod_offset_marker(safe_cage_back_right_side_mod_horizontal_offset, device_depth + plate_thickness, 2, "R MOD CENTER", (cage_back_right_side_mod_horizontal_offset == 0.0));
    }

    // Determine where modification array edges land. This creates a bounding box 
    // for each modification array proper.
    cage_back_left_side_mod_grid_left_edge = 0 - (cage_back_left_side_mod_grid_width / 2) + safe_cage_back_left_side_mod_horizontal_offset;
    cage_back_left_side_mod_grid_right_edge = 0 + (cage_back_left_side_mod_grid_width / 2) + safe_cage_back_left_side_mod_horizontal_offset;
    cage_back_left_side_mod_grid_top_edge = 0 - (cage_back_left_side_mod_grid_height / 2) + cage_back_left_side_mod_vertical_offset;
    cage_back_left_side_mod_grid_bottom_edge = (cage_back_left_side_mod_grid_height / 2) + cage_back_left_side_mod_vertical_offset;
    cage_back_right_side_mod_grid_left_edge = 0 - (cage_back_right_side_mod_grid_width / 2) + safe_cage_back_right_side_mod_horizontal_offset;
    cage_back_right_side_mod_grid_right_edge = (cage_back_right_side_mod_grid_width / 2) + safe_cage_back_right_side_mod_horizontal_offset;
    cage_back_right_side_mod_grid_top_edge = 0 - (cage_back_right_side_mod_grid_height / 2) + cage_back_right_side_mod_vertical_offset;
    cage_back_right_side_mod_grid_bottom_edge = (cage_back_right_side_mod_grid_height / 2) + cage_back_right_side_mod_vertical_offset;
    cage_back_centered_mod_grid_left_edge = 0 - (cage_back_centered_mod_grid_width / 2);
    cage_back_centered_mod_grid_right_edge = (cage_back_centered_mod_grid_width / 2);
    cage_back_centered_mod_grid_top_edge = 0 - (cage_back_centered_mod_grid_height / 2);
    cage_back_centered_mod_grid_bottom_edge = (cage_back_centered_mod_grid_height / 2);

    // Time to do a bunch of error detection for each mod slot.

    if (cage_back_left_side_mod_type != "None")
    {
        // Overlap detection - if the edge of a mod reaches past the edge of the backplate, 
        // or each other, that might pose issues.
        if (cage_back_left_side_mod_grid_right_edge <  working_width_left)
            error_message("Back-of-cage left-side mod protrudes into or overlaps edge of cage.");
        if ((cage_back_right_side_mod_type != "None") && (cage_back_left_side_mod_grid_right_edge > cage_back_right_side_mod_grid_left_edge))
            error_message("Back-of-cage left- and right-side mods protrude into or overlap each other.");
        if ((cage_back_centered_mod_type != "None") && (cage_back_left_side_mod_grid_right_edge > cage_back_centered_mod_grid_left_edge))
            error_message("Back-of-cage left- and centered mods protrude into or overlap each other.");

        // We need to ensure the mods will fit within the backplate.
        if (cage_back_left_side_mod_grid_width > working_width)
            error_message("Back-of-cage left-side mod's size and/or row count is too wide to fit.");
        if (cage_back_left_side_mod_grid_height >mod_working_height)
            error_message("Back-of-cage left-side mod's size and/or row count is too tall to fit.");

        // We also need to ensure mods don't fall off the top/bottom/sides of the backplate. 
        if (cage_back_left_side_mod_grid_top_edge < 0 - (mod_working_height / 2))
            error_message("Back-of-cage left-side mod's size, row count, and/or vertical offset is pushing the mod off the backplate.");
        if (cage_back_left_side_mod_grid_bottom_edge > (mod_working_height / 2))
            error_message("Back-of-cage left-side mod's size, row count, and/or vertical offset is pushing the mod off the backplate.");
        if (cage_back_left_side_mod_grid_left_edge < 0 - (working_width / 2))
            error_message("Back-of-cage left-side mod's size, row count, and/or horizontal offset is pushing the mod off the backplate.");
    }
    if (cage_back_right_side_mod_type != "None")
    {
        // Overlap detection - if the edge of a mod reaches past the edge of the backplate, 
        // or each other, that might pose issues.
        if (cage_back_right_side_mod_grid_left_edge > working_width_right)
            error_message("Back-of-cage right-side mod protrudes into or overlaps edge of cage.");
        if ((cage_back_centered_mod_type != "None") && (cage_back_right_side_mod_grid_left_edge < cage_back_centered_mod_grid_right_edge))
            error_message("Back-of-cage right- and centered mods protrude into or overlap each other.");

        // We need to ensure the mods will fit within the backplate.
        if (cage_back_right_side_mod_grid_width >working_width)
            error_message("Back-of-cage right-side mod's size and/or row count is too wide to fit.");
        if (cage_back_right_side_mod_grid_height >mod_working_height)
            error_message("Back-of-cage right-side mod's size and/or row count is too tall to fit.");

        // We also need to ensure mods don't fall off the top/bottom/sides of the backplate. 
        if (cage_back_right_side_mod_grid_top_edge > (mod_working_height / 2))
            error_message("Back-of-cage right-side mod's size, row count, and/or vertical offset is pushing the mod off the backplate.");
        if (cage_back_right_side_mod_grid_bottom_edge > (mod_working_height / 2))
            error_message("Back-of-cage right-side mod's size, row count, and/or vertical offset is pushing the mod off the backplate.");
        if (cage_back_right_side_mod_grid_left_edge > (working_width / 2))
            error_message("Back-of-cage right-side mod's size, row count, and/or horizontal offset is pushing the mod off the backplate.");
    }
    if (cage_back_centered_mod_type != "None")
    {
        // We need to ensure the mods will fit within the backplate.
        if (cage_back_centered_mod_grid_width > working_width)
            error_message("Back-of-cage centered mod's size and/or row count is too wide to fit.");
        if (cage_back_centered_mod_grid_height >mod_working_height)
            error_message("Back-of-cage centered mod's size and/or row count is too tall to fit.");

        // Having a centered backside mod enabled on a split cage will cut the mod in half.
        if (split_cage_into_two_halves)
            error_message("Back-of-cage centered mod is enabled but cage is split in half, which cuts the mod in half.");
    }

    // Some final sanity checks...

    // Warn if enabling the back with all four sides disabled (floating backplate).
    if (
        (cage_top_geometry == "None") && (cage_bottom_geometry == "None") &&
        (cage_left_geometry == "None") && (cage_right_geometry == "None") &&
        (cage_back_geometry != "None")    
       )
        error_message("Floating backplate - back of cage is enabled with all sides disabled.");

    // Warn if creating a completely enclosed cage with no external access by making all sides solid
    // and enabling closed faceplate.
    if (
        (cage_top_geometry == "Solid") && (cage_bottom_geometry == "Solid") &&
        (cage_left_geometry == "Solid") && (cage_right_geometry == "Solid") &&
        (cage_back_geometry == "Solid") && (closed_faceplate)
       )
        error_message("Impossible-to-use cage - all six sides are solid.");


    // Create the cage(s) by assembling five sides. We'll do this once for each entry when
    // the number of devices is >1.

    // Center the cage array on the faceplate.
    translate([0 - ((top_bottom_panel_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, 0])
        difference()
        {
            union()
            {
                for (index = [1:number_of_devices])
                {
                    // Determine the X offset value for each cage.
                    x_offset = (top_bottom_panel_width * (index - 1))  + (multiple_device_gap * (index - 1));

                    // Create the top first. How we'll do this will depend on the geometry
                    // setting.
                    if (cage_top_geometry != "None")
                        translate([x_offset, 0 - (device_height / 2) - (plate_thickness / 2) - (device_clearance / 2), z_offset])
                            rotate([90, 0, 180])
                            {
                                // The default geometry is open, which has a large open area
                                // with a perimeter.
                                if (cage_top_geometry == "Open")
                                    ventilated_side_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, extra_support);

                                // "Solid" is as the name implies, a solid wall with no openings.
                                else if (cage_top_geometry == "Solid")
                                    two_rounded_corner_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 0.001);

                                // "Structure" is just the outer edges that form the cage support
                                // structure, with the rest almost completely open.
                                else if (cage_top_geometry == "Structure")
                                    ventilated_side_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 2 + support_cage_base_size, 0.001, 0.001, extra_support);

                                // When "Lidded" is selected, we'll largely duplicate open, but
                                // with screw holes in the corners for attaching a flat plastic
                                // sheet as a lid.
                                else if (cage_top_geometry == "Lidded")
                                {
                                    difference()
                                    {
                                        union()
                                        {
                                            ventilated_side_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, extra_support);

                                            // Add corner tabs at the back of the opening area.
                                            translate([(device_width / 2) - 7, (device_depth / 2) - plate_thickness - 8, 0])
                                                four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                            translate([0 - (device_width / 2) + 7, (device_depth / 2) - plate_thickness - 8, 0])
                                                four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                            translate([(device_width / 2) - 7, 0 - (device_depth / 2) + plate_thickness + 8, 0])
                                                four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                            translate([0 - (device_width / 2) + 7, 0 - (device_depth / 2) + plate_thickness + 8, 0])
                                                four_rounded_corner_plate(20, 20, plate_thickness, 5);

                                            // Add more tabs for wider devices.
                                            if (device_width > 120)
                                            {
                                                translate([0, (device_depth / 2) - plate_thickness - 8, 0])
                                                    four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                                translate([0, 0 - (device_depth / 2) + plate_thickness + 8, 0])
                                                    four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                           }

                                            // Add even more tabs for even wider devices.
                                            if (device_width > 240)
                                            {
                                                translate([0 - (device_width / 4) + 5, (device_depth / 2) - plate_thickness - 8, 0])
                                                    four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                                translate([(device_width / 4) - 5, (device_depth / 2) - plate_thickness - 8, 0])
                                                    four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                                translate([0 - (device_width / 4) + 5, 0 - (device_depth / 2) + plate_thickness + 8, 0])
                                                    four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                                translate([(device_width / 4) - 5, 0 - (device_depth / 2) + plate_thickness + 8, 0])
                                                    four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                           }

                                            // Add more tabs for deeper devices as well.
                                            if (device_depth > 120)
                                            {
                                                translate([0 - (device_width / 2) + 7, 0, 0])
                                                    four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                                translate([(device_width / 2) - 7, 0, 0])
                                                    four_rounded_corner_plate(20, 20, plate_thickness, 5);
                                           }
                                        }

                                        // Remove the screw holes themselves.
                                        translate([(device_width / 2) - 10, (device_depth / 2) - plate_thickness - 11, (plate_thickness / 2)])
                                            cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                        translate([0 - (device_width / 2) + 10, (device_depth / 2) - plate_thickness - 11, (plate_thickness / 2)])
                                            cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                        translate([(device_width / 2) - 10, 0 - (device_depth / 2) - plate_thickness + 19, (plate_thickness / 2)])
                                            cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                        translate([0 - (device_width / 2) + 10, 0 - (device_depth / 2) - plate_thickness + 19, (plate_thickness / 2)])
                                            cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);

                                        // Add more tabs for wider devices.
                                        if (device_width > 120)
                                        {
                                            translate([0, (device_depth / 2) - plate_thickness - 11, (plate_thickness / 2)])
                                                cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                            translate([0, 0 - (device_depth / 2) - plate_thickness + 19, (plate_thickness / 2)])
                                                cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                        }

                                        // Add even more tabs for even wider devices.
                                        if (device_width > 240)
                                        {
                                            translate([0 - (device_width / 4) + 5, (device_depth / 2) - plate_thickness - 8, 0])
                                                cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                            translate([(device_width / 4) - 5, (device_depth / 2) - plate_thickness - 8, 0])
                                                cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                            translate([0 - (device_width / 4) + 5, 0 - (device_depth / 2) + plate_thickness + 8, 0])
                                                cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                            translate([(device_width / 4) - 5, 0 - (device_depth / 2) + plate_thickness + 8, 0])
                                                cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                       }

                                        // Add more tabs for deeper devices.
                                        if (device_depth > 120)
                                        {
                                            translate([0 - (device_width / 2) + 7, 0, 0])
                                                cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                            translate([(device_width / 2) - 7, 0, 0])
                                                cylinder(h=12, d=cage_top_lid_screw_holes, center=true, $fn=this_fn);
                                       }
                                    }
                                }

                                // Other geometry settings are ventilation grids.
                                else
                                {
                                    ventilated_side_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, extra_support);
                                    create_ventilation_grid(cage_top_geometry, top_bottom_panel_width - 10 + support_cage_base_size, panel_depth - 10 + support_cage_base_size, plate_thickness, cage_top_bottom_vent_hole_size, cage_top_bottom_vent_wall_thickness, cage_top_bottom_vent_grid_angle, cage_top_bottom_vent_grid_horizontal_offset, cage_top_bottom_vent_grid_vertical_offset);
                                }
                            }

                    // Now let's do the bottom.
                    if (cage_bottom_geometry_override != "None")
                        translate([x_offset, (device_height / 2) + (plate_thickness / 2) + (device_clearance / 2), z_offset])
                            rotate([90, 0, 0])
                            {
                                if (cage_bottom_geometry_override == "Open")
                                    ventilated_side_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, extra_support);
                                else if (cage_bottom_geometry_override == "Solid")
                                {
                                    two_rounded_corner_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 0.001);
                                    
//                                    // Generate bottom studs, if enabled.
//                                    // This is tricky because we need to enumerate a simple list of
//                                    // coordinates, then place a stud. The reason we have to deal
//                                    // with all this is that the customizer doesn't like nested
//                                    // lists with variable lengths, but doesn't mind a flat list.
//                                    if (cage_bottom_geometry_override == "Solid")
//                                        for (index = [0:2:len(cage_bottom_studs) - 2])
//                                        {
//                                            // Grab the next pair of entries.
//                                            coord_x = cage_bottom_studs[index];
//                                            coord_y = cage_bottom_studs[index + 1];
//                                            
//                                            // If the resulting vector is empty, skip it.
//                                            if ((coord_x != 0.00) || (coord_y != 0.00))
//                                            {
//                                                translate([0 - (device_width / 2) + coord_x, 0 - (device_depth / 2) + coord_y, (cage_bottom_stud_height / 2) + 1])
//                                                    rotate([0, 180, 0])
//                                                        tube(cage_bottom_stud_screw_holes * 2.5, cage_bottom_stud_height, ((cage_bottom_stud_screw_holes * 2.5) - cage_bottom_stud_screw_holes) / 2, this_fn, true);
//                                            }
//                                        }
                                }
                                else if (cage_bottom_geometry_override == "Structure")
                                    ventilated_side_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 2 + support_cage_base_size, 0.001, 0.001, extra_support);
                                else
                                {
                                    ventilated_side_plate(panel_depth, top_bottom_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, extra_support);
                                    create_ventilation_grid(cage_bottom_geometry, top_bottom_panel_width - 10 + support_cage_base_size, panel_depth - 10 + support_cage_base_size, plate_thickness, cage_top_bottom_vent_hole_size, cage_top_bottom_vent_wall_thickness, cage_top_bottom_vent_grid_angle, cage_top_bottom_vent_grid_horizontal_offset, cage_top_bottom_vent_grid_vertical_offset);
                                }
                            }

                    // Next, the left side.
                    if (cage_left_geometry != "None")
                        translate([0 - (device_width / 2) - (plate_thickness / 2) + x_offset - (device_clearance / 2), 0, z_offset])
                            rotate([90, 0, 90])
                            {
                                if (cage_left_geometry == "Open")
                                    ventilated_side_plate(panel_depth, left_right_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, false);
                                else if (cage_left_geometry == "Solid")
                                    two_rounded_corner_plate(panel_depth, left_right_panel_width, plate_thickness + expand, 0.001);
                                else if (cage_left_geometry == "Structure")
                                    ventilated_side_plate(panel_depth, left_right_panel_width, plate_thickness + expand, 2 + support_cage_base_size, 0.001, 0.001, extra_support);
                                else
                                {
                                    ventilated_side_plate(panel_depth, left_right_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, false);
                                    create_ventilation_grid(cage_left_geometry, left_right_panel_width - 10 + support_cage_base_size, panel_depth - 10 + support_cage_base_size, plate_thickness, cage_sides_vent_hole_size, cage_sides_vent_wall_thickness, cage_sides_vent_grid_angle, cage_sides_vent_grid_horizontal_offset, cage_sides_vent_grid_vertical_offset);
                                }
                            }

                    // Next, the right side.
                    if (cage_right_geometry != "None")
                        translate([(device_width / 2) + (plate_thickness / 2) + x_offset+ (device_clearance / 2), 0, z_offset])
                            rotate([90, 0, 90])
                                if (cage_right_geometry == "Open")
                                    ventilated_side_plate(panel_depth, left_right_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, false);
                                else if (cage_right_geometry == "Solid")
                                    two_rounded_corner_plate(panel_depth, left_right_panel_width, plate_thickness + expand, 0.001);
                                else if (cage_right_geometry == "Structure")
                                    ventilated_side_plate(panel_depth, left_right_panel_width, plate_thickness + expand, 2 + support_cage_base_size, 0.001, 0.001, extra_support);
                                else
                                {
                                    ventilated_side_plate(panel_depth, left_right_panel_width, plate_thickness + expand, 8 + support_cage_base_size, 0.001, 5, false);
                                    create_ventilation_grid(cage_right_geometry, left_right_panel_width - 10 + support_cage_base_size, panel_depth - 10 + support_cage_base_size, plate_thickness, cage_sides_vent_hole_size, cage_sides_vent_wall_thickness, cage_sides_vent_grid_angle, cage_sides_vent_grid_horizontal_offset, cage_sides_vent_grid_vertical_offset);
                                }

                    // And finally, the back.
                    translate([x_offset, 0, device_depth + (plate_thickness / 2)])
                        if (cage_back_geometry == "Solid")
                            difference()
                            {
                                union()
                                {
                                    cube([device_width + (plate_thickness * 2), device_height + (plate_thickness * 2), plate_thickness], center=true);


                                    // Time to perform the union portion of backside modifications.

                                    // LEFT mod slot
                                    if (cage_back_left_side_mod_type != "None")
                                        translate([0, 0, 0 + (plate_thickness / 2)])
                                            rotate([180, 0, 0])
                                                faceplate_mod_addition(cage_back_left_side_mod_type, safe_cage_back_left_side_mod_horizontal_offset, cage_back_left_side_mod_vertical_offset, cage_back_left_side_mod_width, cage_back_left_side_mod_height, cage_back_left_side_mod_grid_rows, cage_back_left_side_mod_grid_columns);

                                    // RIGHT mod slot
                                    if (cage_back_right_side_mod_type != "None")
                                        translate([0, 0, 0 + (plate_thickness / 2)])
                                            rotate([180, 0, 0])
                                                faceplate_mod_addition(cage_back_right_side_mod_type, safe_cage_back_right_side_mod_horizontal_offset, cage_back_right_side_mod_vertical_offset, cage_back_right_side_mod_width, cage_back_right_side_mod_height, cage_back_right_side_mod_grid_rows, cage_back_right_side_mod_grid_columns);

                                    // Centered mod slot
                                    if (cage_back_centered_mod_type != "None")
                                        translate([0, 0, 0 + (plate_thickness / 2)])
                                            rotate([180, 0, 0])
                                                faceplate_mod_addition(cage_back_centered_mod_type, 0, 0, cage_back_centered_mod_width, cage_back_centered_mod_height, cage_back_centered_mod_grid_rows, cage_back_centered_mod_grid_columns);
                                }


                                // Backside modifications - subtractions
                                // Left mod slot
                                if (cage_back_left_side_mod_type != "None")
                                    translate([0, 0, 0 + (plate_thickness / 2)])
                                        rotate([180, 0, 0])
                                            faceplate_mod_subtraction(cage_back_left_side_mod_type, safe_cage_back_left_side_mod_horizontal_offset, cage_back_left_side_mod_vertical_offset, cage_back_left_side_mod_width, cage_back_left_side_mod_height, cage_back_left_side_mod_grid_rows, cage_back_left_side_mod_grid_columns);

                                // Right mod slot
                                if (cage_back_right_side_mod_type != "None")
                                    translate([0, 0, 0 + (plate_thickness / 2)])
                                        rotate([180, 0, 0])
                                            faceplate_mod_subtraction(cage_back_right_side_mod_type, safe_cage_back_right_side_mod_horizontal_offset, cage_back_right_side_mod_vertical_offset, cage_back_right_side_mod_width, cage_back_right_side_mod_height, cage_back_right_side_mod_grid_rows, cage_back_right_side_mod_grid_columns);

                                // Centered mod slot
                                if (cage_back_centered_mod_type != "None")
                                    translate([0, 0, 0 + (plate_thickness / 2)])
                                        rotate([180, 0, 0])
                                            faceplate_mod_subtraction(cage_back_centered_mod_type, 0, 0, cage_back_centered_mod_width, cage_back_centered_mod_height, cage_back_centered_mod_grid_rows, cage_back_centered_mod_grid_columns);
                           }
                        else if (cage_back_geometry == "Sides")
                            union()
                            {
                                translate([(device_width / 2) - (plate_thickness / 2), 0, 0])
                                    cube([6 + plate_thickness, device_height + (plate_thickness * 2), plate_thickness], center=true);
                                translate([0 - (device_width / 2) + (plate_thickness / 2), 0, 0])
                                    cube([6 + plate_thickness, device_height + (plate_thickness * 2), plate_thickness], center=true);
                            }
                        else if (cage_back_geometry == "Open")
                            ventilated_back_plate(device_height + (plate_thickness * 2), device_width + (plate_thickness * 2), plate_thickness, 5 + plate_thickness, 0, 5);


                    // Mounting holes (subrack support) - centered - additions
                    if ((narrow_edge_centered_holes != 0.00) && (faceplate_only == 0.00))
                    {
                        // Determine which edge is the shorter
                        if (device_width > device_height)
                        {
                            translate([0 - (device_width / 2) + x_offset, 0, 5])
                                cylinder(h=10 + expand, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                            translate([(device_width / 2) + x_offset, 0, 5])
                                cylinder(h=10 + expand, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                        }
                        else
                        {
                            translate([x_offset, 0 - (device_height / 2), 5])
                                cylinder(h=10 + expand, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                            translate([x_offset, (device_height / 2), 5])
                                cylinder(h=10 + expand, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                        }
                    }

                    // Mounting holes (subrack support) - corners - additions
                    if ((edge_corner_holes != 0.00) && (faceplate_only == 0.00))
                    {
                        translate([0 - (device_width / 2) + x_offset, 0 - (device_height / 2), 5])
                            cylinder(h=10 + expand, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([(device_width / 2) + x_offset, 0 - (device_height / 2), 5])
                            cylinder(h=10 + expand, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([0 - (device_width / 2) + x_offset, (device_height / 2), 5])
                            cylinder(h=10 + expand, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([(device_width / 2) + x_offset, (device_height / 2), 5])
                            cylinder(h=10 + expand, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                    }
                }

            } // union end

            for (index = [1:number_of_devices])
            {
                // Determine the X offset value for each cage.
                x_offset = (top_bottom_panel_width * (index - 1))  + (multiple_device_gap * (index - 1));

                // Mounting holes (subrack support) - centered - subtractions
                if ((narrow_edge_centered_holes != 0.00) && (faceplate_only == 0.00))
                    // Determine which edge is the shorter
                    if (device_width > device_height)
                    {
                        translate([0 - (device_width / 2) + x_offset, 0, 5])
                            cylinder(h=12, d=narrow_edge_centered_holes, center=true, $fn=this_fn);
                        translate([(device_width / 2) + x_offset, 0, 5])
                            cylinder(h=12, d=narrow_edge_centered_holes, center=true, $fn=this_fn);
                    }
                    else
                    {
                        translate([x_offset, 0 - (device_height / 2), 5])
                            cylinder(h=12, d=narrow_edge_centered_holes, center=true, $fn=this_fn);
                        translate([x_offset, (device_height / 2), 5])
                            cylinder(h=12, d=narrow_edge_centered_holes, center=true, $fn=this_fn);
                    }

                // Mounting holes (subrack support) - corners - subtractions
                if ((edge_corner_holes != 0.00) && (faceplate_only == 0.00))
                {
                    translate([0 - (device_width / 2) + x_offset, 0 - (device_height / 2), 5])
                        cylinder(h=12, d=edge_corner_holes, center=true, $fn=this_fn);
                    translate([(device_width / 2) + x_offset, 0 - (device_height / 2), 5])
                        cylinder(h=12, d=edge_corner_holes, center=true, $fn=this_fn);
                    translate([0 - (device_width / 2) + x_offset, (device_height / 2), 5])
                        cylinder(h=12, d=edge_corner_holes, center=true, $fn=this_fn);
                    translate([(device_width / 2) + x_offset, (device_height / 2), 5])
                        cylinder(h=12, d=edge_corner_holes, center=true, $fn=this_fn);
                }
            }
        } // difference end
}

// Create a complete cage assembly. This was spun off as a separate module for easier
// updating and to make splitting the cage into two halves more practical without as
// much code repetition.
module create_completed_cage(height_required_in_units, safe_left_side_mod_horizontal_offset, safe_right_side_mod_horizontal_offset, left_ear, right_ear)
{
    // Determine the width of the faceplate based on the rack geometry setting.
    width_in_mm = to_mm(rack_cage_width);

    // Convert height required into millimeters.
    height_required_in_mm = height_required_in_units * unit_height_in_mm;

    // Determine the height and width of cage(s).
    cage_width = (device_width + (plate_thickness * 2) + support_cage_base_size);
    total_cage_width = (cage_width * number_of_devices) + (multiple_device_gap * (number_of_devices - 1)) + (print_cage_separately ? 4 : 0);
    cage_height = device_height + (plate_thickness * 2) + support_cage_base_size;

    // Determine sizes of the panels.
    top_bottom_panel_width = device_width + (plate_thickness * 2) + support_cage_base_size;
    left_right_panel_width = device_height + (plate_thickness * 2) + support_cage_base_size;
    panel_depth = device_depth + plate_thickness + support_cage_base_size - 2 + device_clearance;

    // The generator uses two differences and two unions. The inner pair create the 
    // faceplate and cage(s), and the outer two perform post-processing on what the
    // inner pair have built.
    translate([0, ((print_cage_separately || safe_generate_rear_support_cage) ? 0 - (height_required_in_mm / 2) - 5 : 0), 0])
        difference() // Outer
        {
            union() // Outer
            {
                difference() // Inner
                {
                    union() // Inner
                    {
                        // Start the actual generation process by creating the faceplate.
                        if (!print_cage_separately)
                            translate([0, 0, plate_thickness / 2])
                                create_faceplate(height_required_in_units, width_in_mm, left_ear, right_ear);
                        else
                            difference()
                            {
                                translate([0, 0, plate_thickness / 2])
                                    create_faceplate(height_required_in_units, width_in_mm, left_ear, right_ear);
                                // To "snip out" the cage regardless of side ventilation settings,
                                // we're doing some trickery: projecting it to a 2D surface and 
                                // extruding it vertically into a solid that is used instead to
                                // perform the subtraction. Otherwise, ventilation grids might be
                                // left cut into the faceplate reinforcing, which would not work 
                                // well.
                                translate([0, 0, 15])
                                    linear_extrude(25, center=true, convexity=10)
                                        projection()
                                            create_device_cage(true);
                            }

                        // If we're not creating only a faceplate, generate the cage, faceplate
                        // reinforcing, etc.
                        if (faceplate_only == 0.0)
                        {
                            // First, create the cage. If we're printing it separately, flip it
                            // upside-down and place it next to the faceplate.
                            translate([0, (print_cage_separately ? height_required_in_mm + 5 : 0), (print_cage_separately ? (device_depth + plate_thickness + support_cage_base_size + device_clearance) : 0)])
                                rotate([0, print_cage_separately ? 180 : 0, 0])
                                    create_device_cage();


                            // Show a print height marker if the ruler is enabled.
                            if ((show_ruler) && ($preview) && (!split_cage_into_two_halves))
                                print_height_marker((device_depth + plate_thickness + support_cage_base_size + device_clearance) + (print_cage_separately ? -1.5 : 0));
                        }


                        // Time to perform the union portion of faceplate modifications.

                        // LEFT mod slot
                        if (left_side_mod_type != "None")
                            faceplate_mod_addition(left_side_mod_type, safe_left_side_mod_horizontal_offset, left_side_mod_vertical_offset, left_side_mod_width, left_side_mod_height, left_side_mod_grid_rows, left_side_mod_grid_columns);

                        // RIGHT mod slot
                        if (right_side_mod_type != "None")
                            faceplate_mod_addition(right_side_mod_type, safe_right_side_mod_horizontal_offset, right_side_mod_vertical_offset, right_side_mod_width, right_side_mod_height, right_side_mod_grid_rows, right_side_mod_grid_columns);

                        if (centered_mod_type != "None")
                            faceplate_mod_addition(centered_mod_type, 0, 0, centered_mod_width, centered_mod_height, centered_mod_grid_rows, centered_mod_grid_columns);

                    } // Inner union end


                    // Carve out holes in the faceplate to acommodate the device(s) to cage.
                    // If the retention lip is enabled, stop 1mm short of punching through
                    // completely so we can form the lip.
                    if ((faceplate_only == 0.0) && (!closed_faceplate))
                        translate([0 - ((cage_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, device_clearance + 1.75])
                            union()
                                for (index = [1:number_of_devices])
                                {
                                    translate([0 + ((cage_width + multiple_device_gap) * (index - 1)), 0, device_depth / 2 - (plate_thickness / 2) - 6])
                                        linear_extrude(device_depth + device_clearance - 10 - (add_retention_lip ? 4:0), center=true)
                                            offset(r=faceplate_rounded_corners + 0.001, $fn=this_fn)
                                                square([device_width + device_clearance - (faceplate_rounded_corners * 2), device_height + device_clearance - (faceplate_rounded_corners * 2)], center=true);

                                    // If the retention lip option is enabled, cut a second 
                                    // hole 2mm smaller. The remainder forms the retention
                                    // lip.
                                    if (add_retention_lip)
                                        translate([0 + ((cage_width + multiple_device_gap) * (index - 1)), 0, device_depth / 2 - (plate_thickness / 2) - 10])
                                            linear_extrude(device_depth + device_clearance, center=true)
                                                offset(r=faceplate_rounded_corners + 0.001, $fn=this_fn)
                                                    square([device_width + device_clearance - (faceplate_rounded_corners * 2) - 2, device_height + device_clearance - (faceplate_rounded_corners * 2) - 2], center=true);
                                }


                    // Additional faceplate modifications - subtractions
                    // Left mod slot
                    if (left_side_mod_type != "None")
                        faceplate_mod_subtraction(left_side_mod_type, safe_left_side_mod_horizontal_offset, left_side_mod_vertical_offset, left_side_mod_width, left_side_mod_height, left_side_mod_grid_rows, left_side_mod_grid_columns);

                    // Right mod slot
                    if (right_side_mod_type != "None")
                        faceplate_mod_subtraction(right_side_mod_type, safe_right_side_mod_horizontal_offset, right_side_mod_vertical_offset, right_side_mod_width, right_side_mod_height, right_side_mod_grid_rows, right_side_mod_grid_columns);

                    // Centered mod - requires faceplate only without a cage
                    if (centered_mod_type != "None")
                        faceplate_mod_subtraction(centered_mod_type, 0, 0, centered_mod_width, centered_mod_height, centered_mod_grid_rows, centered_mod_grid_columns);

                } // Inner difference end


                // Mounting holes (subrack support) - centered - additions
                if ((narrow_edge_centered_holes != 0.00) && (faceplate_only == 0.00) && (!print_cage_separately))
                {
                    translate([0 - ((top_bottom_panel_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, 0])
                    for (index = [1:number_of_devices])
                    {
                        // Determine the X offset value for each cage.
                        x_offset = (top_bottom_panel_width * (index - 1))  + (multiple_device_gap * (index - 1));

                        // Determine which edge is the shorter
                        if (device_width > device_height)
                            union()
                            {
                                translate([0 - (device_width / 2) + x_offset, 0, 5])
                                    cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                                translate([(device_width / 2) + x_offset, 0, 5])
                                    cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                            }
                        else
                            union()
                            {
                                translate([x_offset, 0 - (device_height / 2), 5])
                                    cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                                translate([x_offset, (device_height / 2), 5])
                                    cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                            }
                    }
                }

                // Mounting holes (subrack support) - corners - additions
                if ((edge_corner_holes != 0.00) && (faceplate_only == 0.00) && (!print_cage_separately))
                {
                    translate([0 - ((top_bottom_panel_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, 0])
                    for (index = [1:number_of_devices])
                    {
                        // Determine the X offset value for each cage.
                        x_offset = (top_bottom_panel_width * (index - 1))  + (multiple_device_gap * (index - 1));
                        translate([0 - (device_width / 2) + x_offset, 0 - (device_height / 2), 5])
                            cylinder(h=10, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([(device_width / 2) + x_offset, 0 - (device_height / 2), 5])
                            cylinder(h=10, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([0 - (device_width / 2) + x_offset, (device_height / 2), 5])
                            cylinder(h=10, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([(device_width / 2) + x_offset, (device_height / 2), 5])
                            cylinder(h=10, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                    }
                }
            } // Outer union end


            // Mounting holes (subrack support) - centered - additions
            if ((narrow_edge_centered_holes != 0.00) && (faceplate_only == 0.00))
                translate([0 - ((top_bottom_panel_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, 0])
                    for (index = [1:number_of_devices])
                    {
                        // Determine the X offset value for each cage.
                        x_offset = (top_bottom_panel_width * (index - 1))  + (multiple_device_gap * (index - 1));

                        // Determine which edge is the shorter
                        if (device_width > device_height)
                            union()
                            {
                                translate([0 - (device_width / 2) + x_offset, 0, 5])
                                    cylinder(h=12, d=narrow_edge_centered_holes * (print_cage_separately ? 2.5 : 1), center=true, $fn=this_fn);
                                translate([(device_width / 2) + x_offset, 0, 5])
                                    cylinder(h=12, d=narrow_edge_centered_holes * (print_cage_separately ? 2.5 : 1), center=true, $fn=this_fn);
                            }
                        else
                            union()
                            {
                                translate([x_offset, 0 - (device_height / 2), 5])
                                    cylinder(h=12, d=narrow_edge_centered_holes * (print_cage_separately ? 2.5 : 1), center=true, $fn=this_fn);
                                translate([x_offset, (device_height / 2), 5])
                                    cylinder(h=12, d=narrow_edge_centered_holes * (print_cage_separately ? 2.5 : 1), center=true, $fn=this_fn);
                            }
                    }

            // Mounting holes (subrack support) - corners - additions
            if ((edge_corner_holes != 0.00) && (faceplate_only == 0.00))
                translate([0 - ((top_bottom_panel_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, 0])
                    for (index = [1:number_of_devices])
                    {
                        // Determine the X offset value for each cage.
                        x_offset = (top_bottom_panel_width * (index - 1))  + (multiple_device_gap * (index - 1));

                        translate([0 - (device_width / 2) + x_offset, 0 - (device_height / 2), 5])
                            cylinder(h=12, d=edge_corner_holes * (print_cage_separately ? 2.5 : 1), center=true, $fn=this_fn);
                        translate([(device_width / 2) + x_offset, 0 - (device_height / 2), 5])
                            cylinder(h=12, d=edge_corner_holes * (print_cage_separately ? 2.5 : 1), center=true, $fn=this_fn);
                        translate([0 - (device_width / 2) + x_offset, (device_height / 2), 5])
                            cylinder(h=12, d=edge_corner_holes * (print_cage_separately ? 2.5 : 1), center=true, $fn=this_fn);
                        translate([(device_width / 2) + x_offset, (device_height / 2), 5])
                            cylinder(h=12, d=edge_corner_holes * (print_cage_separately ? 2.5 : 1), center=true, $fn=this_fn);
                    }
        } // Outer difference end
}

// Create the complete rackmount cage/faceplate/enclosure object.
module create_object()
{
    // We must begin the process by doing a bunch of math to work out sizes and limitations
    // on what can go where, with the idea of not overlapping cages and modifications.

    // Determine the height in units that will be required to accommodate the device
    // to be caged, or, set the unit height to the faceplate_only setting.
    total_height_required = device_height + support_cage_base_size + (plate_thickness * 2);
    height_required_in_units = faceplate_only == 0.0 ? (ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1) : faceplate_only;
    height_required_in_mm = height_required_in_units * unit_height_in_mm;

    // Determine whether we're working with a half-unit-multiple height.
    // We have two different ways we can do this.
    //half_unit = (round(height_in_units) - unit_height == 0.5); // Integer subtraction
    half_unit = (height_required_in_units % 1 == 0.5); // Modulus checking

    // Determine the width of the faceplate based on the rack geometry setting.
    width_in_mm = to_mm(rack_cage_width);

    // Determine the working area for the faceplate minus mounting area and within a couple
    // milimeters of the top and bottom edges. Note that cage reinforcing can extend into
    // faceplate reinforcing.
    cage_working_height = height_required_in_mm;// - plate_thickness;
    mod_working_height = height_required_in_mm - (plate_thickness * 2);
    working_width = width_in_mm - (mounting_reservation_space * 2);
    working_width_left = 0 - working_width / 2;
    working_width_right = working_width / 2;

    // Determine the height and width of cage(s).
    cage_width = (device_width + (plate_thickness * 2) + support_cage_base_size);
    total_cage_width = (cage_width * number_of_devices) + (multiple_device_gap * (number_of_devices - 1)) + (print_cage_separately ? 8 : 0);
    cage_height = device_height + (plate_thickness * 2) + support_cage_base_size;

    // Determine where cage edges land. This creates a bounding box for the cage proper.
    left_cage_edge = 0 - (total_cage_width / 2) + cage_horizontal_offset;
    right_cage_edge = (total_cage_width / 2) + cage_horizontal_offset;
    top_cage_edge = 0 - (cage_height / 2) + cage_vertical_offset;
    bottom_cage_edge = (cage_height / 2) + cage_vertical_offset;


    // Time to determine where to put things and whether things will fit...

    // Sanity check - cage fitting within the given rack width.
    if ((faceplate_only == 0.0)  && (total_cage_width > working_width))
        error_message("Cage is too wide to fit within the given rack width.");

    // Sanity check - cage offsets fitting within the given rack width. Note the
    // "else" there, which prevents a too-wide-to-fit cage from also throwing a
    // second error for offsets.
    else if (((left_cage_edge < 0 - (working_width / 2)) || 
        (right_cage_edge > (working_width / 2)) ||
        (top_cage_edge < 0 - (cage_working_height / 2))||
        (bottom_cage_edge > (cage_working_height / 2))
        ) &&
        (faceplate_only == 0.0))
        error_message("Cage offset is too far to fit within the faceplate without interfering with mounting.");

    // Sanity check - centered mod enabled while a cage is also being generated
    // (overlap)
    if ((centered_mod_type != "None") && (faceplate_only == 0.0) && (!closed_faceplate))
        error_message("Centered mod enabled while generating a cage - overlapping.");

    // Sanity check - left side modification is on the right side, and vice versa.
    if ((left_side_mod_type != "None") && (left_side_mod_horizontal_offset > 0) && (faceplate_only == 0.0))
        error_message("Left-side modification being pushed to the right side of the faceplate.");
    if ((left_side_mod_type != "None") && (right_side_mod_horizontal_offset < 0) && (faceplate_only == 0.0))
        error_message("Right-side modification being pushed to the left side of the faceplate.");

    // Determine the sizes of the modification arrays' bounding box areas.
    left_side_mod_grid_width = left_side_mod_width * left_side_mod_grid_columns;
    left_side_mod_grid_height = left_side_mod_height * left_side_mod_grid_rows;
    right_side_mod_grid_width = right_side_mod_width * right_side_mod_grid_columns;
    right_side_mod_grid_height = right_side_mod_height * right_side_mod_grid_rows;
    centered_mod_grid_width = centered_mod_width * centered_mod_grid_columns;
    centered_mod_grid_height = centered_mod_height * centered_mod_grid_rows;

    // Determine where the center points are for faceplate modifications - we'll
    // check to see if they'll fit a bit later.
    left_difference = working_width_left - (faceplate_only == 0.0 ? left_cage_edge : (centered_mod_type != "None" ? 0 - (centered_mod_grid_width / 2) : 0.0));
    left_mod_centerpoint = working_width_left - (left_difference / 2);
    right_difference = working_width_right - (faceplate_only == 0.0 ? right_cage_edge : (centered_mod_type != "None" ? centered_mod_grid_width / 2 : 0.0));
    right_mod_centerpoint = working_width_right - (right_difference / 2);

    // And now that we know where those centerpoints are, let's assign them to the left
    // and right modifications if their offsets aren't already set to zero.
    safe_left_side_mod_horizontal_offset = left_side_mod_horizontal_offset == 0.0 ? left_mod_centerpoint : left_side_mod_horizontal_offset;
    safe_right_side_mod_horizontal_offset = right_side_mod_horizontal_offset == 0.0 ? right_mod_centerpoint : right_side_mod_horizontal_offset;

    // Show position markers for cage and mods' centers.
    if (!reduce_faceplate_to_2d)
    {
        if (faceplate_only == 0.0)
            mod_offset_marker(cage_horizontal_offset, plate_thickness + 16, height_required_in_units, "CAGE(S) CENTER", (left_side_mod_horizontal_offset == 0.0));
        mod_offset_marker(safe_left_side_mod_horizontal_offset, plate_thickness + 12, height_required_in_units, "L MOD CENTER", (left_side_mod_horizontal_offset == 0.0));
        mod_offset_marker(safe_right_side_mod_horizontal_offset, plate_thickness + 12, height_required_in_units, "R MOD CENTER", (right_side_mod_horizontal_offset == 0.0));
    }

    // Determine where modification array edges land. This creates a bounding box 
    // for each modification array proper.
    left_side_mod_grid_left_edge = 0 - (left_side_mod_grid_width / 2) + safe_left_side_mod_horizontal_offset;
    left_side_mod_grid_right_edge = 0 + (left_side_mod_grid_width / 2) + safe_left_side_mod_horizontal_offset;
    left_side_mod_grid_top_edge = 0 - (left_side_mod_grid_height / 2) + left_side_mod_vertical_offset;
    left_side_mod_grid_bottom_edge = (left_side_mod_grid_height / 2) + left_side_mod_vertical_offset;
    right_side_mod_grid_left_edge = 0 - (right_side_mod_grid_width / 2) + safe_right_side_mod_horizontal_offset;
    right_side_mod_grid_right_edge = (right_side_mod_grid_width / 2) + safe_right_side_mod_horizontal_offset;
    right_side_mod_grid_top_edge = 0 - (right_side_mod_grid_height / 2) + right_side_mod_vertical_offset;
    right_side_mod_grid_bottom_edge = (right_side_mod_grid_height / 2) + right_side_mod_vertical_offset;
    centered_mod_grid_left_edge = 0 - (centered_mod_grid_width / 2);
    centered_mod_grid_right_edge = (centered_mod_grid_width / 2);
    centered_mod_grid_top_edge = 0 - (centered_mod_grid_height / 2);
    centered_mod_grid_bottom_edge = (centered_mod_grid_height / 2);

    // Overlap detection - if the edge of a mod reaches past the edge of a cage, 
    // or each other, that might pose issues.
    if ((left_side_mod_type != "None") && (left_side_mod_grid_right_edge > left_cage_edge) && (faceplate_only == 0.0) && (!closed_faceplate))
        error_message("Left-side mod protrudes into or overlaps edge of cage.");
    if ((right_side_mod_type != "None") && (right_side_mod_grid_left_edge < right_cage_edge) && (faceplate_only == 0.0) && (!closed_faceplate))
        error_message("Right-side mod protrudes into or overlaps edge of cage.");
    if ((left_side_mod_type != "None") && (right_side_mod_type != "None") && (left_side_mod_grid_right_edge > right_side_mod_grid_left_edge) && (faceplate_only != 0.0))
        error_message("Left- and right-side mods protrude into or overlap each other.");
    if ((left_side_mod_type != "None") && (centered_mod_type != "None") && (left_side_mod_grid_right_edge > centered_mod_grid_left_edge) && (faceplate_only != 0.0))
        error_message("Left- and centered mods protrude into or overlap each other.");
    if ((right_side_mod_type != "None") && (centered_mod_type != "None") && (right_side_mod_grid_left_edge < centered_mod_grid_right_edge) && (faceplate_only != 0.0))
        error_message("Right- and centered mods protrude into or overlap each other.");

    // We also need to ensure mods don't fall off the top/bottom of the faceplate or
    // overlap the mounting reservation space on either side of the faceplate.
    if ((left_side_mod_type != "None") && (left_side_mod_grid_top_edge < 0 - (mod_working_height / 2)))
        error_message("Left-side mod's size, row count, and/or vertical offset is pushing the mod off the faceplate.");
    if ((left_side_mod_type != "None") && (left_side_mod_grid_bottom_edge > (mod_working_height / 2)))
        error_message("Left-side mod's size, row count, and/or vertical offset is pushing the mod off the faceplate.");
    if ((left_side_mod_type != "None") && (left_side_mod_grid_left_edge < 0 - (working_width / 2)))
        error_message("Left-side mod's size, row count, and/or horizontal offset is pushing the mod off the faceplate.");
    if ((right_side_mod_type != "None") && (right_side_mod_grid_top_edge > (mod_working_height / 2)))
        error_message("Right-side mod's size, row count, and/or vertical offset is pushing the mod off the faceplate.");
    if ((right_side_mod_type != "None") && (right_side_mod_grid_bottom_edge > (mod_working_height / 2)))
        error_message("Right-side mod's size, row count, and/or vertical offset is pushing the mod off the faceplate.");
    if ((right_side_mod_type != "None") && (right_side_mod_grid_left_edge > (working_width / 2)))
        error_message("Right-side mod's size, row count, and/or horizontal offset is pushing the mod off the faceplate.");
    if ((centered_mod_type != "None") && (centered_mod_grid_top_edge > (mod_working_height / 2)))
        error_message("Right-side mod's size, row count, and/or vertical offset is pushing the mod off the faceplate.");
    if ((centered_mod_type != "None") && (centered_mod_grid_bottom_edge > (mod_working_height / 2)))
        error_message("Centered mod's size, row count, and/or vertical offset is pushing the mod off the faceplate.");

    // Determine sizes of the cage's panels, which will be needed later.
    top_bottom_panel_width = device_width + (plate_thickness * 2) + support_cage_base_size + device_clearance;
    left_right_panel_width = device_height + (plate_thickness * 2) + support_cage_base_size + device_clearance;
    panel_depth = device_depth + plate_thickness + support_cage_base_size - 2 + device_clearance;
    rear_support_cage_side_length = rack_total_depth - panel_depth + rear_support_overlap + (plate_thickness * 2) - 2;

    // Sanity check - faceplate rounded corners
    if (!(faceplate_rounded_corners < (device_height / 2) - 2 && (faceplate_rounded_corners < (device_width / 2) - 2)))
        error_message("Faceplate rounded corners set too high.");


    // Ruler & Build Volume Outline
    if ((show_ruler) && ($preview) && (!reduce_faceplate_to_2d))
        ruler_and_outline(height_required_in_units);


    // Enable mounting ears for partial rack widths
    left_ear = (len(search(rack_cage_width, [4.75, 4.75001, 5.001, 6.33, 6.33001, 9.5, 9.5001, 12.66])) > 0);
    right_ear = (len(search(rack_cage_width, [4.75001, 6.33001, 9.5001])) > 0);


    // Let us begin!

    // Create the complete cage, now that we've done the required checking and setup.
    //
    // NOTE: Splitting the cage in half requires creating the cage twice, and selecting this
    // option will override printing the cage separately.
    if ((!split_cage_into_two_halves) || (faceplate_only != 0.0))
    {
        create_completed_cage(height_required_in_units, safe_left_side_mod_horizontal_offset, safe_right_side_mod_horizontal_offset, left_ear, right_ear);

        // If we're generating a rear support cage, it's time to do so now.
        if (safe_generate_rear_support_cage)
        {
            translate([0, (height_required_in_mm / 2) + 5, plate_thickness / 2])
                // Another difference/union/difference/union quartet.
                difference()
                {
                    union()
                    {
                        // Create the faceplate proper.
                        create_faceplate(height_required_in_units, width_in_mm, left_ear, right_ear);

                        // Center the cage array on the faceplate.
                        translate([0 - ((top_bottom_panel_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, 0])
                            difference()
                            {
                                union()
                                {
                                    for (index = [1:number_of_devices])
                                    {
                                        // Determine the X offset value for each cage.
                                        x_offset = (top_bottom_panel_width * (index - 1))  + (multiple_device_gap * (index - 1));

                                        // First, the left side.
                                        translate([0 + x_offset - ((device_width / 2) + plate_thickness + device_clearance), 0, ((rear_support_cage_side_length - rear_support_overlap ) / 2) - (plate_thickness / 2)])
                                            rotate([90, 0, 90])
                                                ventilated_side_plate((rear_support_cage_side_length - rear_support_overlap - (plate_thickness * 0)) - 1, device_height, plate_thickness * 2 + 1, 6, .001, cutout_radius, false);
                                        // Note that we're placing a second plate inside the first, and
                                        // the overlap of the two creates a T-shaped support structure.
                                        translate([0 + x_offset - ((device_width / 2) + plate_thickness + device_clearance), 0, ((rear_support_cage_side_length - rear_support_overlap ) / 2) - (plate_thickness / 2)])
                                            rotate([90, 0, 90])
                                                ventilated_side_plate((rear_support_cage_side_length - rear_support_overlap - (plate_thickness * 0)) - 1, device_height, plate_thickness, 10, .001, cutout_radius, false);
                                        
                                        // Stick a tab onto the end to provide the overlapping area that
                                        // telescopes into the back of the device cage.
                                        translate([0 + x_offset - ((device_width / 2) + (plate_thickness * 1.5) + (device_clearance / 0.5)), 0, rear_support_cage_side_length - (rear_support_overlap + plate_thickness) / 2 - 2])
                                            rotate([90, 0, 90])
                                                two_rounded_corner_plate(rear_support_overlap + plate_thickness - 0 , device_height, plate_thickness, (rear_support_overlap > 9 ? 5 : 1));

                                        // Next, perform the same process for the right side.
                                        translate([x_offset + ((device_width / 2) + plate_thickness + device_clearance), 0, ((rear_support_cage_side_length - rear_support_overlap ) / 2) - (plate_thickness / 2)])
                                            rotate([90, 0, 90])
                                                ventilated_side_plate((rear_support_cage_side_length - rear_support_overlap - (plate_thickness * 0)) - 1, device_height, plate_thickness * 2 + 1, 6, .001, cutout_radius, false);
                                        translate([x_offset + ((device_width / 2) + plate_thickness + device_clearance), 0, ((rear_support_cage_side_length - rear_support_overlap ) / 2) - (plate_thickness / 2)])
                                            rotate([90, 0, 90])
                                                ventilated_side_plate((rear_support_cage_side_length - rear_support_overlap - (plate_thickness * 0)) - 1, device_height, plate_thickness, 10, .001, cutout_radius, false);
                   
                                        translate([x_offset + ((device_width / 2) + (plate_thickness * 1.5) + (device_clearance / 0.5)), 0, rear_support_cage_side_length - (rear_support_overlap + plate_thickness) / 2 - 2])
                                            rotate([90, 0, 90])
                                                two_rounded_corner_plate(rear_support_overlap + plate_thickness - 0 , device_height, plate_thickness, (rear_support_overlap > 9 ? 5 : 1));

                                        // How about a top reinforcing wall as well?
                                        translate([x_offset, (device_height / 2) + (plate_thickness / 2), ((rear_support_cage_side_length - rear_support_overlap ) / 2) - (plate_thickness / 2)])
                                            rotate([90, 0, 0])
                                                ventilated_side_plate((rear_support_cage_side_length - rear_support_overlap - (plate_thickness * 0)) - 1, device_width + (plate_thickness * 4.5) + device_clearance, plate_thickness, 10, .001, cutout_radius, false);

                                        // Since we did a top reinforcing wall, let's do a boittom.
                                        translate([x_offset, 0 - ((device_height / 2) + (plate_thickness / 2)), ((rear_support_cage_side_length - rear_support_overlap ) / 2) - (plate_thickness / 2)])
                                            rotate([90, 0, 0])
                                                ventilated_side_plate((rear_support_cage_side_length - rear_support_overlap - (plate_thickness * 0)) - 1, device_width + (plate_thickness * 4.5) + device_clearance, plate_thickness, 10, .001, cutout_radius, false);

                                        // Finally throw a back onto the structure to give it some rigidity.
                                        translate([x_offset, 0, rear_support_cage_side_length - rear_support_overlap - (plate_thickness / 1) - device_clearance])
                                            difference()
                                            {
                                                cube([device_width + 4, device_height, plate_thickness], center=true);
                                                four_rounded_corner_plate(device_height - (plate_thickness * 3), device_width - (plate_thickness * 3), plate_thickness + 2, cutout_radius);
                                            }
                                    }
                                } // union end
                            } // difference end
                    } // union end

                    // Carve out holes in the faceplate to acommodate the device(s) to cage.
                    // If the retention lip is enabled, stop 1mm short of punching through
                    // completely so we can form the lip.
//                    if (faceplate_only == 0.0)
//                        translate([0 - ((cage_width / 2) * (number_of_devices - 1)) - ((multiple_device_gap / 2) * (number_of_devices - 1)) + cage_horizontal_offset, cage_vertical_offset, device_clearance - 1.75])
//                            union()
//                                for (index = [1:number_of_devices])
//                                    translate([0 + ((cage_width + multiple_device_gap) * (index - 1)), 0, plate_thickness * 1.5])
//                                        linear_extrude(plate_thickness * 4, center=true)
//                                            offset(r=faceplate_rounded_corners + 0.001, $fn=this_fn)
//                                                square([device_width + device_clearance - (faceplate_rounded_corners * 2), device_height + device_clearance - (faceplate_rounded_corners * 2)], center=true);
                } // difference end

            // Show a print height marker over the rear support cage.
            if (show_ruler)
                translate([0, (height_required_in_mm / 2) + 5, 0])
                    print_height_marker(rear_support_cage_side_length);
        }
    }
    else
    {
        // Split cage time!

        // Left half
        translate([(width_in_mm / 4) - 10, 0 - (height_required_in_mm / 2) - 1, 0])
        {
            union()
            {
                difference()
                {
                    // First, create a complete cage.
                    create_completed_cage(height_required_in_units, safe_left_side_mod_horizontal_offset, safe_right_side_mod_horizontal_offset, left_ear, right_ear);

                    // Then, create a huge cube to cut it in half.
                    translate([width_in_mm / 2 + cage_horizontal_offset, cage_vertical_offset, panel_depth - 5])
                        cube([width_in_mm, (height_required_in_units + 1) * unit_height_in_mm, panel_depth * 2], center=true);

                    // Clear a spot for the locking tabs that join the halves.
                    split_cage_attaching_tab(0 + cage_horizontal_offset, (device_height / 2) + plate_thickness * 1.5 + 1 + cage_vertical_offset, plate_thickness + (screw_clearance_hole * 1.5), false, true);                
                    split_cage_attaching_tab(0 + cage_horizontal_offset, 0 - (device_height / 2) - plate_thickness * 1.5 - 1 + cage_vertical_offset, device_depth + (plate_thickness / 2), false, true);

                    // Punch holes for bolting halves together.
                    translate([0 - (20 - ((screw_clearance_hole * 3) / 2)) + cage_horizontal_offset, (device_height / 2) + (plate_thickness / 2) + 1 + cage_vertical_offset, plate_thickness + (screw_clearance_hole * 1.5)])
                        rotate([90, 90, 0])
                            linear_extrude(plate_thickness + 4, center=true, twist=0, $fn=this_fn)
                                circle(d=tap_or_heat_set_holes, $fn=this_fn, false);    
                    translate([0 - (20 - ((screw_clearance_hole * 3) / 2)) + cage_horizontal_offset, 0 - (device_height / 2) + (plate_thickness / 2) - 1 + cage_vertical_offset, device_depth + (plate_thickness / 2)])
                        rotate([90, 90, 0])
                            linear_extrude(plate_thickness * 4, center=true, twist=0, $fn=this_fn)
                                circle(d=tap_or_heat_set_holes, $fn=this_fn, false);    

                    // Add alignment pin holes where required.
                    if (add_alignment_pin_holes)
                    {
                        // Determine where the pins rest horizontally.
                        alignment_pin_x_left = cage_horizontal_offset - 3;

                        // Top/bottom of faceplate
                        alignment_pin_hole(alignment_pin_x_left, 0 - (height_required_in_mm / 2) + (plate_thickness / 2), (plate_thickness / 2));
                        alignment_pin_hole(alignment_pin_x_left, (height_required_in_mm / 2) - (plate_thickness / 2), (plate_thickness / 2));

                        // Top/bottom of cage opening
                        alignment_pin_hole(alignment_pin_x_left, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, (plate_thickness / 2));
                        alignment_pin_hole(alignment_pin_x_left, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, (plate_thickness / 2));

                        // Bottom of top/bottom cage walls
                        alignment_pin_hole(alignment_pin_x_left, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, (support_cage_base_size * 1.75) + (plate_thickness / 2) + 12);
                        alignment_pin_hole(alignment_pin_x_left, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, (support_cage_base_size * 1.75) + (plate_thickness / 2) + 12);

                        // Back of cage's top/bottom walls & back
                        alignment_pin_hole(alignment_pin_x_left, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, panel_depth - 1);
                        alignment_pin_hole(alignment_pin_x_left, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, panel_depth - 1);

                        alignment_pin_hole(alignment_pin_x_left, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, panel_depth - support_cage_base_size - 4);
                        alignment_pin_hole(alignment_pin_x_left, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, panel_depth - support_cage_base_size - 4);

                        alignment_pin_hole(alignment_pin_x_left, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset + 2 + (plate_thickness / 2), device_depth + (plate_thickness / 2));
                        alignment_pin_hole(alignment_pin_x_left, (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset - 2 + (plate_thickness / 2), device_depth + (plate_thickness / 2));

                        // If extra support is enabled, add alignment pin holes into the
                        // additional support as well.
                        if (extra_support)
                        {
                            alignment_pin_hole(alignment_pin_x_left, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, (panel_depth / 1.75) - support_cage_base_size - 4);
                            alignment_pin_hole(alignment_pin_x_left, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, (panel_depth / 1.75) - support_cage_base_size - 4);
                        }
                    }
                } // difference end

                // Add attaching tabs to the cage.
                split_cage_attaching_tab(cage_horizontal_offset, 0 - (device_height / 2) - plate_thickness * 1.5 - 1 + cage_vertical_offset, plate_thickness + (screw_clearance_hole * 1.5), false);                
                split_cage_attaching_tab(cage_horizontal_offset, (device_height / 2) + plate_thickness * 1.5 + 1 + cage_vertical_offset, device_depth + (plate_thickness / 2), false);                

                // Add reinforcing around holes to which tabs bolt.
                translate([0 - (20 - ((screw_clearance_hole * 3) / 2)) + cage_horizontal_offset, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, plate_thickness + (screw_clearance_hole * 1.5)])
                    rotate([90, 90, 0])
                        tube(screw_clearance_hole * 3, plate_thickness - device_clearance, screw_clearance_hole, $fn=this_fn);
                translate([0 - (20 - ((screw_clearance_hole * 3) / 2)) + cage_horizontal_offset, 0 - (device_height / 2) + (plate_thickness / 2) - plate_thickness + cage_vertical_offset, device_depth + (plate_thickness / 2)])
                    rotate([90, 90, 0])
                        tube(screw_clearance_hole * 3, plate_thickness - device_clearance, screw_clearance_hole, $fn=this_fn);

            } // union end
        }

        // Right half
        translate([0 - (width_in_mm / 4) + 10, (height_required_in_mm / 2) + 1, 0])
        {
            union()
            {
                difference()
                {
                    create_completed_cage(height_required_in_units, safe_left_side_mod_horizontal_offset, safe_right_side_mod_horizontal_offset, left_ear, right_ear);

                    translate([0 - (width_in_mm / 2 - cage_horizontal_offset), cage_vertical_offset, panel_depth - 5])
                        cube([width_in_mm, (height_required_in_units + 1) * unit_height_in_mm, panel_depth * 2], center=true);

                    // Clear a spot for the locking tabs that join the halves.
                    split_cage_attaching_tab(cage_horizontal_offset, 0 - (device_height / 2) - plate_thickness * 1.5 - 1 + cage_vertical_offset, plate_thickness + (screw_clearance_hole * 1.5), true, true);                
                    split_cage_attaching_tab(cage_horizontal_offset, (device_height / 2) + plate_thickness * 1.5 + 1 + cage_vertical_offset, device_depth + (plate_thickness / 2), true, true);

                    // Punch holes for bolting halves together.
                    translate([(20 - ((screw_clearance_hole * 3) / 2)) + cage_horizontal_offset, 0 - (device_height / 2) - (plate_thickness / 2) - 1 + cage_vertical_offset, plate_thickness + (screw_clearance_hole * 1.5)])
                        rotate([90, 90, 0])
                            linear_extrude(plate_thickness + 4, center=true, twist=0, $fn=this_fn)
                                circle(d=tap_or_heat_set_holes, $fn=this_fn, false);    
                    translate([(20 - ((screw_clearance_hole * 3) / 2)) + cage_horizontal_offset, (device_height / 2) - (plate_thickness / 2) + 1 + cage_vertical_offset, device_depth + (plate_thickness / 2)])
                        rotate([90, 90, 0])
                            linear_extrude(plate_thickness * 4, center=true, twist=0, $fn=this_fn)
                                circle(d=tap_or_heat_set_holes, $fn=this_fn, false);    

                    // Add alignment pin holes where required.
                    if (add_alignment_pin_holes)
                    {
                        // Determine where the pins rest horizontally.
                        alignment_pin_x_right = cage_horizontal_offset + 3;

                        // Top/bottom of faceplate
                        alignment_pin_hole(alignment_pin_x_right, 0 - (height_required_in_mm / 2) + (plate_thickness / 2), (plate_thickness / 2));
                        alignment_pin_hole(alignment_pin_x_right, (height_required_in_mm / 2) - (plate_thickness / 2), (plate_thickness / 2));

                        // Top/bottom of cage opening
                        alignment_pin_hole(alignment_pin_x_right, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, (plate_thickness / 2));
                        alignment_pin_hole(alignment_pin_x_right, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, (plate_thickness / 2));

                        // Bottom of top/bottom cage walls
                        alignment_pin_hole(alignment_pin_x_right, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, (support_cage_base_size * 1.75) + (plate_thickness / 2) + 12);
                        alignment_pin_hole(alignment_pin_x_right, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, (support_cage_base_size * 1.75) + (plate_thickness / 2) + 12);

                        // Back of cage's top/bottom walls & back
                        alignment_pin_hole(alignment_pin_x_right, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, panel_depth - 1);
                        alignment_pin_hole(alignment_pin_x_right, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, panel_depth - 1);

                        alignment_pin_hole(alignment_pin_x_right, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, panel_depth - support_cage_base_size - 4);
                        alignment_pin_hole(alignment_pin_x_right, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, panel_depth - support_cage_base_size - 4);

                        alignment_pin_hole(alignment_pin_x_right, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset + 2 + (plate_thickness / 2), device_depth + (plate_thickness / 2));
                        alignment_pin_hole(alignment_pin_x_right, (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset - 2 + (plate_thickness / 2), device_depth + (plate_thickness / 2));

                        // If extra support is enabled, add alignment pin holes into the
                        // additional support as well.
                        if (extra_support)
                        {
                            alignment_pin_hole(0 - alignment_pin_x_right, 0 - (device_height / 2) - (plate_thickness / 2) + cage_vertical_offset, (panel_depth / 1.75) - support_cage_base_size - 4);
                            alignment_pin_hole(0 - alignment_pin_x_right, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, (panel_depth / 1.75) - support_cage_base_size - 4);
                        }
                    }
                } // difference end

                // Add attaching tabs to the cage.
                split_cage_attaching_tab(cage_horizontal_offset, (device_height / 2) + plate_thickness * 1.5 + 1 + cage_vertical_offset, plate_thickness + (screw_clearance_hole * 1.5), true);                
                split_cage_attaching_tab(cage_horizontal_offset, 0 - (device_height / 2) - plate_thickness * 1.5 - 1 + cage_vertical_offset, device_depth + (plate_thickness / 2), true);

                // Add reinforcing around holes to which tabs bolt.
                translate([(20 - ((screw_clearance_hole * 3) / 2)) + cage_horizontal_offset, 0 - ((device_height / 2) + (plate_thickness / 2)) + cage_vertical_offset, plate_thickness + (screw_clearance_hole * 1.5)])
                    rotate([90, 90, 0])
                        tube(screw_clearance_hole * 3, plate_thickness - device_clearance, screw_clearance_hole, $fn=this_fn);
                translate([(20 - ((screw_clearance_hole * 3) / 2)) + cage_horizontal_offset, (device_height / 2) + (plate_thickness / 2) + cage_vertical_offset, device_depth + (plate_thickness / 2)])
                    rotate([90, 90, 0])
                        tube(screw_clearance_hole * 3, plate_thickness - device_clearance, screw_clearance_hole, $fn=this_fn);
            } // union end               
        }
    }
}



// END!
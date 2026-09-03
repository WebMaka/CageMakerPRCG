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

    Ventilation Grid Generators

*/



// Ventilation hole generator routing - call this module with parameters and the appropriate
// module to generate the selected ventilation grid will be invoked. This allows for much
// easier additions of new grid types without having to change large swaths of code - just
// add a new generator module and a new if-then here to call it.
module create_ventilation_grid(vent_hole_pattern, grid_width, grid_height, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset)
{
    if (vent_hole_pattern != "None")
    {
        if (vent_hole_pattern == "Hex")
            hexagonal_grid_of_holes(grid_width, grid_height, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, 6, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset);

        if (vent_hole_pattern == "Round")
            hexagonal_grid_of_holes(grid_width, grid_height, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, 32, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset);

        if (vent_hole_pattern == "Staggered")
            hexagonal_grid_of_holes(grid_width, grid_height, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, 4, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset);

        if (vent_hole_pattern == "Grid")
            square_grid(grid_width, grid_height, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, 4, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset);

        if (vent_hole_pattern == "Isometric")
            isometric_grid(grid_width, grid_height, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, 4, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset);

        if (vent_hole_pattern == "Triangle")
            triangular_grid(grid_width, grid_height, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, 4, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset);

        if (vent_hole_pattern == "Octagon")
            hexagonal_grid_of_holes(grid_width, grid_height, plate_thickness, faceplate_vent_hole_size, faceplate_vent_wall_thickness, 8, faceplate_vent_grid_angle, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset);
    }
}

// Create a square grid, for use as a ventilation grid.
module square_grid(grid_width, grid_height, plate_thickness, vent_hole_size, vent_wall_thickness, vent_hole_facet_count=32, vent_grid_angle=0, vent_grid_horizontal_offset=0,vent_grid_vertical_offset=0)
{
    intersection()
    {
        cube([grid_width - 2, grid_height - 2, plate_thickness], center=true);

        // This process is rather simple: draw two lines at 45 and 135 degrees,
        // and rotate the result 45 degrees to make it a square grid.
        translate([vent_grid_horizontal_offset,vent_grid_vertical_offset,0])
            rotate([0, 0, 45 + vent_grid_angle])
                union()            
                {
                    for (x = [0: (vent_hole_size * 2) + vent_wall_thickness + (vent_wall_thickness / 2): grid_width * 2])
                    {
                        translate([x, 0, (plate_thickness / 2) - 1])
                        {
                            rotate([0, 0, 45])
                                cube([vent_wall_thickness, grid_width * 2.66, plate_thickness + 2], center=true);
                            rotate([0, 0, 135])
                                cube([vent_wall_thickness, grid_width * 2.66, plate_thickness + 2], center=true);
                        }
                        translate([0 - x, 0, (plate_thickness / 2) - 1])
                        {
                            rotate([0, 0, 45])
                                cube([vent_wall_thickness, grid_width * 2.66, plate_thickness + 2], center=true);
                            rotate([0, 0, 135])
                                cube([vent_wall_thickness, grid_width * 2.66, plate_thickness + 2], center=true);
                        }
                    }
                }
    }
}

// Create an isometric grid, for use as a ventilation grid.
module isometric_grid(grid_width, grid_height, plate_thickness, vent_hole_size, vent_wall_thickness, vent_hole_facet_count=32, vent_grid_angle=0, vent_grid_horizontal_offset=0,vent_grid_vertical_offset=0)
{
    intersection()
    {
        cube([grid_width - 2, grid_height - 2, plate_thickness], center=true);

        // This process is rather simple: draw two lines at 60 and 120 degrees.
        translate([vent_grid_horizontal_offset,vent_grid_vertical_offset,0])
            rotate([0, 0, 90 + vent_grid_angle])
                union()            
                {
                    for (x = [0: (vent_hole_size * (8/3)) + (vent_wall_thickness / 2): grid_width * 2])
                    {
                        translate([x, 0, (plate_thickness / 2) - 1])
                        {
                            rotate([0, 0, 60])
                                cube([vent_wall_thickness, grid_width * 3, plate_thickness + 2], center=true);
                            rotate([0, 0, 120])
                                cube([vent_wall_thickness, grid_width * 3, plate_thickness + 2], center=true);
                        }
                        translate([0 - x, 0, (plate_thickness / 2) - 1])
                        {
                            rotate([0, 0, 60])
                                cube([vent_wall_thickness, grid_width * 3, plate_thickness + 2], center=true);
                            rotate([0, 0, 120])
                                cube([vent_wall_thickness, grid_width * 3, plate_thickness + 2], center=true);
                        }
                    }
                }
    }
}

// Create a triangular grid, for use as a ventilation grid.
module triangular_grid(grid_width, grid_height, plate_thickness, vent_hole_size, vent_wall_thickness, vent_hole_facet_count=32, vent_grid_angle=0, vent_grid_horizontal_offset=0,vent_grid_vertical_offset=0)
{
    // Perform some math for the triangle grid.
    triangle_width = (vent_hole_size * 3.5) + (vent_wall_thickness);

    // Split the difference between 30 and 60 degrees to calculate the triangle height.
    triangle_height = triangle_width * tan(45);

    // Since we're creating a grid of essentially two triangles merged into a rhombus
    // shape, we divide them in half to split them into two triangles. For this, we
    // need that distance.
    half_height = triangle_height / 2; 

    intersection()
    {
        cube([grid_width - 2, grid_height - 2, plate_thickness], center=true);

        // Draw the grid from the center out in both axes, first at 60 and 120
        // degrees to define the rhomboids, then horizontally to cut the rhomboids
        // into equilateral triangles. Center-out for both axes keeps everything
        // aligned regardless of hole size and wall thickness.
        translate([vent_grid_horizontal_offset,vent_grid_vertical_offset,0])
            rotate([0, 0, vent_grid_angle])
                union()            
                {
                    for (x = [0: triangle_width : grid_width * 2])
                    {
                        translate([x, 0, (plate_thickness / 2) - 1])
                        {
                            rotate([0, 0, 60])
                                cube([vent_wall_thickness, grid_width * 3, plate_thickness + 2], center=true);
                            rotate([0, 0, 120])
                                cube([vent_wall_thickness, grid_width * 3, plate_thickness + 2], center=true);
                        }
                        translate([0-x, 0, (plate_thickness / 2) - 1])
                        {
                            rotate([0, 0, 60])
                                cube([vent_wall_thickness, grid_width * 3, plate_thickness + 2], center=true);
                            rotate([0, 0, 120])
                                cube([vent_wall_thickness, grid_width * 3, plate_thickness + 2], center=true);
                        }
                    }
                    for (y = [0: half_height : grid_width * 2])
                    {
                        translate([y, 0, 0])
                            rotate([0, 0, 90])
                                cube([grid_width * 2, vent_wall_thickness, plate_thickness + 3], center=true);
                        translate([0 - y, 0, 0])
                            rotate([0, 0, 90])
                                cube([grid_width * 2, vent_wall_thickness, plate_thickness + 3], center=true);
                    }
                }
    }
}

// Create a hexagonal grid of holes based on the cylinder primitive, for use as a ventilation
// grid.
//
// Hat Tip: Heavily modified from a code snippet from Thingiverse user "M_D_K", aka Marty Kell.
// Originally posted at: https://www.thingiverse.com/thing:3645932
// Licensed under the Creative Commons - Attribution license.
//
// NOTE: The value used for "vent_hole_facet_count" sets the hole geometry. 3 = triangle, 4 = square, 
// 6 = hexagon, 8 = octagon, 16+ = round.
module hexagonal_grid_of_holes(grid_width, grid_height, plate_thickness, vent_hole_size, vent_wall_thickness, vent_hole_facet_count=32, vent_grid_angle=0, vent_grid_horizontal_offset=0,vent_grid_vertical_offset=0)
{
    // Step size - vertical is a cosine of horizontal for hexagonally (30°) staggered holes
    sx = (vent_hole_size * 2) + vent_wall_thickness;
    sy = sx * cos(30);

    // Row/column count, which is based on the wider size of the desired grid.
    larger_size = (grid_width >= grid_height ? grid_width : grid_height);
    rows = round(larger_size / ((vent_hole_size * 2) + vent_wall_thickness)) * 1.666;

    // Plate size - this is set to be deliberately oversized so it can be trimmed and inserted
    // into another component via intersection/union operations.
    plate_size = ((vent_hole_size + vent_wall_thickness) * rows) * 1.666;

    // Rotation angle for faceted holes - different facet counts call for different 
    // rotation angles for best results.
    rotation_angle = vent_hole_facet_count == 3 ? 90 : vent_hole_facet_count == 4 ? 45 : vent_hole_facet_count == 6 ? 90 : vent_hole_facet_count == 8 ? 20 : 0;

    intersection()
    {
        // Create a cuboid the desired size of the grid - this will be used to trim
        // the excess grid size down to fit as the grid has to be generated oversized
        // so that variable angles won't result in incomplete grids.
        cube([grid_width, grid_height, plate_thickness], center=true);

        difference() 
        {
            // Create a cuboid to hole-punch.
            cube([plate_size, plate_size, plate_thickness], center=true);

            // Note that we're effectively placing the holes from the center out so that
            // the array can be symmetrical and centered relative to the world coords
            // of OpenSCAD. The resulting grid should be translated into place afterward
            // and trimmed/shaped to fit.
            translate([vent_grid_horizontal_offset,vent_grid_vertical_offset,0])
                rotate([0, 0, vent_grid_angle])
                    union()
                        for(y = [0  : rows / 2 + 1])
                            for(x = [0 : rows / 2 + 1])
                            {
                                // +X/+Y quadrant
                                translate([sx * x, y * 2 * sy, 0])
                                    rotate([0, 0, rotation_angle])
                                        cylinder(r=vent_hole_size, h=plate_thickness + 2, center=true, $fn=vent_hole_facet_count);
                                translate([(sx * x) + (sx / 2), y * 2 * sy + sy, 0])
                                    rotate([0, 0, rotation_angle])
                                        cylinder(r=vent_hole_size, h=plate_thickness + 2, center=true, $fn=vent_hole_facet_count);

                                // -X/+Y quadrant
                                translate([0 - (sx * x), y * 2 * sy, 0])
                                    rotate([0, 0, rotation_angle])
                                        cylinder(r=vent_hole_size, h=plate_thickness + 2, center=true, $fn=vent_hole_facet_count);
                                translate([0 - ((sx * x) + (sx / 2)), y * 2 * sy + sy, 0])
                                    rotate([0, 0, rotation_angle])
                                        cylinder(r=vent_hole_size, h=plate_thickness + 2, center=true, $fn=vent_hole_facet_count);

                                // +X/-Y quadrant
                                translate([sx * x, 0 - (y * 2 * sy), 0])
                                    rotate([0, 0, rotation_angle])
                                        cylinder(r=vent_hole_size, h=plate_thickness + 2, center=true, $fn=vent_hole_facet_count);
                                translate([(sx * x) + (sx / 2), 0 - (y * 2 * sy + sy), 0])
                                    rotate([0, 0, rotation_angle])
                                        cylinder(r=vent_hole_size, h=plate_thickness + 2, center=true, $fn=vent_hole_facet_count);

                                // -X/-Y quadrant
                                translate([0 - (sx * x), 0 - (y * 2 * sy), 0])
                                    rotate([0, 0, rotation_angle])
                                        cylinder(r=vent_hole_size, h=plate_thickness + 2, center=true, $fn=vent_hole_facet_count);
                                translate([0 - ((sx * x) + (sx / 2)), 0 - (y * 2 * sy + sy), 0])
                                    rotate([0, 0, rotation_angle])
                                        cylinder(r=vent_hole_size, h=plate_thickness + 2, center=true, $fn=vent_hole_facet_count);
                            }
        }
    }
}



// END!
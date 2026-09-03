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

    Error Message Handling

*/



// Create an ERROR/WARNING panel for display within the render window.
module error_message(error_text)
{
    // Work out where to display the warning, which will be "below" the cage's facelate.
    // Determine the height in units that will be required to accommodate the device
    // to be caged, or, set the unit height to the faceplate_only setting.
    total_height_required = device_height + support_cage_base_size + (plate_thickness * 2);
    height_required_in_units = faceplate_only == 0.0 ? (ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1) : faceplate_only;

    units_required = (faceplate_only == 0.0 ? ((ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1)) : ((ceil((total_height_required * 2) / unit_height_in_mm)) / 2));
    units_required_in_mm = (units_required + 1) * unit_height_in_mm;

    if (!ignore_errors)
    {
        // Draw the warning symbol triangle
        translate([0, 0 - (units_required_in_mm / (((print_cage_separately) || (split_cage_into_two_halves)) ? 0.95:2)) - 100, 3])
            color("red")
                linear_extrude(height=1, center=true)
                    polygon(points=[[-40,0],[0, 80],[40,0],[-30,6],[0,70],[30,6]], paths=[[0,1,2],[3,4,5]]);

        // Stick an exclamation point into the triangle
        translate([-6, 0 - (units_required_in_mm / (((print_cage_separately) || (split_cage_into_two_halves)) ? 0.95:2)) - 68, 3])
            color("red")
                linear_extrude(height=1, center=true)
                    text("!", halign="left", valign="center", size=35);

        // Add some text
        translate([0, 0 - (units_required_in_mm / (((print_cage_separately) || (split_cage_into_two_halves)) ? 0.95:2)) - 125, 3])
            color("red")
                linear_extrude(height=1, center=true)
                    text("CHECK CONSOLE!", halign="center", size=20);   

        // Draw a backdrop plate behind it all
        translate([0, 0 - (units_required_in_mm / (((print_cage_separately) || (split_cage_into_two_halves)) ? 0.95:2)) - 74, 2])
            color("mistyrose", 0.25)
                four_rounded_corner_plate(120, 260, 1, 5);
    }
    else
    {
        echo();
        echo("   *** WARNING - IGNORE-ERRORS OPTION IS ENABLED! ***   ");
    }

    // Fire the error message into the console.
    echo();
    echo("  *** An ERROR has occurred. The error message is:  ");
    echo();
    echo(str("  ", error_text,"  "));
    echo();
    echo("  Please double-check your settings.  ");
    echo();
    
}



// END!
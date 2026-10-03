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

    Library incorporations for special features

*/



/*
  Keystone Module library 1.0 (2019-11-25) for OpenSCAD
  Author: @grauerfuchs
  Licensed under CC BY-SA https://creativecommons.org/use-remix/cc-licenses/#by-sa  
*/

// Keystone receptacle generation
//
// Based on the Keystone Module library 1.0 (2019-11-25) for OpenSCAD
// Created by @grauerfuchs
// Originally posted at
//    https://github.com/grauerfuchs/OpenSCAD_Libs/blob/master/keystone.scad
// Licensed under CC BY-SA
//    https://creativecommons.org/use-remix/cc-licenses/#by-sa  
//
// Test solids
//translate([9.5, -11, 0]) rotate([0, 0, 90]) keystone_Module();
//translate([9.5, -11, 0]) rotate([0, 0, 90]) keystone_Receptacle();
//
// Create a receptacle block to hold a single keystone module
module keystone_Receptacle()
{
   translate([0, 0, 0])   
        difference()
        {
            cube([27, 19, 11]);
            keystone_Module();
        }
}

// Create a keystone module jack object for object subtraction
module keystone_Module()
{
    translate([2, 2, 0])
        union()
        {
            // Jack face
            translate([1.75, 0, -0.001])
                cube([16.5, 15, 10.001]); // A little over to ensure the pre-render is clean
            // Jack back
            translate([1.75, 0, 8])
                cube([19.5, 15, 3.001]); // A little over to ensure the pre-render is clean
            // Clip catches
            translate([0, 0, 5.5])
                cube([23, 15, 3.5]);
            // Fix the edge of the clip catch so you can insert a block
            translate([15, 0, 2])
                rotate([0, 40, 0])
                    cube([3, 15, 7]);
        }
}

// Place a Keystone receptacle at the given coordinates.
module place_keystone(xx, yy, zz)
{
    translate([xx, yy, zz])
        rotate ([0, 0, 90])
            translate([-13.5, -9.5, 0])
                keystone_Module();
}



// END!
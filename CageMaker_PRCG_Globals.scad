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

    Global Variable Declarations

*/

// An Important Note On Variables In OpenSCAD
//
// OpenSCAD treats all variables as immutable upon declaration, meaning that once
// a variable is called into being, its value cannot be changed. This is a pretty
// irritating limitation that requires workarounds that other languages that allow
// for mutability don't need.



// Preconfigured device options list - this sets device dimensions when a device is selected.
//
// NOTE: This is a different kludge to work around immutable variables: a
// lookup table we search for values.
preconfg_options = [
  // Routers/Gateways
  ["M-CRS309-1G-8S+IN", 191, 272, 44, 4, 0, 0],
  ["M-HEX", 89, 113, 28, 4, 0, 0],
  ["M-HEXPOE", 137, 114, 29, 4, 0, 0],
  ["M-RB4011IGS", 120, 228, 30, 4, 0, 0],
  ["S-TZ-SMALL", 135, 190, 35, 4, 0, 0],
  ["S-TZ-LARGE", 150, 225, 35, 4, 0, 0],
  ["T-ER605", 101, 158, 25, 4, 0, 0],
  ["T-ER7206", 131, 226, 35, 0, 0, 0],
  ["U-EDGE4", 137, 229, 32, 4, 0, 0],
  ["U-EDGEXSFP", 75, 142, 23, 4, 0, 0],
  ["U-EXPRESS7", 117, 117, 43, 4, 0, 1],
  ["U-UCG-FIBER", 128, 213, 30, 2, 0, 1],
  ["U-UCG-MAX", 128, 142, 30, 2, 0, 1],
  ["U-UISP-R", 95, 211, 29, 4, 0, 0],

  // 5-Port Switches
  ["D-DES-105", 98, 100, 28, 4, -0.875, 0],
  ["D-DGS-105", 85, 91, 23, 4, -0.875, 0],
  ["D-DGS-105GL", 64, 100, 24, 4, -0.875, 0],
  ["D-DMS-105", 82, 101, 28, 4, -0.875, 0],
  ["N-GS105", 94, 104, 28, 4, -0.875, 0],
  ["N-GS105Ev2", 94, 100, 27, 4, -0.875, 0],
  ["N-GS105PE", 158, 100, 27, 4, -0.875, 0],
  ["N-GS305", 94, 101, 29, 4, -0.875, 0],
  ["L-SE3005v1", 75, 121, 26, 4, -0.875, 0],
  ["L-SE3005v2", 88, 120, 26, 4, -0.875, 0],
  ["T-ES206X-M2", 101, 158, 26, 4, 0, 0],
  ["T-LS105G", 99, 100, 25, 4, -0.875, 0],
  ["T-LS1005G", 72, 90, 23, 4, -0.875, 0],
  ["T-SG105S", 98, 100, 25, 4, -0.875, 0],

  // 8-Port Switches
  ["C-GS108", 78, 138, 25, 4, 0, 0],
  ["D-DES-108", 102, 162, 28, 4, 0, 0],
  ["D-DGS-108", 85, 139, 23, 4, 0, 0],
  ["D-DGS-108GL", 67, 140, 26, 4, 0, 0],
  ["D-DMS-108", 82, 145, 28, 4, 0, 0],
  ["L-SE3008v1", 85, 154, 26, 4, 0, 0],
  ["L-SE3008v2", 90, 168, 26, 4, 0, 0],
  ["N-GS108", 94, 158, 27, 4, 0, 0],
  ["N-GS108Ev3", 158, 101, 29, 4, 0, 0],
  ["N-GS308LP", 102, 236, 27, 4, 0, 0],
  ["N-GS308", 101, 158, 29, 4, 0, 0],
  ["T-ES210X-M2", 126, 209, 26, 4, 0, 0],
  ["T-LS108G", 99, 158, 25, 4, 0, 0],
  ["T-LS1008G", 67, 127, 23, 4, 0, 0],
  ["T-TEG-S381", 85, 155, 26, 4, 0, 0],
  ["T-TEG-S82g", 97, 150, 28, 4, 0, 0],
  ["U-UISP-S", 95, 211, 29, 4, 0, 0],
  ["U-US-8-150W", 204, 235, 43, 4, 0, 0],
  ["Z-GS1100-10HP", 104, 250, 27, 4, -0.875, 0],

  // 16-Port Switches
  ["Z-GS1100-16", 133, 215, 42, 4, -0.875, 0],

  // SFP Switches
  ["M-CRS305-1G-4S+IN", 141, 115, 28, 4, 0, 0],
  ["U-UISP-S+", 170, 211, 44, 4, 0, 0],
  ["T-TEG-S5", 110, 160, 26, 4, 0, 0],

  // Small Form Factor PCs
  ["A-MACMINI", 127, 127, 50, 4, 0, 1],
  ["A-MACSTUDIO", 197, 197, 95, 4, 0, 1],
  ["D-USFF", 238, 239, 66, 6, 2, 0],
  ["D-MICRO", 178, 183, 36, 0, -0.875, 0],
  ["H-GSERIES", 175, 177, 35, 0, -0.875, 0],
  ["H-Z2G9", 218, 211, 69, 2, 0, 0],
  ["L-TCTINY", 183, 179, 37, 0, -0.875, 0],
  ["M-MS-01", 189, 196, 48, 4, 0, 0],
  ["M-MS-A1", 189, 187, 48, 4, 0, 0],
  ["I-NUC-PRO", 145, 200, 35, 4, 0, 0],
  ["I-NUC-SLIM", 112, 117, 37, 4, 0, 0],
  ["I-NUC-TALL", 112, 117, 54, 4, 0, 0],

  // Miscellaneous
  ["BAY-2.5-H", 101, 70, 19, 4, 0, 0],
  ["BAY-2.5-V", 101, 19, 70, 4, 0, 0],
  ["BAY-2.5H-H", 101, 70, 10, 4, 0, 0],
  ["BAY-2.5H-V", 101, 10, 70, 4, 0, 0],
  ["BAY-3.5-H", 147, 102, 26, 4, 0, 0],
  ["BAY-3.5-V", 147, 26, 102, 4, 0, 0],
  ["BAY-E1.S-9.5-H", 119, 34, 10, 4, 0, 0],
  ["BAY-E1.S-9.5-V", 119, 10, 34, 4, 0, 0],
  ["BAY-E1.S-15-H", 119, 34, 15, 4, 0, 0],
  ["BAY-E1.S-15-V", 119, 15, 34, 4, 0, 0],
  ["BAY-E1.S-25-H", 119, 34, 25, 4, 0, 0],
  ["BAY-E1.S-25-V", 119, 25, 34, 4, 0, 0],
  ["BAY-E1.L-9.5-H", 319, 39, 10, 4, 0, 0],
  ["BAY-E1.L-9.5-V", 319, 10, 39, 4, 0, 0],
  ["BAY-E1.L-18-H", 319, 39, 18, 4, 0, 0],
  ["BAY-E1.L-18-V", 319, 18, 39, 4, 0, 0],
  ["BAY-E3.S-H", 113, 76, 8, 4, 0, 0],
  ["BAY-E3.S-V", 113, 8, 76, 4, 0, 0],
  ["BAY-E3.S-2T-H", 113, 76, 17, 4, 0, 0],
  ["BAY-E3.S-2T-V", 113, 17, 76, 4, 0, 0],  
  ["BAY-E3.L-H", 142, 76, 8, 4, 0, 0],
  ["BAY-E3.L-V", 142, 8, 76, 4, 0, 0],
  ["BAY-E3.L-2T-H", 142, 76, 17, 4, 0, 0],
  ["BAY-E3.L-2T-V", 142, 17, 76, 4, 0, 0],


//  ["NAME", depth, width, height, 4, 0, 0],
];
// For adding new equipment options, the format is:
//  ["model#", depth, width, height, default_base_size, default_surface_thickness, force_solid_bottom]
// Where:
//   "model#" is as selected in the preconfigured_device variable.
//   depth, width, and height are the dimensions of the device in mm.
//   default_base_size sets the cage corner-reinforcing geometry (4 by default).
//   default_surface_thickness sets the surface_thickness parameter that sets the thickness of all structures (4 by default).
//   force_solid_bottom forces the bottom of the cage to "Solid" if set to true (1).

// Set the dimensions, cage's base size, and surface_thickness setting to the selected preconfigured device info if a device is selected. Otherwise, use the manual settings.
use_preconfig = (preconfigured_device != "");
device_depth = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][1] : manual_device_depth;
device_width = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][2] : manual_device_width;
device_height = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][3] : manual_device_height;
support_cage_base_size = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][4] : manual_support_cage_base_size;
surface_thickness = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][5] : manual_surface_thickness;

// Making the bottom a solid plane is forced if required but optional otherwise.
cage_bottom_geometry_override = use_preconfig ? (preconfg_options[search([preconfigured_device], preconfg_options)[0]][6] == 0 ? cage_bottom_geometry : "Solid") : cage_bottom_geometry;

// Rack geometry - this sets the "unit" height and mounting hole pattern based on the mode selected by the rack_geometry setting. By default, the size of a single "unit" of rack space is set to 1.75" or 44.45mm, and mounting hole pattern is set to 6.35, 22.225, and 38.1mm relative to the "top" edge of each "unit," for EIA-310-D standard racks.
rack_geometry_options = [
  ["EIA-310", 44.45, [6.35, 22.225, 38.1], 17.4625, 5.25, 15.875],
  ["EIA-310-LH", 44.45, [6.35, 22.225, 38.1], 17.4625, 6.53, 15.875],
  ["EIA-310-1T", 44.45, [6.35], 17.4625, 5.25, 15.875],
  ["EIA-310-1C", 44.45, [22.225], 17.4625, 5.25, 15.875],
  ["EIA-310-2", 44.45, [6.35, 38.1], 17.4625, 5.25, 15.875],
  ["EIA-310-2020", 44.45, [6.35, 22.225, 38.1], 20.0, 5.25, 20],
  ["HALF-EIA-310", 22.225, [3.175, 11.1125, 19.05], 8.73125, 3.15, 8],
  ["12mm", 12.00, [6.00], 17.4625, 5.25, 16],
  ["15mm", 15.00, [7.50], 17.4625, 5.25, 16],
  ["16mm", 16.00, [8.00], 17.4625, 5.25, 16],
  ["16.5mm", 16.50, [8.25], 17.4625, 5.25, 20],
  ["20mm", 20.00, [10.00], 17.4625, 5.25, 16],
  ["20mm_2h", 20.00, [5.00, 15.00], 17.4625, 5.25, 16],
  ["24mm", 24.00, [12.00], 17.4625, 5.25, 16],
  ["25mm", 25.00, [12.50], 17.4625, 5.25, 16],
  ["25mm_2h", 25.00, [6.25, 18.75], 17.4625, 5.25, 16],
  ["30mm", 30.00, [15.00], 17.4625, 5.25, 16],
  ["30mm_2h", 30.00, [7.5, 22.5], 17.4625, 5.25, 16],
  ["36mm", 30.00, [18.0], 17.4625, 5.25, 16],
  ["40mm", 40.00, [20.00], 17.4625, 5.25, 16],
  ["40mm_2h", 40.00, [10.00, 30.00], 17.4625, 5.25, 16],
  ["50mm", 50.00, [25.00], 17.4625, 5.25, 16],
  ["50mm_2h", 50.00, [12.50, 37.50], 17.4625, 5.25, 16],
];
// For adding new custom entries, the format is:
//  ["Name", unit_height, [first_hole, second_hole, third_hole, etc.], mounting_hole_center_difference, mounting_hole_diameter, mounting_reservation_space]
// Where:
//   "Name" is as selected in the rack_geometry variable.
//   unit_height is what the name implies, what the rack system considers one "unit" of height.
//   first_hole, second-hole, etc. are the mounting hole spacing in mm from the topmost edge of the unit.
//   mounting_hole_center_difference is the difference between rack width and mounting centerline. For
//     example, for an EIA-310 rack the mounting centers are 18-5/16" for a 19" rack, or 0.6875" (11/16")
//     less than the width.
//   mounting_hole_diameter is also what the name implies.
//   mounting_reservation_space is the area behind the left and right side of the faceplate that is
//     reserved for mounting space, e.g., the portion of the faceplate that rests against rack rails.
unit_height_in_mm = rack_geometry == "Custom" ? custom_rack_geometry_unit_height : rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][1];
mounting_hole_pattern = rack_geometry == "Custom" ? custom_rack_geometry_mounting_hole_pattern : rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][2];
mounting_hole_center_difference = rack_geometry == "Custom" ? (rack_cage_width - custom_mounting_hole_center_difference) : rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][3];
mounting_hole_diameter = rack_geometry == "Custom" ? custom_rack_geometry_mounting_hole_diameter : rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][4];
mounting_reservation_space = rack_geometry == "Custom" ? custom_rack_geometry_mounting_reservation_area : rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][5];


// Side/top/bottom cutout edge thickness in mm (higher number makes the cutout smaller) - NOTE: This should not normally need to be changed.
cutout_edge = 5;

// Plate thickness - default is 4mm, but the surface_thickness setting adds to this. Increasing this base value makes everything thicker and stronger, but above around 8mm other settings (most critically, support_cage_base_size) have to be adjusted.
plate_thickness = 4 + surface_thickness;

// Rear support cage override - generating a rear support cage is disabled if we're either splitting
// the cage or printing the cage separately from the faceplate.
safe_generate_rear_support_cage = (split_cage_into_two_halves || print_cage_separately) ? false : generate_rear_support_cage;

// Establish outside sizes for the mod options. We'll use these later for 
// both sanity checking and automatic positioning.
//
// The format is simple:
// ["ModName", width, height],
mod_sizes = [
  ["None", 0, 0],

  ["Keystone", 21, 28],
  ["KeystoneFlipped", 21, 28],
  ["DSeries", 26, 31],

  ["SBC85x58_H", 60, 30],
  ["SBC85x58_VR", 30, 60],
  ["SBC85x58_VL", 30, 60],

  ["RearIO", 160, 49],
  ["PCISlot", 16.51, 125],
  ["PCISlot_LP", 16.51, 85],

  ["30mmFan", 34, 34],
  ["40mmFan", 44, 44],
  ["60mmFan", 64, 64],
  ["80mmFan", 84, 84],
  ["92mmFan", 96, 96],
  ["120mmFan", 124, 124],
  ["140mmFan", 144, 144],

  ["10mmButton", 18, 18],
  ["12mmButton", 20, 20],
  ["16mmButton", 24, 24],
  ["19mmButton", 27, 27],
  ["24mmButton", 32, 32],

  ["VESAB", 70, 40],
  ["VESAC", 95, 55],
  ["VESAD75", 95, 95],
  ["VESAD100", 120, 120],
  ["VESAE50", 220, 120],
  ["VESAE100", 220, 120],
  ["VESAF200", 220, 220],

  ["16A3", 64, 64],
  ["16A4", 82, 82],
  ["32A3", 82, 82],
  ["32A4", 82, 82],
  ["C13H", 46, 38],
  ["C13V", 38, 46],
  ["C14H", 54, 34],
  ["C14V", 34, 54],
  ["C19H", 52, 40],
  ["C19V", 40, 52],
  ["C20H", 61, 40],
  ["C20V", 40, 61],

  ["DIN1/32H", 53, 30.5],
  ["DIN1/16", 53, 53],
  ["DIN1/8H", 100, 53],
  ["DIN1/8V", 53, 100],
  ["DIN1/4", 100, 100],

  ["CustomA", (custom_cutout_a_shape == "Round" ? custom_cutout_a_diameter_height : custom_cutout_a_width) + 8 + (custom_cutout_a_snap_in_recess ? 6 : 0) + custom_cutout_a_horizontal_padding, custom_cutout_a_diameter_height + 8 + (custom_cutout_a_snap_in_recess ? 6 : 0) + custom_cutout_a_vertical_padding],
  ["CustomB", (custom_cutout_b_shape == "Round" ? custom_cutout_b_diameter_height : custom_cutout_b_width) + 8 + (custom_cutout_b_snap_in_recess ? 6 : 0) + custom_cutout_b_horizontal_padding, custom_cutout_b_diameter_height + 8 + (custom_cutout_b_snap_in_recess ? 6 : 0) + custom_cutout_b_vertical_padding],
  ["CustomC", (custom_cutout_c_shape == "Round" ? custom_cutout_c_diameter_height : custom_cutout_c_width) + 8 + (custom_cutout_c_snap_in_recess ? 6 : 0) + custom_cutout_c_horizontal_padding, custom_cutout_c_diameter_height + 8 + (custom_cutout_c_snap_in_recess ? 6 : 0) + custom_cutout_c_vertical_padding],
];
// For adding new custom entries, the format is:
//  "ModName", width, height
// Where:
//  "ModName" is as selected for the modification.
//  width and height determine the reservation space width/height around the modification.

// Set the sizes of the faceplate mods as selected.
right_side_mod_width = mod_sizes[search([right_side_mod_type], mod_sizes)[0]][1];
right_side_mod_height = mod_sizes[search([right_side_mod_type], mod_sizes)[0]][2];
left_side_mod_width = mod_sizes[search([left_side_mod_type], mod_sizes)[0]][1];
left_side_mod_height = mod_sizes[search([left_side_mod_type], mod_sizes)[0]][2];
centered_mod_width = mod_sizes[search([centered_mod_type], mod_sizes)[0]][1];
centered_mod_height = mod_sizes[search([centered_mod_type], mod_sizes)[0]][2];

// Do liekwise for the backplate.
cage_back_right_side_mod_width = mod_sizes[search([cage_back_right_side_mod_type], mod_sizes)[0]][1];
cage_back_right_side_mod_height = mod_sizes[search([cage_back_right_side_mod_type], mod_sizes)[0]][2];
cage_back_left_side_mod_width = mod_sizes[search([cage_back_left_side_mod_type], mod_sizes)[0]][1];
cage_back_left_side_mod_height = mod_sizes[search([cage_back_left_side_mod_type], mod_sizes)[0]][2];
cage_back_centered_mod_width = mod_sizes[search([cage_back_centered_mod_type], mod_sizes)[0]][1];
cage_back_centered_mod_height = mod_sizes[search([cage_back_centered_mod_type], mod_sizes)[0]][2];

// Determine hole diameters for screw clearances based on the tap/heat-set
// hole setting. We'll use close-clearance hole diameters for the corresponding
// tap/heat-set hole setting, so as to automatically add screw clearance holes
// to match the selected tap diameter or heat-set.
hole_options = [
  [3.15, 3.15], // 3.15:"M3 Clearance (3.15mm hole)", 
  [4.20, 4.20], // 4.20:"M4 Clearance (4.2mm hole)", 
  [5.25, 5.25], // 5.25:"M5 Clearance (5.25mm hole) - DEFAULT", 
  [6.30, 6.30], // 6.30:"M6 Clearance (6.3mm hole)", 
  [2.95, 2.95], // 2.95:"4-40 Clearance (.1160 in. hole)", 
  [3.66, 3.66], // 3.66:"6-32 Clearance (.144 in. hole)",  
  [4.31, 4.31], // 4.31:"8-32 Clearance (.1695 in. hole)", 
  [4.98, 4.98], // 4.98:"10-24/10-32 Clearance (.1960 in. hole)", 
  [6.53, 6.53], // 6.53:"1/4-20 Clearance (.257 in. hole)" 

  [2.50, 3.15], // 2.6:"M3 Tapped/Threadcutting (2.5mm hole)",    
  [3.50, 4.20], // 3.5:"M4 Tapped/Threadcutting (3.5mm hole)",    
  [4.40, 5.25], // 4.4:"M5 Tapped/Threadcutting (4.4mm hole)",    
  [5.00, 6.30], // 5.00:"M6 Tapped/Threadcutting (5.0mm hole)",   
  [2.07, 2.95], // 2.07:"4-40 Tapped/Threadcutting (0.0813 in. hole)",    
  [2.53, 3.66], // 2.53:"6-32 Tapped/Threadcutting (.0997 in. hole)",   
  [3.19, 4.31], // 3.19:"8-32 Tapped/Threadcutting (.1257 in. hole)",    
  [3.53, 4.98], // 3.53:"10-24/10-32 Tapped/Threadcutting (.1389 in. hole)",    
  [4.79, 6.53], // 4.79:"1/4-20 Tapped/Threadcutting (.1887 in. hole)",    

  [3.98, 3.15], // 3.98:"M3 Heat-Set (4mm hole)",
  [4.10, 3.15], // 4.1:"M3 Heat-Set (4.1mm hole)",
  [4.80, 3.15], // 4.8:"M3 Heat-Set (4.8mm hole)",
  [5.60, 4.20], // 5.6:"M4 Heat-Set (5.6mm hole)",
  [5.70, 4.20], // 5.7:"M4 Heat-Set (5.7mm hole)",
  [6.40, 5.25], // 6.4:"M5 Heat-Set (6.4mm hole)",
  [6.50, 5.25], // 5.7:"M5 Heat-Set (6.5mm hole)",
  [8.00, 6.30], // 8.0:"M6 Heat-Set (8mm hole)",
  [8.10, 6.30], // 8.1:"M6 Heat-Set (8.1mm hole)",
  [3.99, 2.95], // 3.99:"4-40 Heat-Set (0.157 in. hole)",
  [4.03, 2.95], // 4.03:"4-40 Heat-Set (0.159 in. hole)",
  [4.76, 3.66], // 4.76:"6-32 Heat-Set (0.1875 in. hole)",
  [4.85, 3.66], // 4.85:"6-32 Heat-Set (0.191 in. hole)",
  [5.61, 4.31], // 5.6:"8-32 Heat-Set (0.221 in. hole)",
  [5.74, 4.31], // 5.74:"8-32 Heat-Set (0.226 in. hole)",
  [6.41, 4.98], // 6.4:"10-24 Heat-Set (0.252 in. hole)",
  [6.51, 4.98], // 6.5:"10-24 Heat-Set (0.256 in. hole)",
  [8.01, 6.53], // 8.0:"1/4-20 Heat-Set (0.315 in. hole)"
  [8.11, 6.53], // 8.1:"1/4-20 Heat-Set (0.319 in. hole)"

  [0.00, 5.25], // Default fallback - 5.25mm for M5/#10
];
screw_clearance_hole = hole_options[search(tap_or_heat_set_holes, hole_options)[0]][1];

// Calculate maximum device width for the current settings.
max_device_width = (rack_cage_width * 25.4) - (mounting_reservation_space * 2) - (plate_thickness * 2) - (generate_rear_support_cage ? 8 : support_cage_base_size) - (print_cage_separately ? 8 : 0);



// END!
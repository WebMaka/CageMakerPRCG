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



 Patch Notes
 --------------------------------------------------------------------------------
 
 These got too long to include here - please visit the CageMaker PRCG Github page
 for patch noted for the current release.

*/



// Customizer setup



/* [Target Device Presets] */

// Preconfigured Devices - Select a device from the list to automatically configure a cage to contain it. - NOTE: Please be aware that this only presets the cage for the size of the device, and other settings may need to be enabled for best results. - NOTE: Selecting anything from this list overrides the manual dimension configuration options in the "Target Device Dimensions" category below.
preconfigured_device = ""; // ["":"Select device dimensions manually in Target Device Dimensions","":"","":"Routers/Gateways","M-CRS309-1G-8S+IN":"  Mikrotik CRS309-1G-8S+IN","M-HEX":"  Mikrotik hEX Series (EXCEPT PoE)","M-HEXPOE":"  Mikrotik hEX PoE","M-RB4011IGS":"  Mikrotik RB4011iGS+RM","S-TZ-SMALL":"  SonicWall TZ Series (Smaller Desktop)","S-TZ-LARGE":"  SonicWall TZ570/TX670 (Larger Desktop)","T-ER605":"  TP-Link Omada ER605","T-ER7206":"  TP-Link Omada ER7206 (1U Ultra-Compact)","U-EDGE4":"  Ubiquiti UniFi EdgeRouter 4","U-EDGEXSFP":"  Ubiquiti UniFi EdgeRouter X SFP","U-EXPRESS7":"  Ubiquiti UniFi Express 7 (NOTE: Forces solid cage bottom!)","U-UCG-FIBER":"  Ubiquiti UniFi UCG Fiber (NOTE: Forces solid cage bottom!)","U-UCG-MAX":"  Ubiquiti UniFi UCG Max/Ultra (NOTE: Forces solid cage bottom!)","U-UISP-R":"  Ubiquiti UniFi UISP Router","":"","":"5-Port Switches","D-DES-105":"  D-Link DES-105","D-DGS-105":"  D-Link DGS-105","D-DGS-105GL":"  D-Link DGS-105GL","D-DMS-105":"  D-Link DMS-105","N-GS105":"  Netgear GS105","N-GS105Ev2":"  Netgear GS105E v2","N-GS105PE":"  Netgear GS105PE","N-GS305":"  Netgear GS305","L-SE3005v1":"  Linksys SE3005 v1","L-SE3005v2":"  Linksys SE3005 v2","T-LS105G":"  TP-Link LS105G","T-LS1005G":"  TP-Link LS1005G","T-ES206X-M2":"  TP-Link Omada T-ES206X-M2","T-SG105S":"  TP-Link SG105S/SG105MPE","":"","":"8-Port Switches","C-GS108":"  Cudy GS108","D-DES-108":"  D-Link DES-108","D-DGS-108":"  D-Link DGS-108","D-DGS-108GL":"  D-Link DGS-108GL","D-DMS-108":"  D-Link DMS-108","L-SE3008v1":"  Linksys SE3008 v1","L-SE3008v2":"  Linksys SE3008 v2","N-GS108":"  Netgear GS108","N-GS108Ev3":"  Netgear GS108E v3","N-GS308LP":"  Netgear GS308LP/GS308PP","N-GS308":"  Netgear GS308","T-LS108G":"  TP-Link LS108G","T-LS1008G":"  TP-Link LS1008G","T-ES210X-M2":"  TP-Link Omada ES210X-M2","T-TEG-S381":"  TrendNET TEG-S381","T-TEG-S82g":"  TrendNET TEG-S82g","U-UISP-S":"  UniFi UISP Switch","U-US-8-150W":"  UniFi US-8-150W","Z-GS1100-10HP":"  Zyxel GS1100-10HP","":"","":"12-16-Port Switches","Z-GS1100-16":"  Zyxel GS1100-16","":"","":"SFP Switches","M-CRS305-1G-4S+IN":"  Mikrotik CRS305-1G-4S+IN","T-TEG-S5":"  TrendNET TEG-S5 Series","U-UISP-S":"  Ubiquiti UniFi UISP Switch Plus","":"","":"Small Form Factor PCs","A-MACMINI":"  Apple MAC Mini M4+ (NOTE: Forces solid cage bottom!)","A-MACSTUDIO":"  Apple MAC Studio M3+ (NOTE: Forces solid cage bottom!)","D-USFF":"  Dell OptiPlex USFF Chassis","D-MICRO":"  Dell OptiPlex M (Micro) Chassis (1U Ultra-Compact)","H-GSERIES":"  HP Elite/Pro G3/G6/G9 Mini Chassis (1U Ultra-Compact)","H-Z2G9":"  HP Z2 G9 Mini Chassis","I-NUC-PRO":"  Intel NUC Pro Chassis","I-NUC-SLIM":"  Intel NUC Slim Chassis","I-NUC-TALL":"  Intel NUC Tall/Dual-LAN Chassis","L-TCTINY":"  Lenovo ThinkCentre Tiny (1U Ultra-Compact)","M-MS-01":"  Minisforum MS-01/MS-A2/MS-R1","M-MS-A1":"  Minisforum MS-A1","":"","":"Miscellaneous","BAY-2.5-H":"  2.5-Inch Drive Bay (Horizontal)","BAY-2.5-V":"  2.5-Inch Drive Bay (Vertical)","BAY-2.5H-H":"  2.5-Inch Half-Height Drive Bay (Horizontal)","BAY-2.5H-V":"  2.5-Inch Half-Height Drive Bay (Vertical)","BAY-3.5-H":"  3.5-Inch Drive Bay (Horizontal)","BAY-3.5-V":"  3.5-Inch Drive Bay (Vertical)","BAY-E1.S-9.5-H":"  E1.S-9.5mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.S-9.5-V":"  E1.S-9.5mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E1.S-15-H":"  E1.S-15mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.S-15-V":"  E1.S-15mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E1.S-25-H":"  E1.S-25mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.S-25-V":"  E1.S-25mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E1.L-9.5-H":"  E1.L-9.5mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.L-9.5-V":"  E1.L-9.5mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E1.L-18-H":"  E1.L-18mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.L-18-V":"  E1.L-18mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E3.S-H":"  E3.S (Enterprise SSD) Drive Bay (Horizontal)","BAY-E3.S-V":"  E3.S (Enterprise SSD) Drive Bay (Vertical)","BAY-E3.S-2T-H":"  E3.S-2T (Enterprise SSD) Drive Bay (Horizontal)","BAY-E3.S-2T-V":"  E3.S-2T (Enterprise SSD) Drive Bay (Vertical)","BAY-E3.L-H":"  E3.L (Enterprise SSD) Drive Bay (Horizontal)","BAY-E3.L-V":"  E3.L (Enterprise SSD) Drive Bay (Vertical)","BAY-E3.L-2T-H":"  E3.L-2T (Enterprise SSD) Drive Bay (Horizontal)","BAY-E3.L-2T-V":"  E3.L-2T (Enterprise SSD) Drive Bay (Vertical)"]


/* [Target Device Dimensions && Count] */

// Depth/length (front-to-back) of device in mm. - NOTE: Selecting a device preset overrides this setting.
manual_device_depth = 120.0; // [15:1:500]

// Width (left-to-right) of device in mm. - NOTE: Swap this setting and device_height below to mount the device vertically. - NOTE: Selecting a device preset overrides this setting.
manual_device_width = 150.0; // [15:1:450]

// Height (top-to-bottom) of device in mm. - NOTE: Swap this setting and device_width above to mount the device vertically. - NOTE: Selecting a device preset overrides this setting.
manual_device_height = 45.0; // [15:1:500]

// Number of devices to cage - by default, one cage holds one device, but this setting multiplies this. Excellent for side-by-side mounting of smaller devices, e.g., Raspberry Pis, especially when mounted vertically by swapping the device height and width parameters. - NOTE: CageMaker will insert a wall the width of the "surface thickness" setting plus the "multiple device gap" setting between each device. - WARNING: CageMaker will enforce safe boundaries so as to not push a cage into mounting space or off the edge of the faceplate.
number_of_devices = 1; // [1:1:16]

// Additional gap space between devices - by default, multiple devices are separated by a wall whose thickness is set by the "surface thickness" setting, and this setting adds to that distance. - WARNING: This can dramatically increase cage complexity, which in turn substantially increases both print time and filament consumption.
multiple_device_gap = 0.0; // [0:1:50]


/* [Overall Structure && Geometry] */

// Support Structure Base Size (Geometry) - determines how the cage proper is generated and significantly affects overall strength/rigidity. Lower values require less space and allow using larger devices without expanding to the next unit of height, but trades strength and weight capacity for compactness. - NOTE: Actual width of the support structure is expanded further based on the "surface thickness" setting below, which increases the thickness of all surfaces. Values given are based on the default 4mm "surface thickness" setting. - NOTE: Selecting a device preset overrides this setting.
manual_support_cage_base_size = 4; // [0:"Plain Box (weakest) - Adds 8mm by default to device dimensions",2:"Box With Ribbed Corners - Adds 10mm by default to device dimensions",4:"Plus-Shaped - DEFAULT - Adds 12mm by default to device dimensions",6:"Expanded Plus-Shaped - Adds 14mm by default to device dimensions",8:"Widened Plus-Shaped (strongest) - Adds 16mm by default to device dimensions"]

// Surface thickness - thicken all surfaces to support additional weight. - NOTE: Selecting a device preset overrides this setting.
manual_surface_thickness = 0; // [-0.875:"3.125mm (1/8-in.) For Small Lightweight Devices",0:"Standard 4mm Thickness - DEFAULT",1:"Thickened 5mm Thickness",2:"Super-Thick 6mm Thickness",4:"Ultra-thick 8mm Thickness"]


/* [Rulers/Guides] */

// Show or hide a ruler with coordinates for positioning cage/modifications, as well as markers for the centers of the cage and modifications. - NOTE: This ruler is not generated during a full render but only appears in previews. - ALSO NOTE: The ruler is automatically disabled when splitting a cage into two halves, although the build outline is not.
show_ruler = true;

// Show or hide a build volume outline (in mm) along with the ruler above. If a cage doesn't fit within a given volume, enabling the split-cage option may make it work. For best results, set to the same or closest-but-smaller volume as the printer being used to print the finished cage. Set to zero to disable this. - NOTE: Requires ruler be enabled. - ALSO NOTE: This outline is shown as a cube with equal length sides, which may not represent the printer's build volume exactly, so make sure the print height is within the printer's build height.
show_build_outline = 260; // [0:"DISABLE Build Volume Outline",120,150,180:"180 - Bambu Labs A1 Mini, etc.",210,220:"220 - Prusa Core One, Creality Ender 3 V3, etc.",240:"240 - UltiMaker S5, etc.",250:"250 - Anycubic Kobra S1, etc.",256:"256 - Bambu Lab A1/P1S/P2S, Elegoo Centauri Carbon, etc.",260:"260 - Anycubic Kobra X, Creality SPARKX i7, etc.",270:"270 - Qidi Q2, etc.",280,300:"300 - Creality K2 Pro, etc.",305:"305 - QIDI Plus4, etc.",310,320:"320 - Bambu Lab H2D/H2S, etc.",330,340,350:"350 - Anycubic Kobra S1 Max, etc.",360:"360 - Prusa XL, etc.",400:"400 - Anycubic Kobra Max, Snapmaker Artisan, etc.",420:"420 - Anycubic Kobra 2/3 Max, Elegoo Neptune 4 Max, etc.",450:"450 - Creality CR-M4, etc.",500]


/* [3D Printer Support] */

// Split completed cage into two halves to fit on smaller printers - this causes the script to create the cage twice, adding attachment points and seams for screwing or gluing both halves together. Useful for printing cages on small-volume printers. - NOTE: Enabling the "extra support" and "add alignment pin holes" options are probably a good idea when using this option. - WARNING: This setting overrides printing the cage separately.
split_cage_into_two_halves = false;

// Print the cage proper separately instead of as part of the backplate, for faster printing with lower filament usage on larger printers. The cage press-fits into the back of the faceplate and is secured with pins, screws, and/or glue. This makes for a somewhat weaker cage overall but prints faster and consumes significantly less filament to print. - NOTE: Enabling the "extra support" option is probably a good idea when using this option. - WARNING: Splitting the cage overrides this setting.
print_cage_separately = false;


/* [Rack Settings] */

// Rack geometry - this sets basic rack dimensions, namely "unit" height and mounting-hole spacing. - NOTE: The default setting is EIA-310-D, which is the established standard for 19" racks and de facto standard for most mini- and micro-rack systems.
rack_geometry = "EIA-310"; // ["EIA-310":"EIA-310-D Standard Layout - DEFAULT","EIA-310-LH":"EIA-310-D Standard Layout With Large Screw Holes (M6 or 1/4-20) ","EIA-310-1T":"EIA-310 Modified - Single Centered Hole At Top Per Unit","EIA-310-1C":"EIA-310 Modified - Single Centered Hole At Center Per Unit","EIA-310-2":"EIA-310 Modified - Two Holes Per Unit","EIA-310-2020":"EIA-310 Modified - 2020 Extrusion Frame (Reduced Internal Width)","HALF-EIA-310":"EIA-310-D Standard Layout Scaled Down 50%","12mm":"12mm Unit Height, Hole At 6mm","15mm":"15mm Unit Height, Hole At 7.5mm - Homeracker","16mm":"16mm Unit Height, Hole At 8mm","16.5mm":"16.5mm Unit Height, Hole At 8.25mm - MR248 248mm Mini-Rack","20mm":"20mm Unit Height, Hole At 10mm","20mm_2h":"20mm Unit Height, Holes At 5mm/15mm","24mm":"24mm Unit Height, Hole At 12mm","25mm":"25mm Unit Height, Hole At 12.5mm","25mm_2h":"25mm Unit Height, Holes At 6.25mm/18.75mm","30mm":"30mm Unit Height, Hole At 15mm","30mm_2h":"30mm Unit Height, Holes At 7.5mm/22.5mm","36mm":"36mm Unit Height, Hole At 18mm","40mm":"40mm Unit Height, Hole At 20mm","40mm_2h":"40mm Unit Height, Holes At 10mm/30mm","50mm":"50mm Unit Height, Hole At 25mm","50mm_2h":"50mm Unit Height, Holes At 12.5mm/37.5mm","EIA-310":" ","Custom":"Custom-Defined Rack Geometry"]

// Custom rack geometry settings - Set the unit height, mounting hole diameter, and vertical hole spacing pattern for one unit. Note that the hole pattern must be in the form of [value_1, value_2, etc.] in mm from the top of each unit - NOTE: Requires that "rack geometry" be set to "custom."
custom_rack_geometry_unit_height = 44.45;

custom_rack_geometry_mounting_reservation_area = 15.875;

custom_mounting_hole_center_difference = 17.4625;

custom_rack_geometry_mounting_hole_diameter = 5.25;

custom_rack_geometry_mounting_hole_pattern = [6.35, 22.225, 38.1, 0.00, 0.00];

// Rack cage width (NOTE: INCHES) - NOTE: CageMaker will automatically enable right-angle mounting ears on one or both sides of partial-width cages depending on where they may be required. - IMPORTANT: Options that affect the number of mounting holes will also affect the holes in these ears.
rack_cage_width = 10; // [4.75:"4.75 in. Wide - OUTER Quarter-Width for 19 in. Full-Size Rack",4.75001:"4.75 in. Wide - INNER Quarter-Width for 19 in. Full-Size Rack",5:"5 in. Micro-Rack",5.001:"5 in. Half-Width for 10 in. Mini-Rack",6:"6 in. Micro-Rack",6.33:"6.33 in. OUTER Wide - Third-Width for 19 in. Full-Size Rack",6.33001:"6.33 in. CENTER Wide - Third-Width for 19 in. Full-Size Rack",7:"7 in. Micro-Rack",9.5:"9.5 in. Wide - Half-Width for 19 in. Full-Size Rack",9.76378:"MR248 248mm Mini-Rack",10:"10 in. Mini-Rack",12:"12 in. Custom Rack",12.66:"12.66 in. Wide - Two-Thirds-Width for 19 in. Full-Size Rack",14:"14 in. Custom Rack",16:"16 in. Custom Rack",19:"19 in. Full Rack"]
    // Yes, those strange x.xx001s are there for a reason...

// Tapping or heat-set insert holes - sets hole diameters on split cages or bolt-together faceplate ears for tapping, or expands hole diameters to allow the use of heat-set threaded inserts instead of raw bolts. - NOTE: This setting should match the recommended hole diameter of the bolt or insert to be used, or use the next smaller diameter. - ALSO NOTE: This setting is only used for bolt-together cages (split in half or with bolt-together ears).
tap_or_heat_set_holes = 5.25; // [5.25:"M5 Clearance (5.25mm hole) - DEFAULT",0.00:" ",0.00:"Clearance Holes",3.15:"  M3 Clearance (3.15mm hole)", 4.20:"  M4 Clearance (4.2mm hole)", 5.25:"  M5 Clearance (5.25mm hole) - DEFAULT", 6.30:"  M6 Clearance (6.3mm hole)", 2.95:"  4-40 Clearance (.1160 in. hole)", 3.66:"  6-32 Clearance (.144 in. hole)",4.31:"  8-32 Clearance (.1695 in. hole)", 4.98:"  10-24/10-32 Clearance (.1960 in. hole)", 6.53:"  1/4-20 Clearance (.257 in. hole)", 0.00:" ",0.00:"Tapped/Threadcutting Holes",2.50:"  M3 Tapped/Threadcutting (2.5mm hole)", 3.50:"  M4 Tapped/Threadcutting (3.5mm hole)", 4.40:"  M5 Tapped/Threadcutting (4.4mm hole)", 5.00:"  M6 Tapped/Threadcutting (5.0mm hole)", 2.07:"  4-40 Tapped/Threadcutting (0.0813 in. hole)", 2.53:"  6-32 Tapped/Threadcutting (.0997 in. hole)", 3.19:"  8-32 Tapped/Threadcutting (.1257 in. hole)", 3.53:"  10-24/10-32 Tapped/Threadcutting (.1389 in. hole)", 4.79:"  1/4-20 Tapped/Threadcutting (.1887 in. hole)",0.00:" ",0.00:"Heat-Set Inserts",3.98:"  M3 Heat-Set (4mm hole)", 4.10:"  M3 Heat-Set (4.1mm hole)", 4.80:"  M3 Heat-Set (4.8mm hole)", 5.60:"  M4 Heat-Set (5.6mm hole)", 5.70:"  M4 Heat-Set (5.7mm hole)", 6.40:"  M5 Heat-Set (6.4mm hole)", 6.50:"  M5 Heat-Set (6.5mm hole)", 8.00:"  M6 Heat-Set (8mm hole)", 8.10:"  M6 Heat-Set (8.1mm hole)", 3.99:"  4-40 Heat-Set (0.157 in. hole)", 4.03:"  4-40 Heat-Set (0.159 in. hole)", 4.76:"  6-32 Heat-Set (0.1875 in. hole)",  4.85:"  6-32 Heat-Set (0.191 in. hole)", 5.61:"  8-32 Heat-Set (0.221 in. hole)", 5.74:"  8-32 Heat-Set (0.226 in. hole)", 6.41:"  10-24/10-32 Heat-Set (0.252 in. hole)", 6.51:"  10-24/10-32 Heat-Set (0.256 in. hole)", 8.01:"  1/4-20 Heat-Set (0.315 in. hole)", 8.11:"  1/4-20 Heat-Set (0.319 in. hole)"]

// Add alignment pin holes to edges for split, half-width, and third-width cages - this adds 5mm deep 1.75mm diameter holes to mating surfaces for multi-part cages, with the idea that short lengths of filament can be used as alignment dowels. - NOTE: holes will probably need to be chased with a suitable drill bit (e.g., #51/1.702mm or #50/1.78mm). This adds complexity to the object but makes for a cleaner alignment of multiple parts. Recommended for gluing parts together in particular.
add_alignment_pin_holes = false;

// Top and bottom holes only - by default, CageMaker populates all hole spaces on a faceplate regardless of height. Enabling this setting causes CageMaker to only populate the top-most and bottom-most holes on the faceplate. - NOTE: This aligns to the edges of FULL unit heights, so if the "allow half heights" option is enabled, the bottom-most holes will be at the top holes of the bottom-most half-unit. - WARNING: Vertically shifting holes for alignment of half-unit racks overrides this option.
top_and_bottom_holes_only = false;

// Use a simple hole instead of a 5mm wide slot for mounting. NOTE: This may cause interference issues for racks whose mounting centers aren't dimensionally accurate.
hole_instead_of_slot = false;

// Allow half-unit heights - by default, height scales in even unit increments, but this setting enables half-heights, which might be useful for small devices in compact miniracks. - NOTE: This makes the resulting cage vertically asymmetric!
allow_half_heights = false;

// Vertically shift mounting holes - by default, mounting holes are centered relative to each unit. This setting shifts the center point up by half a unit, essentially flipping a half-unit-height-multiple cage. Useful for situations such as half-unit-multiple cages that have alignment concerns or to compensate for upside-down Keystone receptacles. - WARNING: This setting overrides the "top and bottom holes only" option.
vertically_shift_mounting_holes = false;


/* [Faceplate Options] */

// Faceplate only, with no cage - force height to a given count of units and completely disable the generation of a cage, leaving other options such as faceplate modifications intact. - WARNING: This setting overrides ALL cage generation options, AND requires a large enough print volume to print the faceplate at the full selected size as splitting the faceplate is not supported.
faceplate_only = 0.0; // [0.0:"No, generate cage normally (DEFAULT)",0.50:"0.5U",1.00:"1.0U",1.50:"1.5U",2.00:"2.0U",2.50:"2.5U",3.00:"3.0U",3.50:"3.5U",4.00:"4.0U",4.50:"4.5U",5.00:"5.0U"]

// Reinforce faceplate by adding right-angle bracing to the back of the faceplate along its top and bottom edges. - WARNING: Although this is designed to clear reasonably EIA-compliant rack rails, enabling this setting may cause interference issues that require modification.
reinforce_faceplate = false;

// Radius of rounded corners of cage opening in faceplate (in mm) - by default, the cutout of the faceplate for the device to insert into the cage has squared corners for a rectangular device front. This setting rounds the corners. - NOTE: Use a radius gauge on the device in question in order to accurately configure this setting - a badly chosen value could make the device not fit into the cage. - NOTE: Either enabling the "extra support" option or making the bottom solid is probably a good idea when using a non-zero setting here.
faceplate_rounded_corners = 0.0; // [0.0:0.5:50]

// Add a 1mm retention lip around the front opening and recess the device 1mm farther into the cage. This will help capture the device and reduce accidental removal. - NOTE: the device_clearance setting also applies to this retention lip, and too large of a clearance setting may make this ineffective.
add_retention_lip = false;

// Closed faceplate, aka enclosure mode - this option generates a cage without an opening in the faceplate for a device. Useful for creating custom rackmount enclosures. - WARNING: this option disables sanity checks for the positioning of faceplate modifications relative to cage edges - care must be taken to prevent placing a modification in such a way that it overlaps the cage proper. - NOTE: It may be advisable to print the cage separately, especially if it will have closed sides.
closed_faceplate = false;

// Reduce a cageless faceplate to 2D for export to a supported flat-file format for cutting or engraving. - NOTE: This option is only available when "faceplate_only" is set to a fixed unit height so that CageMaker PRCG generates a faceplate without a cage.
reduce_faceplate_to_2d = false;

// Narrow-edge centered mounting holes, for subrack support - adds a CENTERED hole 10mm deep on either side of the cage proper along its narrower sides (usually left/right), aligned with the edge of the cage opening and surrounded with an ear that protrudes into the opening. - NOTE: This setting should match the recommended hole diameter of the bolt or insert to be used, or use the next smaller diameter.
narrow_edge_centered_holes = 0.00; // [0.00:"None/Disabled - DEFAULT",0.00:" ",0.00:"Clearance Holes",3.15:"  M3 Clearance (3.15mm hole)", 4.20:"  M4 Clearance (4.2mm hole)", 5.25:"  M5 Clearance (5.25mm hole)", 6.30:"  M6 Clearance (6.3mm hole)", 2.95:"  4-40 Clearance (.1160 in. hole)", 3.66:"  6-32 Clearance (.144 in. hole)",4.31:"  8-32 Clearance (.1695 in. hole)", 4.98:"  10-24/10-32 Clearance (.1960 in. hole)", 6.53:"  1/4-20 Clearance (.257 in. hole)", 0.00:" ",0.00:"Tapped/Threadcutting Holes",2.50:"  M3 Tapped/Threadcutting (2.5mm hole)", 3.50:"  M4 Tapped/Threadcutting (3.5mm hole)", 4.40:"  M5 Tapped/Threadcutting (4.4mm hole)", 5.00:"  M6 Tapped/Threadcutting (5.0mm hole)", 2.07:"  4-40 Tapped/Threadcutting (0.0813 in. hole)", 2.53:"  6-32 Tapped/Threadcutting (.0997 in. hole)", 3.19:"  8-32 Tapped/Threadcutting (.1257 in. hole)", 3.53:"  10-24/10-32 Tapped/Threadcutting (.1389 in. hole)", 4.79:"  1/4-20 Tapped/Threadcutting (.1887 in. hole)",0.00:" ",0.00:"Heat-Set Inserts",3.98:"  M3 Heat-Set (4mm hole)", 4.10:"  M3 Heat-Set (4.1mm hole)", 4.80:"  M3 Heat-Set (4.8mm hole)", 5.60:"  M4 Heat-Set (5.6mm hole)", 5.70:"  M4 Heat-Set (5.7mm hole)", 6.40:"  M5 Heat-Set (6.4mm hole)", 6.50:"  M5 Heat-Set (6.5mm hole)", 8.00:"  M6 Heat-Set (8mm hole)", 8.10:"  M6 Heat-Set (8.1mm hole)", 3.99:"  4-40 Heat-Set (0.157 in. hole)", 4.03:"  4-40 Heat-Set (0.159 in. hole)", 4.76:"  6-32 Heat-Set (0.1875 in. hole)",  4.85:"  6-32 Heat-Set (0.191 in. hole)", 5.61:"  8-32 Heat-Set (0.221 in. hole)", 5.74:"  8-32 Heat-Set (0.226 in. hole)", 6.41:"  10-24/10-32 Heat-Set (0.252 in. hole)", 6.51:"  10-24/10-32 Heat-Set (0.256 in. hole)", 8.01:"  1/4-20 Heat-Set (0.315 in. hole)", 8.11:"  1/4-20 Heat-Set (0.319 in. hole)"]

// Corner mounting holes, for subrack support - adds a hole 10mm deep into each corner of the cage proper, aligned with the edge of the cage opening and surrounded with an ear that protrudes into the opening. - NOTE: This setting should match the recommended hole diameter of the bolt or insert to be used, or use the next smaller diameter.
edge_corner_holes = 0.00; // [0.00:"None/Disabled - DEFAULT",0.00:" ",0.00:"Clearance Holes",3.15:"  M3 Clearance (3.15mm hole)", 4.20:"  M4 Clearance (4.2mm hole)", 5.25:"  M5 Clearance (5.25mm hole)", 6.30:"  M6 Clearance (6.3mm hole)", 2.95:"  4-40 Clearance (.1160 in. hole)", 3.66:"  6-32 Clearance (.144 in. hole)",4.31:"  8-32 Clearance (.1695 in. hole)", 4.98:"  10-24/10-32 Clearance (.1960 in. hole)", 6.53:"  1/4-20 Clearance (.257 in. hole)", 0.00:" ",0.00:"Tapped/Threadcutting Holes",2.50:"  M3 Tapped/Threadcutting (2.5mm hole)", 3.50:"  M4 Tapped/Threadcutting (3.5mm hole)", 4.40:"  M5 Tapped/Threadcutting (4.4mm hole)", 5.00:"  M6 Tapped/Threadcutting (5.0mm hole)", 2.07:"  4-40 Tapped/Threadcutting (0.0813 in. hole)", 2.53:"  6-32 Tapped/Threadcutting (.0997 in. hole)", 3.19:"  8-32 Tapped/Threadcutting (.1257 in. hole)", 3.53:"  10-24/10-32 Tapped/Threadcutting (.1389 in. hole)", 4.79:"  1/4-20 Tapped/Threadcutting (.1887 in. hole)",0.00:" ",0.00:"Heat-Set Inserts",3.98:"  M3 Heat-Set (4mm hole)", 4.10:"  M3 Heat-Set (4.1mm hole)", 4.80:"  M3 Heat-Set (4.8mm hole)", 5.60:"  M4 Heat-Set (5.6mm hole)", 5.70:"  M4 Heat-Set (5.7mm hole)", 6.40:"  M5 Heat-Set (6.4mm hole)", 6.50:"  M5 Heat-Set (6.5mm hole)", 8.00:"  M6 Heat-Set (8mm hole)", 8.10:"  M6 Heat-Set (8.1mm hole)", 3.99:"  4-40 Heat-Set (0.157 in. hole)", 4.03:"  4-40 Heat-Set (0.159 in. hole)", 4.76:"  6-32 Heat-Set (0.1875 in. hole)",  4.85:"  6-32 Heat-Set (0.191 in. hole)", 5.61:"  8-32 Heat-Set (0.221 in. hole)", 5.74:"  8-32 Heat-Set (0.226 in. hole)", 6.41:"  10-24/10-32 Heat-Set (0.252 in. hole)", 6.51:"  10-24/10-32 Heat-Set (0.256 in. hole)", 8.01:"  1/4-20 Heat-Set (0.315 in. hole)", 8.11:"  1/4-20 Heat-Set (0.319 in. hole)"]

// Expand Faceplate Upward - make the faceplate taller without changing any other dimensions, adding holes, etc., so as to cover openings or structures above the cage. Useful for rack systems that add reinforcing bars, such as Homeracker. - NOTE: This option is disabled for partial-width cages.
expand_faceplate_upward = 0; // [0:1:50]

// Expand Faceplate Downward - make the faceplate taller without changing any other dimensions, adding holes, etc., so as to cover openings or structures above the cage. Useful for rack systems that add reinforcing bars, such as Homeracker. - NOTE: Set this to 15 to emulate Homecracker's 'flush to bottom' option. - NOTE: This option is disabled for partial-width cages.
expand_faceplate_downward = 0; // [0:1:50]


/* [Faceplate Ventilation Options] */

// Faceplate ventillation hole/grid pattern - creates ventillation holes in a given pattern on the faceplate. - WARNING: Enabling this option will weaken the cage, may require signifiantly longer time to generate the cage, and can dramatically increase print time. NOTE: The cage proper and any active modifications will selectively remove the ventillation holes as required.
faceplate_vent_hole_pattern = "None"; // ["None":"None - DEFAULT","Hex":"Hexagonal Grid","Round":"Round Holes","Staggered":"Square Holes In Staggered Pattern","Grid":"Square Holes in a Grid Pattern","Isometric":"Isometric/Diamond Grid","Triangle":"Triangle/Isometric Grid","Octagon":"Octagonal Holes"]

// Faceplate ventillation hole/grid coverage limitations - restrict the ventillation hole grid to top/bottom or sides of the cage, which can improve structural integrity at the cost of reducing the total area of open space for ventilation. - NOTE: These are relative to the cage proper and its support structure, and are disabled when the "faceplate only" option is enabled.
faceplate_vent_position = "All"; // ["All":"Full Faceplate - DEFAULT","TB":"Top/Bottom Only","S":"Sides Only"]

// Faceplate vent hole size (outer diameter for hexagonal holes), in mm - NOTE: increasing this value creates better ventilation but reduces strength.
faceplate_vent_hole_size = 9.0; // [1.0:0.25:25.0]

// Faceplate vent-hole wall thickness, in mm - NOTE: Decreasing this value creates better ventilation but reduces strength. - WARNING: Changing this value will recalculate the entire grid and may require changing offsets below.
faceplate_vent_wall_thickness = 2.0; // [1.0:0.25:15.0]

// Faceplate grid horizontal offset - moves grid left (negative values) or right (positive values) for fine-tuning alignment of holes, hole edges, etc.
faceplate_vent_grid_horizontal_offset = 0.0; // [-25:0.25:25]

// Faceplate grid vertical offset - moves grid up (negative values) or down (positive values) for fine-tuning alignment of holes, hole edges, etc.
faceplate_vent_grid_vertical_offset = 0.0; // [-25:0.25:25]

// Faceplate grid angle - rotates the grid relative to its center.
faceplate_vent_grid_angle = 0.0; // [-180:5:180]


/* [Cage Options] */

// Horizontal offset distance (in mm) - shift the entire cage to "left" (negative values) or "right" (positive values) from horizontal center. - WARNING: CageMaker will enforce safe boundaries so as to not push a cage into mounting space or off the edge of the faceplate.
cage_horizontal_offset = 0.00; // [-240.00:1:240.0]

// Vertical offset distance (in mm) - shift the entire cage "up" (negative values) or "down" (positive values) from vertical center. - WARNING: CageMaker will enforce safe boundaries so as to not push a cage off the edge of the faceplate.
cage_vertical_offset = 0.00; // [-150.00:1:150.0]

// Additional top/bottom support - divides upper/lower space and adds center reinforcing to help reduce cantilevering, especially on deep devices.
extra_support = false; 


/* [Cage TOP and BOTTOM Geometry && Ventilation Options] */

// Cage TOP geometry - make the top of the cage, solid, open, or ventilated. - WARNING: Grid options may require signifiantly longer time to generate the cage, and can dramatically increase print time. - WARNING: Selecting "no top at all" removes the entire top along with its support structure, which can reduce the strength of the cage.
cage_top_geometry = "Open"; // ["Open":"Open Top - DEFAULT","Lidded":"Lidded, Open Top With Tabs & Screw Holes","Solid":"Solid Top (No Ventilation Cutout)","Structure":"Structure Only, Completely Open","None":"No Top At All - CAUTION","":"","":"Ventilation Grids","Hex":"  Hexagonal Grid","Round":"  Round Holes","Staggered":"  Tiled Holes In Offset Pattern","Grid":"  Square Holes in a Grid Pattern","Isometric":"  Isometric/Diamond Grid","Triangle":"  Triangle/Isometric Grid","Octagon":"  Octagonal Holes"]

// Cage TOP lid-tab screw hole sizes - select the screw hole size when adding a lid to the top of the cage. - NOTE: Requires that the cage top geometry be set to the lidded option. - NOTE: This setting should match the recommended hole diameter of the bolt or insert to be used, or use the next smaller diameter.
cage_top_lid_screw_holes = 2.50; // [0.00:"Clearance Holes",3.15:"  M3 Clearance (3.15mm hole)", 4.20:"  M4 Clearance (4.2mm hole)", 5.25:"  M5 Clearance (5.25mm hole)", 6.30:"  M6 Clearance (6.3mm hole)", 2.95:"  4-40 Clearance (.1160 in. hole)", 3.66:"  6-32 Clearance (.144 in. hole)",4.31:"  8-32 Clearance (.1695 in. hole)", 4.98:"  10-24/10-32 Clearance (.1960 in. hole)", 6.53:"  1/4-20 Clearance (.257 in. hole)", 0.00:" ",0.00:"Tapped/Threadcutting Holes",2.50:"  M3 Tapped/Threadcutting (2.5mm hole) - DEFAULT", 3.50:"  M4 Tapped/Threadcutting (3.5mm hole)", 4.40:"  M5 Tapped/Threadcutting (4.4mm hole)", 5.00:"  M6 Tapped/Threadcutting (5.0mm hole)", 2.07:"  4-40 Tapped/Threadcutting (0.0813 in. hole)", 2.53:"  6-32 Tapped/Threadcutting (.0997 in. hole)", 3.19:"  8-32 Tapped/Threadcutting (.1257 in. hole)", 3.53:"  10-24/10-32 Tapped/Threadcutting (.1389 in. hole)", 4.79:"  1/4-20 Tapped/Threadcutting (.1887 in. hole)",0.00:" ",0.00:"Heat-Set Inserts",3.98:"  M3 Heat-Set (4mm hole)", 4.10:"  M3 Heat-Set (4.1mm hole)", 4.80:"  M3 Heat-Set (4.8mm hole)", 5.60:"  M4 Heat-Set (5.6mm hole)", 5.70:"  M4 Heat-Set (5.7mm hole)", 6.40:"  M5 Heat-Set (6.4mm hole)", 6.50:"  M5 Heat-Set (6.5mm hole)", 8.00:"  M6 Heat-Set (8mm hole)", 8.10:"  M6 Heat-Set (8.1mm hole)", 3.99:"  4-40 Heat-Set (0.157 in. hole)", 4.03:"  4-40 Heat-Set (0.159 in. hole)", 4.76:"  6-32 Heat-Set (0.1875 in. hole)",  4.85:"  6-32 Heat-Set (0.191 in. hole)", 5.61:"  8-32 Heat-Set (0.221 in. hole)", 5.74:"  8-32 Heat-Set (0.226 in. hole)", 6.41:"  10-24/10-32 Heat-Set (0.252 in. hole)", 6.51:"  10-24/10-32 Heat-Set (0.256 in. hole)", 8.01:"  1/4-20 Heat-Set (0.315 in. hole)", 8.11:"  1/4-20 Heat-Set (0.319 in. hole)"]

// Cage BOTTOM geometry - make the bottom of the cage, solid, open, or ventilated. - WARNING: Grid options may require signifiantly longer time to generate the cage, and can dramatically increase print time. - WARNING: Selecting "no bottom at all" removes the entire bottom along with its support structure, which can reduce the strength of the cage.
cage_bottom_geometry = "Open"; // ["Open":"Open Bottom - DEFAULT","Solid":"Solid Bottom (No Ventilation Cutout)","Structure":"Structure Only, Completely Open","None":"No Bottom At All - CAUTION","":"","":"Ventilation Grids","Hex":"  Hexagonal Grid","Round":"  Round Holes","Staggered":"  Tiled Holes In Offset Pattern","Grid":"  Square Holes in a Grid Pattern","Isometric":"  Isometric/Diamond Grid","Triangle":"  Triangle/Isometric Grid","Octagon":"  Octagonal Holes"]

//// Cage BOTTOM mounting studs - up to twelve stud locations can be defined by providing their coordinates in mm. Studs are automatically set up as tapered cones for better strength, with walls that are 2.5x the screw diameter. - NOTE: Format must be [x_1,y_1,x_2,y_2, etc.] and the zero point is at the front-left corner of the bottom of the cage. - NOTE: Requires that the cage bottom geometry be set to "solid."
//cage_bottom_studs = [];
//
//// Cage BOTTOM mounting stud height - Sets the height above the surface of the cage bottom. - NOTE: Requires that the cage bottom geometry be set to "solid."
//cage_bottom_stud_height = 5; // [2:0.5:15]
//
//// Cage BOTTOM mounting stud screw hole diameter - Sets the home size for the studs, and by extension, the outer diameter of the studs. - NOTE: Requires that the cage bottom geometry be set to "solid."
//cage_bottom_stud_screw_holes = 2.50; // [2.50:"Clearance Holes",3.15:"  M3 Clearance (3.15mm hole)", 4.20:"  M4 Clearance (4.2mm hole)", 5.25:"  M5 Clearance (5.25mm hole)", 6.30:"  M6 Clearance (6.3mm hole)", 2.95:"  4-40 Clearance (.1160 in. hole)", 3.66:"  6-32 Clearance (.144 in. hole)",4.31:"  8-32 Clearance (.1695 in. hole)", 4.98:"  10-24/10-32 Clearance (.1960 in. hole)", 6.53:"  1/4-20 Clearance (.257 in. hole)", 0.00:" ",0.00:"Tapped/Threadcutting Holes",2.50:"  M3 Tapped/Threadcutting (2.5mm hole) - DEFAULT", 3.50:"  M4 Tapped/Threadcutting (3.5mm hole)", 4.40:"  M5 Tapped/Threadcutting (4.4mm hole)", 5.00:"  M6 Tapped/Threadcutting (5.0mm hole)", 2.07:"  4-40 Tapped/Threadcutting (0.0813 in. hole)", 2.53:"  6-32 Tapped/Threadcutting (.0997 in. hole)", 3.19:"  8-32 Tapped/Threadcutting (.1257 in. hole)", 3.53:"  10-24/10-32 Tapped/Threadcutting (.1389 in. hole)", 4.79:"  1/4-20 Tapped/Threadcutting (.1887 in. hole)",0.00:" ",0.00:"Heat-Set Inserts",3.98:"  M3 Heat-Set (4mm hole)", 4.10:"  M3 Heat-Set (4.1mm hole)", 4.80:"  M3 Heat-Set (4.8mm hole)", 5.60:"  M4 Heat-Set (5.6mm hole)", 5.70:"  M4 Heat-Set (5.7mm hole)", 6.40:"  M5 Heat-Set (6.4mm hole)", 6.50:"  M5 Heat-Set (6.5mm hole)", 8.00:"  M6 Heat-Set (8mm hole)", 8.10:"  M6 Heat-Set (8.1mm hole)", 3.99:"  4-40 Heat-Set (0.157 in. hole)", 4.03:"  4-40 Heat-Set (0.159 in. hole)", 4.76:"  6-32 Heat-Set (0.1875 in. hole)",  4.85:"  6-32 Heat-Set (0.191 in. hole)", 5.61:"  8-32 Heat-Set (0.221 in. hole)", 5.74:"  8-32 Heat-Set (0.226 in. hole)", 6.41:"  10-24/10-32 Heat-Set (0.252 in. hole)", 6.51:"  10-24/10-32 Heat-Set (0.256 in. hole)", 8.01:"  1/4-20 Heat-Set (0.315 in. hole)", 8.11:"  1/4-20 Heat-Set (0.319 in. hole)"]

// Cage TOP & BOTTOM vent hole size (outer diameter for hexagonal holes), in mm - NOTE: increasing this value creates better ventilation but reduces strength.
cage_top_bottom_vent_hole_size = 9.0; // [1.0:0.25:25.0]

// Cage TOP & BOTTOM vent-hole wall thickness, in mm - NOTE: Decreasing this value creates better ventilation but reduces strength. - WARNING: Changing this value will recalculate the entire grid and may require changing offsets below.
cage_top_bottom_vent_wall_thickness = 2.0; // [1.0:0.25:15.0]

// Cage TOP & BOTTOM grid horizontal offset - moves grid left (negative values) or right (positive values) for fine-tuning alignment of holes, hole edges, etc.
cage_top_bottom_vent_grid_horizontal_offset = 0.0; // [-25:0.25:25]

// Cage TOP & BOTTOM grid vertical offset - moves grid up (negative values) or down (positive values) for fine-tuning alignment of holes, hole edges, etc.
cage_top_bottom_vent_grid_vertical_offset = 0.0; // [-25:0.25:25]

// Cage TOP & BOTTOM grid angle - rotates the grid relative to its center.
cage_top_bottom_vent_grid_angle = 0.0; // [-180:5:180]


/* [Cage LEFT and RIGHT SIDE Geometry && Ventilation Options] */

// Cage LEFT SIDE geometry - make the left side of the cage, solid, open, or ventilated. - WARNING: Grid options may require signifiantly longer time to generate the cage, and can dramatically increase print time. - WARNING: Selecting "no side at all" removes the entire side along with its support structure, which can reduce the strength of the cage.
cage_left_geometry = "Open"; // ["Open":"Open Left Side - DEFAULT","Solid":"Solid Left Side (No Ventilation Cutout)","Structure":"Structure Only, Completely Open","None":"No Side At All - CAUTION","":"","":"Ventilation Grids","Hex":"  Hexagonal Grid","Round":"  Round Holes","Staggered":"  Tiled Holes In Offset Pattern","Grid":"  Square Holes in a Grid Pattern","Isometric":"  Isometric/Diamond Grid","Triangle":"  Triangle/Isometric Grid","Octagon":"  Octagonal Holes"]

// Cage RIGHT SIDE geometry - make the right side of the cage, solid, open, or ventilated. - WARNING: Grid options may require signifiantly longer time to generate the cage, and can dramatically increase print time. - WARNING: Selecting "no side at all" removes the entire side along with its support structure, which can reduce the strength of the cage.
cage_right_geometry = "Open"; // ["Open":"Open Right Side - DEFAULT","Solid":"Solid Right Side (No Ventilation Cutout)","Structure":"Structure Only, Completely Open","None":"No Side At All - CAUTION","":"","":"Ventilation Grids","Hex":"  Hexagonal Grid","Round":"  Round Holes","Staggered":"  Tiled Holes In Offset Pattern","Grid":"  Square Holes in a Grid Pattern","Isometric":"  Isometric/Diamond Grid","Triangle":"  Triangle/Isometric Grid","Octagon":"  Octagonal Holes"]

// Cage SIDES vent hole size (outer diameter for hexagonal holes), in mm - NOTE: increasing this value creates better ventilation but reduces strength.
cage_sides_vent_hole_size = 9.0; // [1.0:0.25:25.0]

// Cage SIDES vent-hole wall thickness, in mm - NOTE: Decreasing this value creates better ventilation but reduces strength. - WARNING: Changing this value will recalculate the entire grid and may require changing offsets below.
cage_sides_vent_wall_thickness = 2.0; // [1.0:0.25:15.0]

// Cage SIDES grid horizontal offset - moves grid left (negative values) or right (positive values) for fine-tuning alignment of holes, hole edges, etc.
cage_sides_vent_grid_horizontal_offset = 0.0; // [-25:0.25:25]

// Cage SIDES grid vertical offset - moves grid up (negative values) or down (positive values) for fine-tuning alignment of holes, hole edges, etc.
cage_sides_vent_grid_vertical_offset = 0.0; // [-25:0.25:25]

// Cage SIDES grid angle - rotates the grid relative to its center.
cage_sides_vent_grid_angle = 0.0; // [-180:5:180]


/* [Cage BACK Geometry && Modifications] */

// Cage BACK geometry - make the top of the cage, solid, open, or ventilated. The back of the cage is normally open with a retention lip around the sides, and changing this option makes the back solid instead of open, which can be useful for custom rack enclosures where the back will be modified to accept connectors, or remove it entirely for applications such as alignment with backplanes. - IMPORTANT: This MUST be set to "Solid Back" in order to use back-of-cage modifiations.
cage_back_geometry = "Open"; // ["Open":"Open Back - DEFAULT","Solid":"Solid Back (No Ventilation Cutout) - REQUIRED for back-of-cage modifications","Sides":"Mostly Open Back With 6mm Retention Lips On Both Sides","None":"No Back At All"]

// Back-Of-Cage CENTERED Mod Type - add a new connector, port, or opening of some form onto the faceplate. - IMPORTANT: This option is only available when the back-of-cage geometry is set to solid. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
cage_back_centered_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector (Lock Tab Down)","KeystoneFlipped":"  Keystone Connector (Lock Tab Up)","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

// Back-Of-Cage CENTERED mod grid column count - how many copies of the above modification will be placed into a row on the faceplate? - IMPORTANT: This option is only available when cage generation is disabled by setting "faceplate only" to a height value. Make sure the height setting is tall enough to clear. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
cage_back_centered_mod_grid_columns = 1; // [1:12]

// Back-Of-Cage CENTERED mod grid row count - how many rows of the above modification will be placed onto the faceplate? - IMPORTANT: This option is only available when the back-of-cage geometry is set to solid. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
cage_back_centered_mod_grid_rows = 1; // [1:4]

// Back-Of-Cage LEFT Side Mod Type - add a new connector, port, or opening of some form onto the faceplate. - NOTE: This option is only available when the back-of-cage geometry is set to solid.
cage_back_left_side_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector (Lock Tab Down)","KeystoneFlipped":"  Keystone Connector (Lock Tab Up)","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

// Back-Of-Cage LEFT Side mod grid column count - how many copies of the above modification will be placed into a row on the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
cage_back_left_side_mod_grid_columns = 1; // [1:12]

// Back-Of-Cage LEFT Side mod grid row count - how many rows of the above modification will be placed onto the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
cage_back_left_side_mod_grid_rows = 1; // [1:4]

// Back-Of-Cage LEFT Side Mod Offset Distance (in mm) - shift the modification above to one side from horizontal center. Positive and negative values are allowed. - NOTE: Set this to zero and CageMaker will attempt to automatically position the modification if it'll fit. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
cage_back_left_side_mod_horizontal_offset = 0.00; // [-240.00:1:240.0]

// Back-Of-Cage LEFT Side Mod Vertical Offset Distance (in mm) - shift the modification above to one side from vertical center. Positive and negative values are allowed. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
cage_back_left_side_mod_vertical_offset = 0.00; // [-75.00:1:75.0]

// Back-Of-Cage RIGHT Side Mod Type - add a new connector, port, or opening of some form onto the faceplate. - IMPORTANT: This option is only available when the back-of-cage geometry is set to solid.
cage_back_right_side_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector (Lock Tab Down)","KeystoneFlipped":"  Keystone Connector (Lock Tab Up)","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

// Back-Of-Cage RIGHT Side mod grid column count - how many copies of the above modification will be placed into a row on the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
cage_back_right_side_mod_grid_columns = 1; // [1:12]

// Back-Of-Cage RIGHT Side mod grid row count - how many rows of the above modification will be placed onto the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
cage_back_right_side_mod_grid_rows = 1; // [1:4]

// Back-Of-Cage RIGHT Side Mod Horizontal Offset Distance (in mm) - shift the modification above to one side from horizontal center. Positive and negative values are allowed. - NOTE: Set this to zero and CageMaker will attempt to automatically position the modification if it'll fit. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
cage_back_right_side_mod_horizontal_offset = 0.00; // [-240.00:1:240.0]

// Back-Of-Cage RIGHT Side Mod Vertical Offset Distance (in mm) - shift the modification above to one side from vertical center. Positive and negative values are allowed. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
cage_back_right_side_mod_vertical_offset = 0.00; // [-75.00:1:75.0]


/* [Rear Support Options] */

// Generate a rear support sub-cage that slips into the backside of the front-mounted device cage and mounts to the rack's rear rails, with the idea of providing additional support and increased resistance to cantilevering for larger/heavier devices. - WARNING: Requires a large enough printer to print the complete unit as a single piece, as the rear support cannot be split into parts, and as a result, the "split cage into two halves" and ""print cage separately" settings both disable this setting.
generate_rear_support_cage = false;

// Depth of rack, front-to-back (in mm) - NOTE: Set this to equal the rack's front-to-back depth from the front rack rail's mounting surface to the rear rack rail's mounting surface, outside-to-outside.
rack_total_depth = 254; // [0:1:500]

// Overlap distance for rear support (in mm) - This is the distance the rear support will overlap the back of the cage. Longer overlap creates more support stability but will block side ventilation.
rear_support_overlap = 12; // [0:1:500]

/* [Additional Faceplate Modifications] */

// CENTERED Mod Type - add a new connector, port, or opening of some form onto the faceplate. - IMPORTANT: This option is only available when cage generation is disabled by setting "faceplate only" to a height value. Make sure the height setting is tall enough to clear. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
centered_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector (Lock Tab Down)","KeystoneFlipped":"  Keystone Connector (Lock Tab Up)","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Single-Board Computers (Raspberry Pi And Similar)","SBC85x58_H":"   85x58mm SBCs (Raspberry Pi, etc.) - Horizontal","SBC85x58_VR":"   85x58mm SBCs (Raspberry Pi, etc.) - Vertical (Right Oriented)","SBC85x58_VL":"   85x58mm SBCs (Raspberry Pi, etc.) - Vertical (Left Oriented)","None":" ","None":"PC Motherboard Cutouts","RearIO":"   Rear Panel IO Shield","PCISlot":"   Full-Height PCI Slot","PCISlot_LP":"   Low-Profile PCI Slot","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

// CENTERED mod grid column count - how many copies of the above modification will be placed into a row on the faceplate? - IMPORTANT: This option is only available when cage generation is disabled by setting "faceplate only" to a height value. Make sure the height setting is tall enough to clear. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
centered_mod_grid_columns = 1; // [1:12]

// CENTERED mod grid row count - how many rows of the above modification will be placed onto the faceplate? - IMPORTANT: This option is only available when cage generation is disabled by setting "faceplate only" to a height value. Make sure the height setting is tall enough to clear. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
centered_mod_grid_rows = 1; // [1:4]

// LEFT Side Mod Type - add a new connector, port, or opening of some form onto the faceplate. - NOTE: Be aware of fitment, as the device cage takes priority over any modifications selected here and if there isn't sufficient room for the modification CageMaker will remove it.
left_side_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector (Lock Tab Down)","KeystoneFlipped":"  Keystone Connector (Lock Tab Up)","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Single-Board Computers (Raspberry Pi And Similar)","SBC85x58_H":"   85x58mm SBCs (Raspberry Pi, etc.) - Horizontal","SBC85x58_VR":"   85x58mm SBCs (Raspberry Pi, etc.) - Vertical (Right Oriented)","SBC85x58_VL":"   85x58mm SBCs (Raspberry Pi, etc.) - Vertical (Left Oriented)","None":" ","None":"PC Motherboard Cutouts","RearIO":"   Rear Panel IO Shield","PCISlot":"   Full-Height PCI Slot","PCISlot_LP":"   Low-Profile PCI Slot","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

// LEFT Side mod grid column count - how many copies of the above modification will be placed into a row on the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
left_side_mod_grid_columns = 1; // [1:12]

// LEFT Side mod grid row count - how many rows of the above modification will be placed onto the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
left_side_mod_grid_rows = 1; // [1:4]

// LEFT Side Mod Offset Distance (in mm) - shift the modification above to one side from horizontal center. Positive and negative values are allowed. - NOTE: Set this to zero and CageMaker will attempt to automatically position the modification if it'll fit. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
left_side_mod_horizontal_offset = 0.00; // [-240.00:1:240.0]

// LEFT Side Mod Vertical Offset Distance (in mm) - shift the modification above to one side from vertical center. Positive and negative values are allowed. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
left_side_mod_vertical_offset = 0.00; // [-75.00:1:75.0]

// RIGHT Side Mod Type - add a new connector, port, or opening of some form onto the faceplate. - NOTE: Be aware of fitment, as the device cage takes priority over any modifications selected here and if there isn't sufficient room for the modification CageMaker will remove it.
right_side_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector (Lock Tab Down)","KeystoneFlipped":"  Keystone Connector (Lock Tab Up)","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Single-Board Computers (Raspberry Pi And Similar)","SBC85x58_H":"   85x58mm SBCs (Raspberry Pi, etc.) - Horizontal","SBC85x58_VR":"   85x58mm SBCs (Raspberry Pi, etc.) - Vertical (Right Oriented)","SBC85x58_VL":"   85x58mm SBCs (Raspberry Pi, etc.) - Vertical (Left Oriented)","None":" ","None":"PC Motherboard Cutouts","RearIO":"   Rear Panel IO Shield","PCISlot":"   Full-Height PCI Slot","PCISlot_LP":"   Low-Profile PCI Slot","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

// RIGHT Side mod grid column count - how many copies of the above modification will be placed into a row on the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
right_side_mod_grid_columns = 1; // [1:12]

// RIGHT Side mod grid row count - how many rows of the above modification will be placed onto the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
right_side_mod_grid_rows = 1; // [1:4]

// RIGHT Side Mod Horizontal Offset Distance (in mm) - shift the modification above to one side from horizontal center. Positive and negative values are allowed. - NOTE: Set this to zero and CageMaker will attempt to automatically position the modification if it'll fit. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
right_side_mod_horizontal_offset = 0.00; // [-240.00:1:240.0]

// RIGHT Side Mod Vertical Offset Distance (in mm) - shift the modification above to one side from vertical center. Positive and negative values are allowed. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
right_side_mod_vertical_offset = 0.00; // [-75.00:1:75.0]


/* [Custom Cutout Options] */

// Custom Cutout A Shape - will this cutout be a round or rectangular hole?- NOTE: Requires selecting 'Custom Cutout A' as a faceplate modification.
custom_cutout_a_shape = "Round"; // ["Round":"Round","Rectangular":"Rectangular"]

// Custom Cutout A Diameter OR Height - sets cutout's diameter if round or height if rectangular. - NOTE: a solid outer-perimeter space of an additional 8mm will be added to this dimension. Plan accordingly if using grids. - NOTE: Requires selecting 'Custom Cutout A' as a faceplate modification.
custom_cutout_a_diameter_height = 1; // [1:1:250]

// Custom Cutout A Width - sets cutout's width if rectangular. This setting is ignored if the custom cutout is round. - NOTE: a solid outer-perimeter space of an additional 8mm will be added to this dimension. Plan accordingly if using grids. - NOTE: Requires selecting 'Custom Cutout A' as a faceplate modification.
custom_cutout_a_width = 1; // [1:1:250]

// Custom Cutout A Horizontal Paddding - by default, custom cutouts have a 4mm perimeter area around them, but this setting adds to this to increase the horizontal spacing between each cutout for grids of custom cutouts.
custom_cutout_a_horizontal_padding = 0; // [0:1:50]

// Custom Cutout A Vertical Paddding - by default, custom cutouts have a 4mm perimeter area around them, but this setting adds to this to increase the vertical spacing between each cutout for grids of custom cutouts.
custom_cutout_a_vertical_padding = 0; // [0:1:50]

// Custom Cutout A Corner Radius - creates rounded corners if the custom cutout is rectangular. - NOTE: Corner radius is restricted to just under half of the shorter of the length and heigh dimensions of the cutout's size, and increasing the value past that point will have no effect.
custom_cutout_a_corner_radius = 0; // [0:1:125]

// Custom Cutout A Snap-In Recess - creates a 3mm wide recess around the cutout to reduce the panel thickness to 2mm to support a snap-in receptacle, and expands the outer-perimeter space by a total of 6mm.
custom_cutout_a_snap_in_recess = false;

// Custom Cutout B Shape - will this cutout be a round or rectangular hole? - NOTE: Requires selecting 'Custom Cutout B' as a faceplate modification.
custom_cutout_b_shape = "Round"; // ["Round":"Round","Rectangular":"Rectangular"]

// Custom Cutout B Diameter OR Height - sets cutout's diameter if round or height if rectangular. - NOTE: a solid outer-perimeter space of an additional 8mm will be added to this dimension. Plan accordingly if using grids. - NOTE: Requires selecting 'Custom Cutout B' as a faceplate modification.
custom_cutout_b_diameter_height = 1; // [1:1:250]

// Custom Cutout B Width - sets cutout's width if rectangular. This setting is ignored if the custom cutout is round. - NOTE: a solid outer-perimeter space of an additional 8mm will be added to this dimension. Plan accordingly if using grids. - NOTE: Requires selecting 'Custom Cutout B' as a faceplate modification.
custom_cutout_b_width = 1; // [1:1:250]

// Custom Cutout B Horizontal Paddding - by default, custom cutouts have a 4mm perimeter area around them, but this setting adds to this to increase the horizontal spacing between each cutout for grids of custom cutouts.
custom_cutout_b_horizontal_padding = 0; // [0:1:50]

// Custom Cutout B Vertical Paddding - by default, custom cutouts have a 4mm perimeter area around them, but this setting adds to this to increase the vertical spacing between each cutout for grids of custom cutouts.
custom_cutout_b_vertical_padding = 0; // [0:1:50]

// Custom Cutout B Corner Radius - creates rounded corners if the custom cutout is rectangular. - NOTE: Corner radius is restricted to just under half of the shorter of the length and heigh dimensions of the cutout's size, and increasing the value past that point will have no effect.
custom_cutout_b_corner_radius = 0; // [0:1:125]

// Custom Cutout B Snap-In Recess - creates a 3mm wide recess around the cutout to reduce the panel thickness to 2mm to support a snap-in receptacle, and expands the outer-perimeter space by a total of 6mm.
custom_cutout_b_snap_in_recess = false;

// Custom Cutout C Shape - will this cutout be a round or rectangular hole? - NOTE: Requires selecting 'Custom Cutout C' as a faceplate modification.
custom_cutout_c_shape = "Round"; // ["Round":"Round","Rectangular":"Rectangular"]

// Custom Cutout C Diameter OR Height - sets cutout's diameter if round or height if rectangular. - NOTE: a solid outer-perimeter space of an additional 8mm will be added to this dimension. Plan accordingly if using grids. - NOTE: Requires selecting 'Custom Cutout C' as a faceplate modification.
custom_cutout_c_diameter_height = 1; // [1:1:250]

// Custom Cutout C Width - sets cutout's width if rectangular. This setting is ignored if the custom cutout is round. - NOTE: a solid outer-perimeter space of an additional 8mm will be added to this dimension. Plan accordingly if using grids. - NOTE: Requires selecting 'Custom Cutout C' as a faceplate modification.
custom_cutout_c_width = 1; // [1:1:250]

// Custom Cutout C Horizontal Paddding - by default, custom cutouts have a 4mm perimeter area around them, but this setting adds to this to increase the horizontal spacing between each cutout for grids of custom cutouts.
custom_cutout_c_horizontal_padding = 0; // [0:1:50]

// Custom Cutout C Vertical Paddding - by default, custom cutouts have a 4mm perimeter area around them, but this setting adds to this to increase the vertical spacing between each cutout for grids of custom cutouts.
custom_cutout_c_vertical_padding = 0; // [0:1:50]

// Custom Cutout C Corner Radius - creates rounded corners if the custom cutout is rectangular. - NOTE: Corner radius is restricted to just under half of the shorter of the length and heigh dimensions of the cutout's size, and increasing the value past that point will have no effect.
custom_cutout_c_corner_radius = 0; // [0:1:125]

// Custom Cutout C Snap-In Recess - creates a 3mm wide recess around the cutout to reduce the panel thickness to 2mm to support a snap-in receptacle, and expands the outer-perimeter space by a total of 6mm.
custom_cutout_c_snap_in_recess = false;


/* [DANGEROUS! - Ignore Errors - DANGEROUS!] */

// IGNORE ERRORS and render design regardless - WARNING: This option forces CageMaker to ignore errors and only show error messages in console without producing a "CHECK CONSOLE" panel in the preview pane, and will cause CageMaker to attempt to generate a cage regardless of conditions. This can result in an unprintable cage or one that breaks sizing, offset, or overlap detection rules. ONLY USE THIS OPTION IF YOU ARE ABSOLUTELY SURE THE END RESULT WILL BE WHAT YOU WANT.
ignore_errors = false;


/* [Rarely-Changed Options] */

// Clearance in mm - lower values make for a tighter fit, but remember that 3D printers have dimensional tolerances on their prints.
device_clearance = 0.50; // [-5.00:0.05:5.00]

// Rounded faceplate corners
faceplate_radius = 5; // [0.1:"No - sharp corners",5:"Rounded corners - DEFAULT"]

// Rounded side/top/bottom cutout corners
cutout_radius = 5; // [0.1:"No - sharp corners",5:"Rounded corners - DEFAULT"]

// Cage snap-fit dimensional tolerance (in mm) for separately printed cages, or for the bolt-together slots for split cages - Adjusts the socket into which the cage proper will snap into the back of the faceplate, in order to compensate for dimensional irregularities on the printer. - NOTE: When properly set, the cage should be a pressure fit but not so tight that trying to insert it distorts the faceplate.
snap_fit_tolerance = 0.50; // [-1.0:0.05:2.5]

// Detail level of all curved/rounded surfaces, and a higher value is better but can be MUCH slower - NOTE: default is 36, and anything over 100 is not advised. This should not normally need to be changed.
this_fn = 36; // [0:12:360]

// Disable logotype at the bottom of the viewing area.
no_logotype = false;



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



/* [Hidden] */
// This module is only here to stop the customizer from converting the following globals into changeable options.
module block_customizer()
{
    // Yep, that's all this is for.
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



// As of version 0.7, CageMaker PRCG has been broken into sections to make improvement and 
// maintenance more manageable. The sections are loaded into OpenSCAD here.


// Include the global declarations to start things off.
include <CageMaker_PRCG_Globals.scad>

// Error Message Handling
include <CageMaker_PRCG_ErrorMessageHandling.scad>

// Core Component & Structure Creation
include <CageMaker_PRCG_CoreComponentAndStructureCreation.scad>

// Library incorporations for special features
include <CageMaker_PRCG_LibraryIncorporations.scad>

// Ventilation Grid Generators
include <CageMaker_PRCG_VentilationGridGenerators.scad>

// Faceplate Modification Handlers
include <CageMaker_PRCG_FaceplateModificationHandlers.scad>

// Rulers and Guides
include <CageMaker_PRCG_RulersAndGuides.scad>

// Assembling The Object
include <CageMaker_PRCG_AssemblingTheObject.scad>



/*

    Support Functions (that don't require being rolled off into their own file)

*/



function to_mm(inches) = inches * 25.4;

function units_to_mm(height_required_in_units) = height_required_in_units * unit_height_in_mm;



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



echo();
echo();
echo("   Welcome to CageMaker PRCG   ");
echo("   Version 0.7   ");
echo("   -=-=-=-=-=-=-=-=-=-=-=-=-=-=-   ");
echo();
echo(str("   Max SINGLE device width with these settings: ", floor(max_device_width), " mm.   "));
echo();
echo();



// Are we doing a flat plane for a faceplate?
if ((reduce_faceplate_to_2d) && ((faceplate_only != 0.0)))
    projection()
        translate([0, 0, 0])
            create_object();
// We are not! Just do the thing!
else
    create_object();



// CageMaker PRCG Logotype
if (($preview) && (!no_logotype))
{
    total_height_required = device_height + support_cage_base_size + (plate_thickness * 2);
    height_required_in_units = faceplate_only == 0.0 ? (ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1) : faceplate_only;

    translate([0, 0 - (((height_required_in_units / 2) + 0.5 + ((split_cage_into_two_halves || print_cage_separately ||safe_generate_rear_support_cage) ? 0.75 : 0)) * unit_height_in_mm), -150])
    {
        translate([-220, -85, -0.01])
            color("lightslategray")
                linear_extrude(height=0.25) 
                    offset(0.35)
                        scale([1.5, 1.5, 1.0])
                            polygon(
                                points=[
                                    [39.0439,59.9711],[48.8312,65.6218],[78.7814,48.3300],
                                    [69.0904,42.7349],[45.0321,62.3427],[46.6585,61.4037],
                                    [41.1274,60.0847],[42.7538,59.1457],[48.6040,64.4183],
                                    [50.2304,63.4793],[71.2259,47.0790],[72.8523,46.1400],
                                    [67.5948,44.9122],[69.2212,43.9732],[75.0714,49.1546],
                                    [76.6978,48.2156],[45.0044,58.2333],[51.8555,62.1888],
                                    [72.8207,50.0845],[66.0370,46.1680],[45.0044,47.3032],
                                    [66.0258,35.2332],[72.8207,39.1544],[66.0370,35.2378],
                                    [45.0044,51.2720],[66.0258,39.2020],[66.0534,39.1835],
                                    [66.0370,39.2067],[39.0439,58.7805],[69.0840,41.4693],
                                    [78.7814,47.1394],[69.0904,41.5443]
                                ],
                                paths=[
                                    [0,1,2,3,0],[4,5,4],[6,7,6],[8,9,8],[10,11,10],[12,13,12],
                                    [14,15,14],[16,17,18,19,16],[20,21,22,23,20],[24,25,26,27,24],
                                    [28,29,30,31,28]
                                ],
                                convexity=10
                            );

        translate([-92, -5, -0.01])
            color("lightslategray")
                linear_extrude(height=0.25) 
                    scale([1.5, 1.5, 1.0])
                        text("CageMaker PRCG", size=15, font = "Liberation Sans:style=Bold Italic");

        translate([-90, -25, -0.01])
            color("lightslategray")
                linear_extrude(height=0.25) 
                    scale([1.5, 1.5, 1.0])
                        text("Parametric Rack Cage Generator", size=8.4, font = "Liberation Sans");

        translate([-90, -40, -0.01])
            color("lightslategray")
                linear_extrude(height=0.25) 
                    scale([1.5, 1.5, 1.0])
                        text("Version 0.7 • cagemaker.org • github.com/WebMaka/CageMakerPRCG", size=3.95, font = "Liberation Sans");

        translate([-0, -10, -1])
            color("white")
                four_rounded_corner_plate(80, 360, 2, 10);
                
        translate([-92, -15, -3])
            rotate([0, 180, 180])
                color("lightslategray")
                    linear_extrude(height=0.25) 
                        scale([1.5, 1.5, 1.0])
                            text("CageMaker PRCG", size=15, font = "Liberation Sans:style=Bold Italic");

        translate([-90, 5, -3])
            rotate([0, 180, 180])
                color("lightslategray")
                    linear_extrude(height=0.25) 
                        scale([1.5, 1.5, 1.0])
                            text("Parametric Rack Cage Generator", size=8.4, font = "Liberation Sans");

        translate([-90, 20, -3])
            rotate([0, 180, 180])
                color("lightslategray")
                    linear_extrude(height=0.25) 
                        scale([1.5, 1.5, 1.0])
                            text("Version 0.7 • cagemaker.org • github.com/WebMaka/CageMakerPRCG", size=3.95, font = "Liberation Sans");

        translate([-220, 65, -3])
            rotate([0, 180, 180])
                color("lightslategray")
                    linear_extrude(height=0.25) 
                        offset(0.35)
                            scale([1.5, 1.5, 1.0])
                                polygon(
                                    points=[
                                        [39.0439,59.9711],[48.8312,65.6218],[78.7814,48.3300],
                                        [69.0904,42.7349],[45.0321,62.3427],[46.6585,61.4037],
                                        [41.1274,60.0847],[42.7538,59.1457],[48.6040,64.4183],
                                        [50.2304,63.4793],[71.2259,47.0790],[72.8523,46.1400],
                                        [67.5948,44.9122],[69.2212,43.9732],[75.0714,49.1546],
                                        [76.6978,48.2156],[45.0044,58.2333],[51.8555,62.1888],
                                        [72.8207,50.0845],[66.0370,46.1680],[45.0044,47.3032],
                                        [66.0258,35.2332],[72.8207,39.1544],[66.0370,35.2378],
                                        [45.0044,51.2720],[66.0258,39.2020],[66.0534,39.1835],
                                        [66.0370,39.2067],[39.0439,58.7805],[69.0840,41.4693],
                                        [78.7814,47.1394],[69.0904,41.5443]
                                    ],
                                    paths=[
                                        [0,1,2,3,0],[4,5,4],[6,7,6],[8,9,8],[10,11,10],[12,13,12],
                                        [14,15,14],[16,17,18,19,16],[20,21,22,23,20],[24,25,26,27,24],
                                        [28,29,30,31,28]
                                    ],
                                    convexity=10
                            );
    }
}



/* END! */
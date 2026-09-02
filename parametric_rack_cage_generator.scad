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

// Top and bottom holes only - by default, CageMaker populates all hole spaces on a faceplate regardless of height. Enabling this setting causes CageMaker to only populate the top-most and bottom-most holes on the faceplate. - NOTE: This aligns to the edges of FULL unit heights, so if the "allow half heights" option is enabled, the bottom-most holes will be at the top holes of the bottom-most half-unit.
top_and_bottom_holes_only = false;

// Use a simple hole instead of a 5mm wide slot for mounting. NOTE: This may cause interference issues for racks whose mounting centers aren't dimensionally accurate.
hole_instead_of_slot = false;

// Allow half-unit heights - by default, height scales in even unit increments, but this setting enables half-heights, which might be useful for small devices in compact miniracks. - NOTE: This makes the resulting cage vertically asymmetric!
allow_half_heights = false;

// Vertically shift mounting holes - by default, mounting holes are centered relative to each unit. This setting shifts the center point up by half a unit, essentially flipping a half-unit-height-multiple cage. Useful for situations such as half-unit-multiple cages that have alignment concerns or to compensate for upside-down Keystone receptacles.
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

//unit_height_in_mm = rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][1];
//mounting_hole_pattern = rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][2];
//mounting_hole_diameter = rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][3];
//mounting_reservation_space = rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][4];


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



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



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



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



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

// Create a three-dimensional rectangular prism with two rounded corners and 
// a U-shaped profile (e.g., ventilated support frame)
//module ventilated_u_side_plate(plate_height, plate_width, plate_thickness, side_thickness, outer_corner_radius=10, inner_corner_radius=5, split=false)
//{
//    difference()
//    {
//        two_rounded_corner_plate(plate_height, plate_width, plate_thickness, outer_corner_radius);
//        if (split)
//        {
//            translate([0 - ((plate_width - side_thickness) / 2) + (side_thickness), 0 - side_thickness, 0])
//                two_rounded_corner_plate(plate_height, (plate_width - (side_thickness * 3)) / 2, plate_thickness + 2, inner_corner_radius);
//            translate([((plate_width - side_thickness) / 2) - (side_thickness), 0 - side_thickness, 0])
//                two_rounded_corner_plate(plate_height, (plate_width - (side_thickness * 3)) / 2, plate_thickness + 2, inner_corner_radius);
//        }
//        else    
//            translate([0, 0 - side_thickness, 0])
//                two_rounded_corner_plate(plate_height, plate_width - (side_thickness * 2), plate_thickness + 2, inner_corner_radius);
//    }
//}

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

//    translate([0 - (screw_centers / 2), 0 - (screw_centers / 2), 3.5])
//        rotate([0, 0, 90])
//            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
//    translate([0 + (screw_centers / 2), 0 - (screw_centers / 2), 3.5])
//        rotate([0, 0, 90])
//            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
//    translate([0 - (screw_centers / 2), (screw_centers / 2), 3.5])
//        rotate([0, 0, 90])
//            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
//    translate([0 + (screw_centers / 2), (screw_centers / 2), 3.5])
//        rotate([0, 0, 90])
//            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
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



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



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



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



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



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



/*

    Support Functions

*/



function to_mm(inches) = inches * 25.4;

function units_to_mm(height_required_in_units) = height_required_in_units * unit_height_in_mm;

//function select(vector, indices) = [ for (index = indices) vector[index] ];
//    
//function cat(L1, L2) = [for(L=[L1, L2], a=L) a];


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



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
                    place_keystone(horizontal_offset + x_offset, vertical_offset + 1.5 + y_offset, 0);

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



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



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



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



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

/*

 CageMaker PRCG - The Parametric Rack Cage Generator v. 0.60 (21 Jun 2026)
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


 If this is useful to you, please consider donating or subscribing to my
 Patreon. I fund my projects entirely out-of-pocket, and any additional
 funding will help.

   https://patreon.com/webmaka

 
 
 Patch Notes
 -------------------------------------------------------------------------------- 
 0.60 - 21 Jun 2026
 
   - Added the option to select popular devices from a list and preconfigured
     dimensions for the cage for the selected device.
   - Added an option to reduce a custom faceplate without a cage to a flat/2D
     object for export as a flat object for cutting or engraving. (Requested by
     Reddit user "wirehead")
   - Reduced support_cage_base_size default from 14 to 12. This will allow up to 
     32mm tall cages to fit in a single unit of height.
   - Added recess option for snap-in receptacles to custom cutouts, which adds a 
     3mm wide recess and reduces panel depth to 2mm for the ears of a snap-include
     receptacle to grab.
   - Added horizontal and vertical spacing controls to custom cutouts, to increase
     spacing in grids.
   - Added an option to modify the geometry of the generated cage, which allows for
     reducing the size of the cage's structure for lighter devices.
   - Added vertical offset option to left and right faceplate modifications.
     (Requested by Thingiverse user "ztilleto")
   - Fixed an edge-case bug where extremely low values for "support_cage_base_size"
     would cause the cage to detach from the faceplate.
   - Fixed an edge-case bug with the cage ventilation code that would generate
     undersized grids with broken segments.
 
 0.50 - 15 Apr 2026
 
   - Added the capability to replace most of the faceplate with a grid of holes
     for ventilation. Grid can be one of several different geometries, and both
     horizontal and vertical offsets are adjustable as is hole diameter, angle,
     and wall-between-hole thickness. Sides, top/bottom, and faceplate
     ventilation grids are configured independantly.
   - Added the capability to replace the open areas of the sides and top/bottom
     with ventilation grids. Grid can be one of several geometries, and both
     horizontal and vertical offsets are adjustable as is hole diameter,angle, 
     and wall-between-hole thickness. Sides, top/bottom, and faceplate
     ventilation grids are configured independantly. (The "make bottom a shelf" 
     and "make sides solid" options override these as required.)
   - Added VESA-C/D/E/F mount patterns as faceplate modifications, with sizes
     up to 200mm, Neutrik D-Series connector mount patterns, 24mm hole for 
     buttons/lights/etc. DIN cutouts in 1/32- to 1/4-DIN sizes, IEC C13/C14/
     C19/C20 receptacle cutouts, and 16A/32A power inlet cutouts as faceplate 
     modifications.
   - Replaced faceplate modifications that were groups of a single mod with the
     ability to create a grid of one mod. Up to 12 columns by 4 rows of any one
     mod can be placed in one operation if there's enough room to do so on the
     faceplate. This will make creating custom patch panels and breakout panels
     substantially easier.
   - Added a centered modification option for faceplate blanks without cages. The
     modifications include the same new choices and options.
   - Added three custom cutout modifications, which can be round or rectangular
     and of a user-defined size.
   - Restructured faceplate modification code to make it easier to add new mods
     without having to repeat code, and reduced six sets of relevant code to two
     and cut the entire subsystem's size and complexity down substantially.
   - Reorganized faceplate modifications in the Customizer to make them easier 
     to select.
   - Added the ability to generate a rear support sub-cage to match the front
     rack cage and help support it on racks that include a rear rail set. This
     helps support the rear ends of longer/heavier devices.
   - Added support for 5-inch micro-racks, and added a 50%-scaled EIA-310 layout
     option to support scaled-down 10" rack systems such as the Mini LabRaxx.
   - Added a lightweight device option to the "heavy device" setting for small
     devices like SBCs - this reduces panel thicknesses to 3.175mm or 1/8"
     instead of the default of 4mm.
   - Improved the cooling fan modification's generator code to improve its 
     functionality and make it work properly within OpenSCAD Playground.
   - Increased vertical gap between adjacent Keystone receptacles by 2mm to 
     provide better clearance.
   - Modified the multiple-device-cage generator to reduce the amount of material
     required to print a multi-device cage.
   - HOPEFULLY finally fixed a persistent bug in the faceplate modification
     placement code that would occasionally overlap left and right mod slots 
     over each other.
   - Fixed a few more edge-case bugs.
 
 0.40 - 22 Feb 2026
 
   - Added support for non-standard rack geometries, as well as alternative
     hole patterns for EIA-310 racks. This should allow the creation of usable
     rack cages for practically any rackmount system on Earth regardless of
     whether it complies with existing standards, as well as supporting any 
     newly emergent designs even if they don't match EIA-310 layout.
   - Added options for creating quarter-width cages for 19" racks. This allows
     for projects like placing four Raspberry Pis into a single unit of height
     on a 19" rack.
   - Added an option to round the corners of the faceplate cutout through which
     the device inserts into the cage. Note that this does NOT round the corners
     within the cage proper, so using either "extra support" or "make bottom a
     shelf" options might be advisable depending on the shape of the device.
     (Requested by MakerWorld user "eriekr".)
   - Added an option to create a faceplate without a cage, setting the height
     to a specific number of units. Modifications are still enabled, but most
     cage creation features become unavailable.
   - Added an option to only provide screw holes for the top-most and bottom-
     most mounting holes on the faceplate. This makes for neater aesthetics on
     small cages on small racks where there is no real need for a ton of screws.
   - Added options for placing mounting holes in ears along the shorter edge
     of a cage, or the corners of the cage opening, or both. Holes are aligned
     with the edge of the cage opening. This is intended to support subrack
     systems that insert into cage openings and secure with screws.
   - Added an option to make the sides of the cage solid instead of removing
     most of them for ventillation. (Requested by MakerWorld user "Stephen".)
   - Added an option to expend the gap between multiple devices, which can be
     useful for thermal management in densely populated builds. (Requested by
     MakerWorld user "Stephen".)
   - Added the capacity to change mounting hole sizes.
   - Expanded faceplate modifications to add support for 10mm, 12mm, 16mm, 
     and 19mm pushbuttons and panel lights, as well as dual 30mm and 40mm 
     cooling fans.
   - Adjusted spacing on split cages so that a 10" 2U cage can fit within a
     180mm sqare footprint - print a 10" 2U cage on an A1 Mini!
   - Added a "CAGE TOP" marker to the ruler feature, to make it more obvious
     which way is "up" relative to the faceplate.
   - Added a number of example printers to the list of sizes in the build outline
     option, to make selecting an outline size easier for several popular printers.
   - Added a unit-height indicator to the ruler feature, to make the size of
     the generated cage, in units, more apparent.
   - Revamped the layout of options in the Customizer, so as to more intelligently
     and sensibly group them.
   - Fixed a few edge-case bugs.
 
 0.30 - 20 Jan 2026
 
   - Added an option to print the cage proper separately from the faceplate.
     On printers with a large enough bed to print a full-width faceplate, this
     dramatically reduces the amount of support required for printing, and
     decreases the filament cost by a good 20% or more. Print time is also
     considerably faster. Cage connects to faceplate with 1.75mm filament
     pins or M2 screws. A setting "snap_fit_tolerance" has been added to
     adjust the size of the sockets on the back of the faceplate to make for
     a better fit.
   - Added an option to make the bottom of the cage a shelf, which prints it
     as a solid side instead of removing most of it for ventillation.
   - Added an option to construct a multiple-device cage for housing more than
     one device of a given size, such as vertically-arranged Raspberry Pis,
     hard drives, etc. (Swap the device height and width parameters to house
     a device vertically.) Excellent for creating "sub-cage" style assemblies
     of same-sized devices. (Requested by Github user "AnthonyGress".)
   - Added an option to add a 1mm lip to the front of the cage to act as a
     retainer for the device in the cage. This also triggers recessing the
     device 1mm into the cage to compensate for the retention lip.
   - Converted number-based setting values to sliders to prevent several out-
     of-range errors.
 
 0.21 - 23 Dec 2025
 
   - Added a vertical offset setting, which adds the ability to shift the cage 
     off vertical center.
   - Cleaned up code in a number of places (hat tip: Reddit user "oldesole1")
   - Fixed a number of new bugs.
 
 0.20 - 21 Dec 2025
   - Added the ability to split any cage in half, for printing within a smaller 
     print volume, e.g., 10" 2U rack cage on a 220mm^2 print bed (e.g., Ender3).
     This requires additional compute time, however, as the script will create
     two complete copies of the full cage and then split them each in half so
     as to handle asymmetric cages.
   - Added an option for alignment pin holes on split cages, for better alignment
     and increased durability.
   - Added the capability to shift the cage side-to-side by changing an offset
     value.
   - Added the capability to modify the cage faceplate to add things like Keystone
     module receptacles and a few common cooling fan sizes.
   - Added an on-screen ruler to assist in determining offset values for shifting
     things around.
   - Added a configurable outline to indicate the build volume of the 3D printer
     to be used to print cages, for easier design planning.
   - Added better fastener support, including close-clearance, tapped, and heat-
     set inserts in multiple sizes (M3 to M6 and 4-40 to 1/4-20).
   - Added more verbiage to options in the Customizer to make the script easier
     to use.
   - Made bolt-together ears automatic for half-/third-width cages - selecting a
     partial-rack width auto-enables the appropriate ears on one or both sides.
   - Added the option to reinforce the faceplate by adding a "rolled edge" to the
     top and bottom edges on the back side of the faceplate.
   - Modified the support structure generation code to increase the structure's
     size when increasing the "heavy device" setting, which allows fitting smaller
     devices into fewer units when they don't require thickened supports. The new
     device height limit on otherwise-default settings is 28mm/unit.
   - Consolidated some options to make the script easier to use.
   - Fixed a number of bugs and consolidated the script's code.
 
 0.12 - 30 Aug 2025
   - Added support for half-height cages as well as half-width for 10" racks.
     (Requested by Github user "FlyingT".)
 
 0.11 - 29 Aug 2025
   - Added support for heat-set threaded inserts on faceplate ears for half-
     and third-width cages for 19" racks. (Requested by Github user "woolmonkey".)
 
 0.1 - 10 Aug 2025 
   Initial Release
 
*/



// Customizer setup


/* [Target Device Presets] */

// Preconfigured Devices - Select a device from the list to automatically configure a cage to contain it. - NOTE: Please be aware that this only presets the cage for the size of the device, and other settings may need to be enabled for best results. - NOTE: Selecting anything from this list overrides the manual dimension configuration options in the "Target Device Dimensions" category below.
preconfigured_device = ""; // ["":"Select device dimensions manually in Target Device Dimensions","":"","":"Routers/Gateways","M-CRS309-1G-8S+IN":"  Mikrotik CRS309-1G-8S+IN","M-HEX":"  Mikrotik hEX Series (EXCEPT PoE)","M-HEXPOE":"  Mikrotik hEX PoE","M-RB4011IGS":"  Mikrotik RB4011iGS+RM","S-TZ-SMALL":"  SonicWall TZ Series (Smaller Desktop)","S-TZ-LARGE":"  SonicWall TZ570/TX670 (Larger Desktop)","T-ER605":"  TP-Link Omada ER605","T-ER7206":"  TP-Link Omada ER7206 (1U Ultra-Compact)","U-EDGE4":"  Ubiquiti UniFi EdgeRouter 4","U-EDGEXSFP":"  Ubiquiti UniFi EdgeRouter X SFP","U-EXPRESS7":"  Ubiquiti UniFi Express 7 (NOTE: Forces 'make bottom a shelf' option!)","U-UCG-FIBER":"  Ubiquiti UniFi UCG Fiber (NOTE: Forces 'make bottom a shelf' option!)","U-UCG-MAX":"  Ubiquiti UniFi UCG Max/Ultra (NOTE: Forces 'make bottom a shelf' option!)","U-UISP-R":"  Ubiquiti UniFi UISP Router","":"","":"5-Port Switches","D-DES-105":"  D-Link DES-105","D-DGS-105":"  D-Link DGS-105","D-DGS-105GL":"  D-Link DGS-105GL","D-DMS-105":"  D-Link DMS-105","N-GS105":"  Netgear GS105","N-GS105Ev2":"  Netgear GS105E v2","N-GS105PE":"  Netgear GS105PE","N-GS305":"  Netgear GS305","L-SE3005v1":"  Linksys SE3005 v1","L-SE3005v2":"  Linksys SE3005 v2","T-LS105G":"  TP-Link LS105G","T-LS1005G":"  TP-Link LS1005G","T-ES206X-M2":"  TP-Link Omada T-ES206X-M2","T-SG105S":"  TP-Link SG105S/SG105MPE","":"","":"8-Port Switches","C-GS108":"  Cudy GS108","D-DES-108":"  D-Link DES-108","D-DGS-108":"  D-Link DGS-108","D-DGS-108GL":"  D-Link DGS-108GL","D-DMS-108":"  D-Link DMS-108","L-SE3008v1":"  Linksys SE3008 v1","L-SE3008v2":"  Linksys SE3008 v2","N-GS108":"  Netgear GS108","N-GS108Ev3":"  Netgear GS108E v3","N-GS308LP":"  Netgear GS308LP/GS308PP","N-GS308":"  Netgear GS308","T-LS108G":"  TP-Link LS108G","T-LS1008G":"  TP-Link LS1008G","T-ES210X-M2":"  TP-Link Omada ES210X-M2","T-TEG-S381":"  TrendNET TEG-S381","T-TEG-S82g":"  TrendNET TEG-S82g","U-UISP-S":"  UniFi UISP Switch","U-US-8-150W":"  UniFi US-8-150W","Z-GS1100-10HP":"  Zyxel GS1100-10HP","":"","":"12-16-Port Switches","Z-GS1100-16":"  Zyxel GS1100-16","":"","":"SFP Switches","M-CRS305-1G-4S+IN":"  Mikrotik CRS305-1G-4S+IN","T-TEG-S5":"  TrendNET TEG-S5 Series","U-UISP-S":"  Ubiquiti UniFi UISP Switch Plus","":"","":"Small Form Factor PCs","A-MACMINI":"  Apple MAC Mini M4+ (NOTE: Forces 'make bottom a shelf' option!)","A-MACSTUDIO":"  Apple MAC Studio M3+ (NOTE: Forces 'make bottom a shelf' option!)","D-USFF":"  Dell OptiPlex USFF Chassis","D-MICRO":"  Dell OptiPlex M (Micro) Chassis (1U Ultra-Compact)","H-GSERIES":"  HP Elite/Pro G3/G6/G9 Mini Chassis (1U Ultra-Compact)","H-Z2G9":"  HP Z2 G9 Mini Chassis","I-NUC-PRO":"  Intel NUC Pro Chassis","I-NUC-SLIM":"  Intel NUC Slim Chassis","I-NUC-TALL":"  Intel NUC Tall/Dual-LAN Chassis","L-TCTINY":"  Lenovo ThinkCentre Tiny (1U Ultra-Compact)","M-MS-01":"  Minisforum MS-01/MS-A2/MS-R1","M-MS-A1":"  Minisforum MS-A1","":"","":"Miscellaneous","BAY-2.5-H":"  2.5-Inch Drive Bay (Horizontal)","BAY-2.5-V":"  2.5-Inch Drive Bay (Vertical)","BAY-2.5H-H":"  2.5-Inch Half-Height Drive Bay (Horizontal)","BAY-2.5H-V":"  2.5-Inch Half-Height Drive Bay (Vertical)","BAY-3.5-H":"  3.5-Inch Drive Bay (Horizontal)","BAY-3.5-V":"  3.5-Inch Drive Bay (Vertical)","BAY-E1.S-9.5-H":"  E1.S-9.5mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.S-9.5-V":"  E1.S-9.5mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E1.S-15-H":"  E1.S-15mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.S-15-V":"  E1.S-15mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E1.S-25-H":"  E1.S-25mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.S-25-V":"  E1.S-25mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E1.L-9.5-H":"  E1.L-9.5mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.L-9.5-V":"  E1.L-9.5mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E1.L-18-H":"  E1.L-18mm (Enterprise SSD) Drive Bay (Horizontal)","BAY-E1.L-18-V":"  E1.L-18mm (Enterprise SSD) Drive Bay (Vertical)","BAY-E3.S-H":"  E3.S (Enterprise SSD) Drive Bay (Horizontal)","BAY-E3.S-V":"  E3.S (Enterprise SSD) Drive Bay (Vertical)","BAY-E3.S-2T-H":"  E3.S-2T (Enterprise SSD) Drive Bay (Horizontal)","BAY-E3.S-2T-V":"  E3.S-2T (Enterprise SSD) Drive Bay (Vertical)","BAY-E3.L-H":"  E3.L (Enterprise SSD) Drive Bay (Horizontal)","BAY-E3.L-V":"  E3.L (Enterprise SSD) Drive Bay (Vertical)","BAY-E3.L-2T-H":"  E3.L-2T (Enterprise SSD) Drive Bay (Horizontal)","BAY-E3.L-2T-V":"  E3.L-2T (Enterprise SSD) Drive Bay (Vertical)"]


/* [Target Device Dimensions] */

// Depth/length (front-to-back) of device in mm. - NOTE: Selecting a device preset overrides this setting.
manual_device_depth = 120.0; // [15:1:500]

// Width (left-to-right) of device in mm. - NOTE: Swap this setting and device_height below to mount the device vertically. - NOTE: Selecting a device preset overrides this setting.
manual_device_width = 150.0; // [15:1:450]

// Height (top-to-bottom) of device in mm. - NOTE: Swap this setting and device_width above to mount the device vertically. - NOTE: Selecting a device preset overrides this setting.
manual_device_height = 45.0; // [15:1:500]

// Support Structure Base Size (Geometry) - determines how the cage proper is generated and significantly affects overall strength/rigidity. Lower values require less space and allow using larger devices without expanding to the next unit of height, but trades strength and weight capacity for compactness. - NOTE: Actual width of the support structure is expanded further based on the "heavy device" setting below, which increases the thickness of all surfaces. Values given are based on the default 4mm "heavy device" setting. - NOTE: Selecting a device preset overrides this setting.
manual_support_cage_base_size = 12; // [8:"Plain Box (weakest) - Adds 8mm by default to device dimensions",10:"Box With Ribbed Corners - Adds 10mm by default to device dimensions",12:"Plus-Shaped - DEFAULT - Adds 12mm by default to device dimensions",14:"Expanded Plus-Shaped - Adds 14mm by default to device dimensions",16:"Widened Plus-Shaped (strongest) - Adds 16mm by default to device dimensions"]

// Heavy device - thicken all surfaces to support additional weight. - NOTE: Selecting a device preset overrides this setting.
manual_heavy_device = 0; // [-0.875:"3.125mm (1/8-in.) For Small Lightweight Devices",0:"Standard 4mm Thickness - DEFAULT",1:"Thickened 5mm Thickness",2:"Super-Thick 6mm Thickness",4:"Ultra-thick 8mm Thickness"]

// Number of devices to cage - by default, one cage holds one device, but this setting multiplies this. Excellent for side-by-side mounting of smaller devices, e.g., Raspberry Pis, especially when mounted vertically by swapping the device height and width parameters. - NOTE: CageMaker will insert a wall the width of the "heavy device" setting plus the "multiple device gap" setting between each device. - WARNING: CageMaker will enforce safe boundaries so as to not push a cage into mounting space or off the edge of the faceplate.
number_of_devices = 1; // [1:1:16]

// Additional gap space between devices - by default, multiple devices are separated by a wall whose thickness is set by the "heavy device" setting, and this setting adds to that distance. - WARNING: This can dramatically increase cage complexity, which in turn substantially increases both print time and filament consumption.
multiple_device_gap = 0.0; // [0:1:50]


/* [Rulers/Guides] */

// Show or hide a ruler with coordinates for positioning cage/modifications, as well as markers for the centers of the cage and modifications. - NOTE: This ruler is not generated during a full render but only appears in previews.
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
rack_geometry = "EIA-310"; // ["EIA-310":"EIA-310-D Standard Layout - DEFAULT","EIA-310-LH":"EIA-310-D Standard Layout With Large Screw Holes (M6 or 1/4-20) ","EIA-310-1T":"EIA-310 Modified - Single Centered Hole At Top Per Unit","EIA-310-1C":"EIA-310 Modified - Single Centered Hole At Center Per Unit","EIA-310-2":"EIA-310 Modified - Two Holes Per Unit","HALF-EIA-310":"EIA-310-D Standard Layout Scaled Down 50%","20mm":"20mm Unit Height, 10mm hole spacing","25mm":"25mm Unit Height, 12.5mm hole spacing","30mm":"30mm Unit Height, 15mm hole spacing","40mm":"40mm Unit Height, 20mm hole spacing","50mm":"50mm Unit Height, 25mm hole spacing"]

// Top and bottom holes only - by default, CageMaker populates all hole spaces on a faceplate regardless of height. Enabling this setting causes CageMaker to only populate the top-most and bottom-most holes on the faceplate. - NOTE: This aligns to the edges of FULL unit heights, so if the "allow half heights" option is enabled, the bottom-most holes will be at the top holes of the bottom-most half-unit.
top_and_bottom_holes_only = false;

// Rack cage width (inches) - NOTE: CageMaker will expand the cage size if it cannot create one that can fit within the selected width for the given device dimensions, in which case a warning will appear in the console.
rack_cage_width = 10; // [4.75:"4.75 in. Wide - OUTER (Left or Right) Quarter-Width for 19 in. Full-Size Rack",4.75001:"4.75 in. Wide - INNER Quarter-Width for 19 in. Full-Size Rack",5:"5 in. Micro-Rack",5.001:"5 in. Wide - Half-Width for 10 in. Mini-Rack",6:"6 in. Micro-Rack",6.33:"6.33 in. Wide - OUTER (Left or Right) Third-Width for 19 in. Full-Size Rack",6.33001:"6.33 in. Wide - CENTER Third-Width for 19 in. Full-Size Rack",7:"7 in. Micro-Rack",9.5:"9.5 in. Wide - Half-Width for 19 in. Full-Size Rack",10:"10 in. Mini-Rack",19:"19 in. Full Rack"]
    // Yes, those strange x.xx001s are there for a reason...

// Allow half-unit heights - by default, height scales in even unit increments, but this setting enables half-heights, which might be useful for small devices in compact miniracks. - NOTE: This makes the resulting cage vertically asymmetric!
allow_half_heights = false; 

// Add alignment pin holes to edges for split, half-width, and third-width cages - this adds 5mm deep 1.75mm diameter holes to mating surfaces for multi-part cages, with the idea that short lengths of filament can be used as alignment dowels. - NOTE: holes will probably need to be chased with a suitable drill bit (e.g., #51/1.702mm or #50/1.78mm). This adds complexity to the object but makes for a cleaner alignment of multiple parts. Recommended for gluing parts together in particular.
add_alignment_pin_holes = false;

// Tapping or heat-set insert holes - sets hole diameters on split cages or bolt-together faceplate ears for tapping, or expands hole diameters to allow the use of heat-set threaded inserts instead of raw bolts. - NOTE: This setting should match the recommended hole diameter of the bolt or insert to be used, or use the next smaller diameter. - ALSO NOTE: This setting is only used for bolt-together cages (split in half or with bolt-together ears).
tap_or_heat_set_holes = 5.25; // [5.25:"M5 Clearance (5.25mm hole) - DEFAULT",0.00:" ",0.00:"Clearance Holes",3.15:"  M3 Clearance (3.15mm hole)", 4.20:"  M4 Clearance (4.2mm hole)", 5.25:"  M5 Clearance (5.25mm hole) - DEFAULT", 6.30:"  M6 Clearance (6.3mm hole)", 2.95:"  4-40 Clearance (.1160 in. hole)", 3.66:"  6-32 Clearance (.144 in. hole)",4.31:"  8-32 Clearance (.1695 in. hole)", 4.98:"  10-24/10-32 Clearance (.1960 in. hole)", 6.53:"  1/4-20 Clearance (.257 in. hole)", 0.00:" ",0.00:"Tapped Holes",2.60:"  M3 Tapped (2.6mm hole)", 3.50:"  M4 Tapped (3.5mm hole)", 4.40:"  M5 Tapped (4.4mm hole)", 5.00:"  M6 Tapped (5.0mm hole)", 2.07:"  4-40 Tapped (0.0813 in. hole)", 2.53:"  6-32 Tapped (.0997 in. hole)", 3.19:"  8-32 Tapped (.1257 in. hole)", 3.53:"  10-24/10-32 Tapped (.1389 in. hole)", 4.79:"  1/4-20 Tapped (.1887 in. hole)",0.00:" ",0.00:"Heat-Set Inserts",3.98:"  M3 Heat-Set (4mm hole)", 4.10:"  M3 Heat-Set (4.1mm hole)", 4.80:"  M3 Heat-Set (4.8mm hole)", 5.60:"  M4 Heat-Set (5.6mm hole)", 5.70:"  M4 Heat-Set (5.7mm hole)", 6.40:"  M5 Heat-Set (6.4mm hole)", 6.50:"  M5 Heat-Set (6.5mm hole)", 8.00:"  M6 Heat-Set (8mm hole)", 8.10:"  M6 Heat-Set (8.1mm hole)", 3.99:"  4-40 Heat-Set (0.157 in. hole)", 4.03:"  4-40 Heat-Set (0.159 in. hole)", 4.76:"  6-32 Heat-Set (0.1875 in. hole)",  4.85:"  6-32 Heat-Set (0.191 in. hole)", 5.61:"  8-32 Heat-Set (0.221 in. hole)", 5.74:"  8-32 Heat-Set (0.226 in. hole)", 6.41:"  10-24/10-32 Heat-Set (0.252 in. hole)", 6.51:"  10-24/10-32 Heat-Set (0.256 in. hole)", 8.01:"  1/4-20 Heat-Set (0.315 in. hole)", 8.11:"  1/4-20 Heat-Set (0.319 in. hole)"]


/* [Faceplate Options] */

// Faceplate only, with no cage - force height to a given count of units and completely disable the generation of a cage, leaving other options such as faceplate modifications intact. - WARNING: This setting overrides ALL cage generation options, AND requires a large enough print volume to print the faceplate at the full selected size as splitting the faceplate is not supported.
faceplate_only = 0.0; // [0.0:"No, generate cage normally (DEFAULT)",0.50:"0.5U",1.00:"1.0U",1.50:"1.5U",2.00:"2.0U",2.50:"2.5U",3.00:"3.0U",3.50:"3.5U",4.00:"4.0U",4.50:"4.5U",5.00:"5.0U"]

// Reduce a cageless faceplate to 2D for export to a supported flat-file format for cutting or engraving. - NOTE: This option is only available when "faceplate_only" is set to a fixed unit height so that CageMaker PRCG generates a faceplate without a cage.
reduce_faceplate_to_2d = false;

// Narrow-edge centered mounting holes, for subrack support - adds a CENTERED hole 10mm deep on either side of the cage proper along its narrower sides (usually left/right), aligned with the edge of the cage opening and surrounded with an ear that protrudes into the opening. - NOTE: This setting should match the recommended hole diameter of the bolt or insert to be used, or use the next smaller diameter.
narrow_edge_centered_holes = 0.00; // [0.00:"None/Disabled - DEFAULT",0.00:" ",0.00:"Clearance Holes",3.15:"  M3 Clearance (3.15mm hole)", 4.20:"  M4 Clearance (4.2mm hole)", 5.25:"  M5 Clearance (5.25mm hole)", 6.30:"  M6 Clearance (6.3mm hole)", 2.95:"  4-40 Clearance (.1160 in. hole)", 3.66:"  6-32 Clearance (.144 in. hole)",4.31:"  8-32 Clearance (.1695 in. hole)", 4.98:"  10-24/10-32 Clearance (.1960 in. hole)", 6.53:"  1/4-20 Clearance (.257 in. hole)", 0.00:" ",0.00:"Tapped Holes",2.60:"  M3 Tapped (2.6mm hole)", 3.50:"  M4 Tapped (3.5mm hole)", 4.40:"  M5 Tapped (4.4mm hole)", 5.00:"  M6 Tapped (5.0mm hole)", 2.07:"  4-40 Tapped (0.0813 in. hole)", 2.53:"  6-32 Tapped (.0997 in. hole)", 3.19:"  8-32 Tapped (.1257 in. hole)", 3.53:"  10-24/10-32 Tapped (.1389 in. hole)", 4.79:"  1/4-20 Tapped (.1887 in. hole)",0.00:" ",0.00:"Heat-Set Inserts",3.98:"  M3 Heat-Set (4mm hole)", 4.10:"  M3 Heat-Set (4.1mm hole)", 4.80:"  M3 Heat-Set (4.8mm hole)", 5.60:"  M4 Heat-Set (5.6mm hole)", 5.70:"  M4 Heat-Set (5.7mm hole)", 6.40:"  M5 Heat-Set (6.4mm hole)", 6.50:"  M5 Heat-Set (6.5mm hole)", 8.00:"  M6 Heat-Set (8mm hole)", 8.10:"  M6 Heat-Set (8.1mm hole)", 3.99:"  4-40 Heat-Set (0.157 in. hole)", 4.03:"  4-40 Heat-Set (0.159 in. hole)", 4.76:"  6-32 Heat-Set (0.1875 in. hole)",  4.85:"  6-32 Heat-Set (0.191 in. hole)", 5.61:"  8-32 Heat-Set (0.221 in. hole)", 5.74:"  8-32 Heat-Set (0.226 in. hole)", 6.41:"  10-24/10-32 Heat-Set (0.252 in. hole)", 6.51:"  10-24/10-32 Heat-Set (0.256 in. hole)", 8.01:"  1/4-20 Heat-Set (0.315 in. hole)", 8.11:"  1/4-20 Heat-Set (0.319 in. hole)"]

// Corner mounting holes, for subrack support - adds a hole 10mm deep into each corner of the cage proper, aligned with the edge of the cage opening and surrounded with an ear that protrudes into the opening. - NOTE: This setting should match the recommended hole diameter of the bolt or insert to be used, or use the next smaller diameter.
edge_corner_holes = 0.00; // [0.00:"None/Disabled - DEFAULT",0.00:" ",0.00:"Clearance Holes",3.15:"  M3 Clearance (3.15mm hole)", 4.20:"  M4 Clearance (4.2mm hole)", 5.25:"  M5 Clearance (5.25mm hole)", 6.30:"  M6 Clearance (6.3mm hole)", 2.95:"  4-40 Clearance (.1160 in. hole)", 3.66:"  6-32 Clearance (.144 in. hole)",4.31:"  8-32 Clearance (.1695 in. hole)", 4.98:"  10-24/10-32 Clearance (.1960 in. hole)", 6.53:"  1/4-20 Clearance (.257 in. hole)", 0.00:" ",0.00:"Tapped Holes",2.60:"  M3 Tapped (2.6mm hole)", 3.50:"  M4 Tapped (3.5mm hole)", 4.40:"  M5 Tapped (4.4mm hole)", 5.00:"  M6 Tapped (5.0mm hole)", 2.07:"  4-40 Tapped (0.0813 in. hole)", 2.53:"  6-32 Tapped (.0997 in. hole)", 3.19:"  8-32 Tapped (.1257 in. hole)", 3.53:"  10-24/10-32 Tapped (.1389 in. hole)", 4.79:"  1/4-20 Tapped (.1887 in. hole)",0.00:" ",0.00:"Heat-Set Inserts",3.98:"  M3 Heat-Set (4mm hole)", 4.10:"  M3 Heat-Set (4.1mm hole)", 4.80:"  M3 Heat-Set (4.8mm hole)", 5.60:"  M4 Heat-Set (5.6mm hole)", 5.70:"  M4 Heat-Set (5.7mm hole)", 6.40:"  M5 Heat-Set (6.4mm hole)", 6.50:"  M5 Heat-Set (6.5mm hole)", 8.00:"  M6 Heat-Set (8mm hole)", 8.10:"  M6 Heat-Set (8.1mm hole)", 3.99:"  4-40 Heat-Set (0.157 in. hole)", 4.03:"  4-40 Heat-Set (0.159 in. hole)", 4.76:"  6-32 Heat-Set (0.1875 in. hole)",  4.85:"  6-32 Heat-Set (0.191 in. hole)", 5.61:"  8-32 Heat-Set (0.221 in. hole)", 5.74:"  8-32 Heat-Set (0.226 in. hole)", 6.41:"  10-24/10-32 Heat-Set (0.252 in. hole)", 6.51:"  10-24/10-32 Heat-Set (0.256 in. hole)", 8.01:"  1/4-20 Heat-Set (0.315 in. hole)", 8.11:"  1/4-20 Heat-Set (0.319 in. hole)"]

// Radius of rounded corners of cage opening in faceplate (in mm) - by default, the cutout of the faceplate for the device to insert into the cage has squared corners for a rectangular device front. This setting rounds the corners. - NOTE: Use a radius gauge on the device in question in order to accurately configure this setting - a badly chosen value could make the device not fit into the cage. - NOTE: Enabling either the "extra support" or "make buttom a shelf" option is probably a good idea when using a non-zero setting here.
faceplate_rounded_corners = 0.0; // [0.0:0.5:50]

// Reinforce faceplate by adding right-angle bracing to the back of the faceplate along its top and bottom edges. - WARNING: Although this is designed to clear reasonably EIA-compliant rack rails, enabling this setting may cause interference issues that require modification.
reinforce_faceplate = false;

// Add a 1mm retention lip around the front opening and recess the device 1mm farther into the cage. This will help capture the device and reduce accidental removal. - NOTE: the device_clearance setting also applies to this retention lip, and too large of a clearance setting may make this ineffective.
add_retention_lip = false;


/* [Faceplate Ventilation Options] */

// Faceplate ventillation hole/grid pattern - creates ventillation holes in a given pattern on the faceplate. - WARNING: Enabling this option will weaken the cage, may require signifiantly longer time to generate the cage, and can dramatically increase print time. NOTE: The cage proper and any active modifications will selectively remove the ventillation holes as required.
faceplate_vent_hole_pattern = "None"; // ["None":"None - DEFAULT","Hex":"Hexagonal Grid","Round":"Round Holes","Checkerboard":"Square Holes In Checkerboard Pattern","Grid":"Square Holes in a Grid Pattern","Isometric":"Isometric/Diamond Grid","Triangle":"Triangle/Isometric Grid","Octagon":"Octagonal Holes"]

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

// Make the bottom a shelf - Turn the entire "bottom" of the cage into a solid shelf instead of cutting most of it out for ventilation. This can be useful for some devices that don't have flat bottoms.
make_bottom_a_shelf = false;

// Make the cage sides solid - Turn the sides of the cage into solid walls instead of cutting most of them out for ventilation. Couple this with the "make bottom a shelf" option for extra rigidity.
make_sides_solid = false;

// Make the top solid - Turn the entire "top" of the cage into a solid shelf instead of cutting most of it out for ventilation. Combine with making bottom and sides shelves to create a solid cage, which is terrible for ventilation but prints much faster and requires very little support.
make_top_solid = false;


// Additional top/bottom support - divides upper/lower space and adds center reinforcing to help reduce cantilevering, especially on deep devices.
extra_support = false; 


/* [Cage TOP and BOTTOM Ventilation Options] */

// Cage TOP & BOTTOM ventillation hole/grid pattern - creates ventillation holes in a given pattern on the faceplate. - NOTE: Enabling "make bottom a shelf" overrides these settings for the bottom. - WARNING: Enabling this option may require signifiantly longer time to generate the cage, and can dramatically increase print time.
cage_top_bottom_vent_hole_pattern = "None"; // ["None":"None - DEFAULT","Hex":"Hexagonal Grid","Round":"Round Holes","Checkerboard":"Square Holes In Checkerboard Pattern","Grid":"Square Holes in a Grid Pattern","Isometric":"Isometric/Diamond Grid","Triangle":"Triangle/Isometric Grid","Octagon":"Octagonal Holes"]

// Cage TOP & BOTTOM vent hole size (outer diameter for hexagonal holes), in mm - NOTE: increasing this value creates better ventilation but reduces strength.
cage_top_bottom_vent_hole_size = 12.0; // [1.0:0.25:25.0]

// Cage TOP & BOTTOM vent-hole wall thickness, in mm - NOTE: Decreasing this value creates better ventilation but reduces strength. - WARNING: Changing this value will recalculate the entire grid and may require changing offsets below.
cage_top_bottom_vent_wall_thickness = 2.0; // [1.0:0.25:15.0]

// Cage TOP & BOTTOM grid horizontal offset - moves grid left (negative values) or right (positive values) for fine-tuning alignment of holes, hole edges, etc.
cage_top_bottom_vent_grid_horizontal_offset = 0.0; // [-25:0.25:25]

// Cage TOP & BOTTOM grid vertical offset - moves grid up (negative values) or down (positive values) for fine-tuning alignment of holes, hole edges, etc.
cage_top_bottom_vent_grid_vertical_offset = 0.0; // [-25:0.25:25]

// Cage TOP & BOTTOM grid angle - rotates the grid relative to its center.
cage_top_bottom_vent_grid_angle = 0.0; // [-180:5:180]


/* [Cage LEFT and RIGHT SIDES Ventilation Options] */

// Cage SIDES ventillation hole/grid pattern - creates ventillation holes in a given pattern on the faceplate. - NOTE: Enabling "make sides solid" overrides these settings. - WARNING: Enabling this option may require signifiantly longer time to generate the cage, and can dramatically increase print time.
cage_sides_vent_hole_pattern = "None"; // ["None":"None - DEFAULT","Hex":"Hexagonal Grid","Round":"Round Holes","Checkerboard":"Square Holes In Checkerboard Pattern","Grid":"Square Holes in a Grid Pattern","Isometric":"Isometric/Diamond Grid","Triangle":"Triangle/Isometric Grid","Octagon":"Octagonal Holes"]

// Cage SIDES vent hole size (outer diameter for hexagonal holes), in mm - NOTE: increasing this value creates better ventilation but reduces strength.
cage_sides_vent_hole_size = 12.0; // [1.0:0.25:25.0]

// Cage SIDES vent-hole wall thickness, in mm - NOTE: Decreasing this value creates better ventilation but reduces strength. - WARNING: Changing this value will recalculate the entire grid and may require changing offsets below.
cage_sides_vent_wall_thickness = 2.0; // [1.0:0.25:15.0]

// Cage SIDES grid horizontal offset - moves grid left (negative values) or right (positive values) for fine-tuning alignment of holes, hole edges, etc.
cage_sides_vent_grid_horizontal_offset = 0.0; // [-25:0.25:25]

// Cage SIDES grid vertical offset - moves grid up (negative values) or down (positive values) for fine-tuning alignment of holes, hole edges, etc.
cage_sides_vent_grid_vertical_offset = 0.0; // [-25:0.25:25]

// Cage SIDES grid angle - rotates the grid relative to its center.
cage_sides_vent_grid_angle = 0.0; // [-180:5:180]


/* [Rear Support Options] */

// Generate a rear support sub-cage that slips into the backside of the front-mounted device cage and mounts to the rack's rear rails, with the idea of providing additional support and increased resistance to cantilevering for larger/heavier devices. - WARNING: Requires a large enough printer to print the complete unit as a single piece, as the rear support cannot be split into parts, and as a result, the "split cage into two halves" and ""print cage separately" settings both disable this setting.
generate_rear_support_cage = false;

// Depth of rack, front-to-back (in mm) - NOTE: Set this to equal the rack's front-to-back depth from the front rack rail's mounting surface to the rear rack rail's mounting surface, outside-to-outside.
rack_total_depth = 254; // [0:1:500]

// Overlap distance for rear support (in mm) - This is the distance the rear support will overlap the back of the cage. Longer overlap creates more support stability but will block side ventilation.
rear_support_overlap = 25; // [0:1:500]

/* [Additional Faceplate Modifications] */

// CENTERED Mod Type - add a new connector, port, or opening of some form onto the faceplate. - IMPORTANT: This option is only available when cage generation is disabled by setting "faceplate only" to a height value. Make sure the height setting is tall enough to clear. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
centered_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

// CENTERED mod grid column count - how many copies of the above modification will be placed into a row on the faceplate? - IMPORTANT: This option is only available when cage generation is disabled by setting "faceplate only" to a height value. Make sure the height setting is tall enough to clear. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
centered_mod_grid_columns = 1; // [1:12]

// CENTERED mod grid row count - how many rows of the above modification will be placed onto the faceplate? - IMPORTANT: This option is only available when cage generation is disabled by setting "faceplate only" to a height value. Make sure the height setting is tall enough to clear. - NOTE: Be aware of fitment, as if there isn't sufficient room for the modification to fit on the faceplate, CageMaker will remove it.
centered_mod_grid_rows = 1; // [1:4]

// LEFT Side Mod Type - add a new connector, port, or opening of some form onto the faceplate. - NOTE: Be aware of fitment, as the device cage takes priority over any modifications selected here and if there isn't sufficient room for the modification CageMaker will remove it.
left_side_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

// LEFT Side mod grid column count - how many copies of the above modification will be placed into a row on the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
left_side_mod_grid_columns = 1; // [1:12]

// LEFT Side mod grid row count - how many rows of the above modification will be placed onto the faceplate? - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
left_side_mod_grid_rows = 1; // [1:4]

// LEFT Side Mod Offset Distance (in mm) - shift the modification above to one side from horizontal center. Positive and negative values are allowed. - NOTE: Set this to zero and CageMaker will attempt to automatically position the modification if it'll fit. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
left_side_mod_horizontal_offset = 0.00; // [-240.00:1:240.0]

// LEFT Side Mod Vertical Offset Distance (in mm) - shift the modification above to one side from vertical center. Positive and negative values are allowed. - WARNING: CageMaker will enforce safe boundaries so as to not push a modification into mounting space, the actual cage itself, or off the edge of the faceplate.
left_side_mod_vertical_offset = 0.00; // [-75.00:1:75.0]

// RIGHT Side Mod Type - add a new connector, port, or opening of some form onto the faceplate. - NOTE: Be aware of fitment, as the device cage takes priority over any modifications selected here and if there isn't sufficient room for the modification CageMaker will remove it.
right_side_mod_type = "None"; // ["None":"None","None":" ","None":"Universal Receptacles","Keystone":"  Keystone Connector","DSeries":"  Neutrik D-Series Connector","None":" ","None":"Custom Cutouts","CustomA":"  Custom Cutout A","CustomB":"  Custom Cutout B","CustomC":"  Custom Cutout C","None":" ","None":"Cooling Fans","30mmFan":"  30mm Fan","40mmFan":"  40mm Fan","60mmFan":"  60mm Fan","80mmFan":"  80mm Fan","92mmFan":"  92mm Fan","120mmFan":"  120mm Fan","140mmFan":"  140mm Fan","None":" ","None":"Round Holes For Buttons, Lights, etc.","10mmButton":"  10mm Hole","12mmButton":"  12mm Hole","16mmButton":"  16mm Hole","19mmButton":"  19mm Hole","24mmButton":"  24mm Hole","None":" ","None":"VESA FDMI Mounting Bolt Patterns","VESAB":"  VESA FDMI MIS-B - 20x50mm","VESAC":"  VESA FDMI MIS-C - 35x75mm","VESAD75":"  VESA FDMI MIS-D - 50/75x75mm","VESAD100":"  VESA FDMI MIS-D - 50/100x100mm","VESAE50":"  VESA FDMI MIS-E - 50x200mm","VESAE100":"  VESA FDMI MIS-E - 100x200mm","VESAF200":"  VESA FDMI MIS-F - 200x200mm","None":" ","None":"Fractional-DIN Cutouts","DIN1/32H":"  1/32-DIN Cutout - Horizontal","DIN1/16":"  1/16-DIN Cutout","DIN1/8H":"  1/8-DIN Cutout - Horizontal","DIN1/8V":"  1/8-DIN Cutout - Vertical","DIN1/4":"  1/4-DIN Cutout","None":" ","None":"IEC-60309 Industrial Power Inlets","16A3":"  16A 3-Wire Power Inlet","16A4":"  16A 4-7 Wire Power Inlet","32A3":"  32A 3-Wire Power Inlet","32A4":"  32A 4-7 Wire Power Inlet","None":" ","None":"IEC AC Mains Power Sockets/Outlets","C13H":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C13V":"  C13/C14 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C14H":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C14V":"  C13/C14 IEC Power Socket/Outlet (Screw Mount) - Vertical","C19H":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Horizontal","C19V":"  C19/C20 IEC Power Socket/Outlet (Snap-In Mount) - Vertical","C20H":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Horizontal","C20V":"  C19/C20 IEC Power Socket/Outlet (Screw Mount) - Vertical"]

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


/* [Rarely-Changed Options] */

// Clearance in mm - lower values make for a tighter fit, but remember that 3D printers have dimensional tolerances on their prints.
device_clearance = 0.50; // [-5.00:0.05:5.00]

// Rounded faceplate corners
faceplate_radius = 5; // [0.1:"No - sharp corners",5:"Rounded corners - DEFAULT"]

// Rounded side/top/bottom cutout corners
cutout_radius = 5; // [0.1:"No - sharp corners",5:"Rounded corners - DEFAULT"]
//,10:"More rounded corners",15:"Even more rounded corners",20:"Really rounded corners"]

// Cage snap-fit dimensional tolerance (in mm) for separately printed cages - Adjusts the socket into which the cage proper will snap into the back of the faceplate, in order to compensate for dimensional irregularities on the printer. - NOTE: When properly set, the cage should be a pressure fit but not so tight that trying to insert it distorts the faceplate.
snap_fit_tolerance = 0.50; // [-1.0:0.05:2.5]

// Detail level of all curved/rounded surfaces, and a higher value is better but can be MUCH slower - NOTE: default is 36, and anything over 100 is not advised. This should not normally need to be changed.
this_fn = 36; // [0:12:360]



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



/* [Hidden] */
// This module is only here to stop the customizer from converting the following globals into changeable options.
module block_customizer()
{
    // Yep, that's all this is for.
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



// Time for some global variables that don't need to be configurable options...
//
// By the way, this script has a lot of kludges in it when it comes to variables.
// They exist for a simple reason: OpenSCAD effectively treats almost all
// non-special user-defined variables as constants, so once they're declared
// into existence and assigned a value they usually cannot be reassigned
// or modified. So, there's a lot of working around this and using secondary
// variables to handle what would be simple value changes in other more
// fleshed-out languages.

// Preconfigured device options list - this sets device dimensions when a device is selected.
preconfg_options = [
  // Routers/Gateways
  ["M-CRS309-1G-8S+IN", 191, 272, 44, 12, 0, 0],
  ["M-HEX", 89, 113, 28, 12, 0, 0],
  ["M-HEXPOE", 137, 114, 29, 12, 0, 0],
  ["M-RB4011IGS", 120, 228, 30, 12, 0, 0],
  ["S-TZ-SMALL", 135, 190, 35, 12, 0, 0],
  ["S-TZ-LARGE", 150, 225, 35, 12, 0, 0],
  ["T-ER605", 101, 158, 25, 12, 0, 0],
  ["T-ER7206", 131, 226, 35, 8, 0, 0],
  ["U-EDGE4", 137, 229, 32, 12, 0, 0],
  ["U-EDGEXSFP", 75, 142, 23, 12, 0, 0],
  ["U-EXPRESS7", 117, 117, 43, 12, 0, 1],
  ["U-UCG-FIBER", 128, 213, 30, 10, 0, 1],
  ["U-UCG-MAX", 128, 142, 30, 10, 0, 1],
  ["U-UISP-R", 95, 211, 29, 12, 0, 0],
//  ["NAME", depth, width, height, 12, 0, 0],

  // 5-Port Switches
  ["D-DES-105", 98, 100, 28, 12, -0.875, 0],
  ["D-DGS-105", 85, 91, 23, 12, -0.875, 0],
  ["D-DGS-105GL", 64, 100, 24, 12, -0.875, 0],
  ["D-DMS-105", 82, 101, 28, 12, -0.875, 0],
  ["N-GS105", 94, 104, 28, 12, -0.875, 0],
  ["N-GS105Ev2", 94, 100, 27, 12, -0.875, 0],
  ["N-GS105PE", 158, 100, 27, 12, -0.875, 0],
  ["N-GS305", 94, 101, 29, 12, -0.875, 0],
  ["L-SE3005v1", 75, 121, 26, 12, -0.875, 0],
  ["L-SE3005v2", 88, 120, 26, 12, -0.875, 0],
  ["T-ES206X-M2", 101, 158, 26, 12, 0, 0],
  ["T-LS105G", 99, 100, 25, 12, -0.875, 0],
  ["T-LS1005G", 72, 90, 23, 12, -0.875, 0],
  ["T-SG105S", 98, 100, 25, 12, -0.875, 0],
//  ["NAME", depth, width, height, 12, 0, 0],
  
  // 8-Port Switches
  ["C-GS108", 78, 138, 25, 12, 0, 0],
  ["D-DES-108", 102, 162, 28, 12, 0, 0],
  ["D-DGS-108", 85, 139, 23, 12, 0, 0],
  ["D-DGS-108GL", 67, 140, 26, 12, 0, 0],
  ["D-DMS-108", 82, 145, 28, 12, 0, 0],
  ["L-SE3008v1", 85, 154, 26, 12, 0, 0],
  ["L-SE3008v2", 90, 168, 26, 12, 0, 0],
  ["N-GS108", 94, 158, 27, 12, 0, 0],
  ["N-GS108Ev3", 158, 101, 29, 12, 0, 0],
  ["N-GS308LP", 102, 236, 27, 12, 0, 0],
  ["N-GS308", 101, 158, 29, 12, 0, 0],
  ["T-ES210X-M2", 126, 209, 26, 12, 0, 0],
  ["T-LS108G", 99, 158, 25, 12, 0, 0],
  ["T-LS1008G", 67, 127, 23, 12, 0, 0],
  ["T-TEG-S381", 85, 155, 26, 12, 0, 0],
  ["T-TEG-S82g", 97, 150, 28, 12, 0, 0],
  ["U-UISP-S", 95, 211, 29, 12, 0, 0],
  ["U-US-8-150W", 204, 235, 43, 12, 0, 0],
  ["Z-GS1100-10HP", 104, 250, 27, 12, -0.875, 0],
//  ["NAME", depth, width, height, 12, 0, 0],
  
  // 16-Port Switches
  ["Z-GS1100-16", 133, 215, 42, 12, -0.875, 0],
//  ["NAME", depth, width, height, 12, 0, 0],
  
  // SFP Switches
  ["M-CRS305-1G-4S+IN", 141, 115, 28, 12, 0, 0],
  ["U-UISP-S+", 170, 211, 44, 12, 0, 0],
  ["T-TEG-S5", 110, 160, 26, 12, 0, 0],
//  ["NAME", depth, width, height, 12, 0, 0],
  
  // Small Form Factor PCs
  ["A-MACMINI", 127, 127, 50, 12, 0, 1],
  ["A-MACSTUDIO", 197, 197, 95, 12, 0, 1],
  ["D-USFF", 238, 239, 66, 14, 2, 0],
  ["D-MICRO", 178, 183, 36, 8, -0.875, 0],
  ["H-GSERIES", 175, 177, 35, 8, -0.875, 0],
  ["H-Z2G9", 218, 211, 69, 10, 0, 0],
  ["L-TCTINY", 183, 179, 37, 8, -0.875, 0],
  ["M-MS-01", 189, 196, 48, 12, 0, 0],
  ["M-MS-A1", 189, 187, 48, 12, 0, 0],
  ["I-NUC-PRO", 145, 200, 35, 12, 0, 0],
  ["I-NUC-SLIM", 112, 117, 37, 12, 0, 0],
  ["I-NUC-TALL", 112, 117, 54, 12, 0, 0],
//  ["NAME", depth, width, height, 12, 0, 0],
 
  // Miscellaneous
  ["BAY-2.5-H", 101, 70, 19, 12, 0, 0],
  ["BAY-2.5-V", 101, 19, 70, 12, 0, 0],
  ["BAY-2.5H-H", 101, 70, 10, 12, 0, 0],
  ["BAY-2.5H-V", 101, 10, 70, 12, 0, 0],
  ["BAY-3.5-H", 147, 102, 26, 12, 0, 0],
  ["BAY-3.5-V", 147, 26, 102, 12, 0, 0],
  ["BAY-E1.S-9.5-H", 119, 34, 10, 12, 0, 0],
  ["BAY-E1.S-9.5-V", 119, 10, 34, 12, 0, 0],
  ["BAY-E1.S-15-H", 119, 34, 15, 12, 0, 0],
  ["BAY-E1.S-15-V", 119, 15, 34, 12, 0, 0],
  ["BAY-E1.S-25-H", 119, 34, 25, 12, 0, 0],
  ["BAY-E1.S-25-V", 119, 25, 34, 12, 0, 0],
  ["BAY-E1.L-9.5-H", 319, 39, 10, 12, 0, 0],
  ["BAY-E1.L-9.5-V", 319, 10, 39, 12, 0, 0],
  ["BAY-E1.L-18-H", 319, 39, 18, 12, 0, 0],
  ["BAY-E1.L-18-V", 319, 18, 39, 12, 0, 0],
  ["BAY-E3.S-H", 113, 76, 8, 12, 0, 0],
  ["BAY-E3.S-V", 113, 8, 76, 12, 0, 0],
  ["BAY-E3.S-2T-H", 113, 76, 17, 12, 0, 0],
  ["BAY-E3.S-2T-V", 113, 17, 76, 12, 0, 0],  
  ["BAY-E3.L-H", 142, 76, 8, 12, 0, 0],
  ["BAY-E3.L-V", 142, 8, 76, 12, 0, 0],
  ["BAY-E3.L-2T-H", 142, 76, 17, 12, 0, 0],
  ["BAY-E3.L-2T-V", 142, 17, 76, 12, 0, 0],
//  ["NAME", depth, width, height, 12, 0, 0],


//  ["NAME", depth, width, height, 12, 0, 0],
];
// For adding new equipment options, the format is:
//  ["model#", depth, width, height, default_base_size, default_heavy_device, force_solid_bottom]
// Where:
//  "model#" as selected in the preconfigured_device option

// Set the dimensions, cage's base size, and heavy_device setting to the selected preconfigured device info if a device is selected. Otherwise, use the manual settings.
use_preconfig = (preconfigured_device != "");
device_depth = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][1] : manual_device_depth;
device_width = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][2] : manual_device_width;
device_height = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][3] : manual_device_height;
support_cage_base_size = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][4] : manual_support_cage_base_size;
heavy_device = use_preconfig ? preconfg_options[search([preconfigured_device], preconfg_options)[0]][5] : manual_heavy_device;
// Making the bottom a shelf is forced if required but optional otherwise.
make_bottom_solid = use_preconfig ? (preconfg_options[search([preconfigured_device], preconfg_options)[0]][6] == 0 ? make_bottom_a_shelf : 1) : make_bottom_a_shelf;

// Rack geometry - this sets the "unit" height and mounting hole pattern based on the mode selected by the rack_geometry setting. By default, the size of a single "unit" of rack space is set to 1.75" or 44.45mm, and mounting hole pattern is set to 6.35, 22.225, and 38.1mm relative to the "top" edge of each "unit," for EIA-310-D standard racks.
rack_geometry_options = [
  ["EIA-310", 44.45, [6.35, 22.225, 38.1], 5.25],
  ["EIA-310-LH", 44.45, [6.35, 22.225, 38.1], 6.53],
  ["EIA-310-1T", 44.45, [6.35], 5.25],
  ["EIA-310-1C", 44.45, [22.225], 5.25],
  ["EIA-310-2", 44.45, [6.35, 38.1], 5.25],
  ["HALF-EIA-310", 22.225, [3.175, 11.1125, 19.05], 3.15],
  ["20mm", 20.00, [5.00, 15.00], 5.25],
  ["25mm", 25.00, [6.25, 18.75], 5.25],
  ["30mm", 30.00, [7.5, 22.5], 5.25],
  ["40mm", 40.00, [10.00, 30.00], 5.25],
  ["50mm", 50.00, [12.50, 37.50], 5.25],
];
// For adding new custom entries, the format is:
//  ["Name", unit_height, [first_hole, second_hole, third_hole, etc.], mounting_hole_diameter]
// Where:
//   "Name" as selected in the rack_geometry variable
//   unit_height is what the name implies, what the rack system considers one "unit" of height
//   first_hole, second-hole, etc. are the mounting hole spacing in mm from the topmost edge of the unit
//   mounting_hole_diameter is also what the name implies.
unit_height_in_mm = rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][1];
mounting_hole_pattern = rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][2];
mounting_hole_diameter = rack_geometry_options[search([rack_geometry], rack_geometry_options)[0]][3];

// Support structure radius in mm, for rounded corners on the backside of the mount - NOTE: This should not normally need to be changed, and automatically adjusts to changes in wall thickness.
support_radius = 1 + (heavy_device * 0.5);

// Side/top/bottom cutout edge thickness in mm (higher number makes the cutout smaller) - NOTE: This should not normally need to be changed.
cutout_edge = 5;

// Support cage parameters in mm. The first sets the base size of the support structure on the default 4mm thickness setting. The second multiplies the heavy_device setting to expand the support structure. A base size of 12 and a multiplier of 3 makes a 12mm support structure on default thickness and 18mm (12 base + (2 thickness * 3 multiplier)) on 6mm thickness.
//  UPDATE: The "support_cage_base_size" setting was moved to a Customizer option in version 0.6.
//support_cage_base_size = 12; // Default: 12
support_cage_heavy_device_multiplier = 3; // Default: 3
// CAUTION: Making the value of support_cage_base_size less than about 12 WILL weaken the structural integrity of the cage by reducing its cross-section. Values below 10 may ruin it completely, and below 8 will start to break things like printing the cage separately. The default values above (12 and 3) represent the best balance between minimal size for light devices and adequate strength across the heavy_device setting range.

// Plate thickness - default is 4mm, but the heavy_device setting adds to this. Increasing this base value makes everything thicker and stronger, but above around 8mm other settings (most critically, support_cage_base_size) have to be adjusted.
plate_thickness = 4 + heavy_device;



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



// And now the important bits: the actual rack cage generator code!



// Display an alert message
module check_console()
{
    // Work out where to display the warning, which will be "below" the cage's facelate.
    total_height_required = (faceplate_only == 0.0 ? (device_height + support_cage_base_size + (heavy_device * support_cage_heavy_device_multiplier)) : ((faceplate_only - 0.001) * unit_height_in_mm));
    units_required = (faceplate_only == 0.0 ? ((ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1)) : ((ceil((total_height_required * 2) / unit_height_in_mm)) / 2));

    // Draw the warning symbol triangle
    translate([0, 0 - ((units_required * unit_height_in_mm) / (((print_cage_separately) && (!split_cage_into_two_halves)) ? 0.95:2)) - 100, 3])
        color("red")
            linear_extrude(height=1, center=true)
                polygon(points=[[-40,0],[0, 80],[40,0],[-30,6],[0,70],[30,6]], paths=[[0,1,2],[3,4,5]]);

    // Stick an exclamation point into the triangle
    translate([-6, 0 - ((units_required * unit_height_in_mm) / (((print_cage_separately) && (!split_cage_into_two_halves)) ? 0.95:2)) - 68, 3])
        color("red")
            linear_extrude(height=1, center=true)
                text("!", halign="left", valign="center", size=35);

    // Add some text
    translate([0, 0 - ((units_required * unit_height_in_mm) / (((print_cage_separately) && (!split_cage_into_two_halves)) ? 0.95:2)) - 125, 3])
        color("red")
            linear_extrude(height=1, center=true)
                text("CHECK CONSOLE!", halign="center", size=20);   

    // Draw a backdrop plate behind it all
    translate([0, 0 - ((units_required * unit_height_in_mm) / (((print_cage_separately) && (!split_cage_into_two_halves)) ? 0.95:2)) - 74, 2])
        color("mistyrose")
            four_rounded_corner_plate(120, 260, 1, 5);
}



// Create a three-dimensional rectangular prism with two rounded corners
//(e.g., support frame)
module two_rounded_corner_plate(plate_height, plate_width, plate_thickness, corner_radius)
{
    linear_extrude(plate_thickness, center=false, twist=0, $fn=this_fn)
        hull()
        {
            translate([0 - (plate_width / 2) + corner_radius, 0 - (plate_height / 2) + corner_radius, 0])
                circle(r=corner_radius, $fn=this_fn);
            translate([0 - (plate_width / 2) + corner_radius, (plate_height / 2) - corner_radius, 0])
                circle(r=corner_radius, $fn=this_fn);
            translate([(plate_width / 2), 0 - (plate_height / 2), 0])
                circle(r=0.001, $fn=this_fn);
            translate([(plate_width / 2), (plate_height / 2), 0])
                circle(r=0.001, $fn=this_fn);
        }
}

// Create a three-dimensional rectangular prism with four rounded corners
// (e.g., faceplate)
module four_rounded_corner_plate(plate_height, plate_width, plate_thickness, corner_radius)
{
    linear_extrude(plate_thickness)
        offset(r=corner_radius, $fn=this_fn)
            offset(delta=-corner_radius)
                square([plate_width, plate_height], center=true);
}

// Create faceplate slotted screw hole
module faceplate_screw_hole_slot(xx, yy, zz)
{
    translate([xx, yy, zz])
        linear_extrude(10 + (heavy_device * support_cage_heavy_device_multiplier), center=false, twist=0, $fn=this_fn)
            hull()
            {
                translate([-2.5, 0, 0])
                    circle(d=mounting_hole_diameter, $fn=this_fn, false);
                translate([2.5, 0, 0])
                    circle(d=mounting_hole_diameter, $fn=this_fn, false);    
            }
}

// Create a blank faceplate of a given unit count in height. This module also
// adds screw holes (in EIA-310 standard spacing if selected), as well as right-
// angle mounting ears for bolting together partial-rack-width cages.
module create_blank_faceplate(desired_width, unit_height, safe_bolt_together_faceplate_ears)
{
    // Helper vars to reduce reduncancies in code.
    unit_height_mm = unit_height * unit_height_in_mm;
    half_unit_height_mm = unit_height_mm / 2;
    desired_width_mm = desired_width * 25.4;
    half_desired_width_mm = desired_width_mm / 2;

    // Determine the working area for the grid if we're creating one. Note that we will
    // avoid the top and bottom edges and mounting area behind both sides/ears.
    grid_height = unit_height_mm - (plate_thickness + heavy_device) * 2;
    grid_width = desired_width_mm - 32;

    // Determine whether we're working with a half-unit-multiple height.
    // We have two different ways we can do this.
    //half_unit = (round(unit_height) - unit_height == 0.5); // Integer subtraction
    half_unit = (unit_height % 1 == 0.5); // Modulus checking

    union()
    {
        difference()
        {
            // Create the faceplate itself, and optionally add ears to one or
            // both sides for 1/4-, 1/3-, or 1/2-width faceplates for a 19" rack
            // or 1/2-width for a 10" rack.
            if (safe_bolt_together_faceplate_ears == "None")
                union()
                {
                    four_rounded_corner_plate(unit_height_mm - 0.79, desired_width_mm, plate_thickness, faceplate_radius);
                
                    // Faceplate reinforcing
                    if (reinforce_faceplate)
                    {
                        translate([0, half_unit_height_mm - plate_thickness, 4.001 + heavy_device])
                            rotate([0, 90, 90])
                                two_rounded_corner_plate(desired_width_mm - 36, plate_thickness * 2, plate_thickness - 0.395, plate_thickness);

                        translate([0, 0 - half_unit_height_mm + 0.395, 0.001 + plate_thickness])
                            rotate([0, 90, 90])
                                two_rounded_corner_plate(desired_width_mm - 36, plate_thickness * 2, plate_thickness - 0.395, plate_thickness);
                    }
                }
            if (safe_bolt_together_faceplate_ears == "One Side")
                union()
                {
                    two_rounded_corner_plate(unit_height_mm - 0.79, desired_width_mm, plate_thickness, faceplate_radius);
                    translate([half_desired_width_mm - plate_thickness - (tap_or_heat_set_holes == 0.00 ? 0:2), 0, 10 + plate_thickness - 1])
                        rotate([0, 90, 0])
                            two_rounded_corner_plate(unit_height_mm  - 0.79, 21, plate_thickness + (tap_or_heat_set_holes == 0.00 ? 0:2), 5);
                    
                    // More faceplate reinforcing, for when one side has an ear.
                    if (reinforce_faceplate)
                    {
                        translate([8.99 + (heavy_device / 2), half_unit_height_mm - plate_thickness, 0.001 + plate_thickness])
                            rotate([0, 90, 90])
                                two_rounded_corner_plate(desired_width_mm - 22 + heavy_device, plate_thickness * 2, plate_thickness - 0.395, plate_thickness);

                        translate([8.99 + (heavy_device / 2), 0 - half_unit_height_mm + 0.395, 0.001 + plate_thickness])
                            rotate([0, 90, 90])
                                two_rounded_corner_plate(desired_width_mm - 22 + heavy_device, plate_thickness * 2, plate_thickness - 0.395, plate_thickness);
                    }
                }
            if (safe_bolt_together_faceplate_ears == "Both Sides")
                union()
                {
                    four_rounded_corner_plate(unit_height_mm - 0.79, desired_width_mm, plate_thickness, 0.001);
                    translate([half_desired_width_mm - plate_thickness - (tap_or_heat_set_holes == 0.00 ? 0:2), 0,  10 + plate_thickness - 1])
                        rotate([0, 90, 0])
                            two_rounded_corner_plate(unit_height_mm - 0.79, 21, plate_thickness + (tap_or_heat_set_holes == 0.00 ? 0:2), 5);
                    translate([0 - half_desired_width_mm, 0,  10 + plate_thickness - 1])
                        rotate([0, 90, 0])
                            two_rounded_corner_plate(unit_height_mm - 0.79, 21, plate_thickness + (tap_or_heat_set_holes == 0.00 ? 0:2), 5);
                    
                    // Even more faceplate reinforcing, for ears on both sides
                    if (reinforce_faceplate)
                    {
                        translate([0.01, half_unit_height_mm - plate_thickness, 0.001 + plate_thickness])
                            rotate([0, 90, 90])
                                two_rounded_corner_plate(desired_width_mm - 0.02, plate_thickness * 2, plate_thickness - 0.395, 1);
                        
                        translate([0.01, 0 - half_unit_height_mm + 0.395, 4.001 + heavy_device])
                            rotate([0, 90, 90])
                                two_rounded_corner_plate(desired_width_mm - 0.02, plate_thickness * 2, plate_thickness- 0.395, 1);
                    }
                }

            // Faceplate screw slots - by default these are set to EIA-310 standard 
            // 1/2-5/8-5/8 center spacing, sized for 10-24/M5 screws.
            // 
            // If we're not doing only the top/bottom holes, populate every hole.
            if (!top_and_bottom_holes_only)
            {
                for (unit_number = [0:unit_height])
                {
                    if (safe_bolt_together_faceplate_ears != "Both Sides")
                        for (y = mounting_hole_pattern)
                            faceplate_screw_hole_slot(0 - half_desired_width_mm + 8, (unit_number * unit_height_in_mm) - (unit_height_mm / 2) + y, -1);
                    else
                        for (y = mounting_hole_pattern)
                        {
                            translate([0 - half_desired_width_mm - 11, (unit_number * unit_height_in_mm) - (unit_height_mm / 2) + y, 10 + plate_thickness])
                                rotate([0, 90, 0])
                                    linear_extrude(22, center=false, twist=0, $fn=this_fn)
                                        // Heat-set threaded inserts will have larger hole diameters to clear the insert, so scale the holes accordingly as required.
                                        if (tap_or_heat_set_holes == 0.00)
                                            circle(d=5.5, $fn=this_fn, false);
                                        else
                                            circle(d=tap_or_heat_set_holes, $fn=this_fn, false);

                            // Optionally, add alignment pin holes if the option is enabled.
                            if (add_alignment_pin_holes)
                                alignment_pin_hole(0 - half_desired_width_mm + 2.5, (unit_number * unit_height_in_mm) - (unit_height_mm / 2) + y, 2 + (heavy_device / 2));
                        }

                    if (safe_bolt_together_faceplate_ears == "None")
                        for (y = mounting_hole_pattern)
                            faceplate_screw_hole_slot(half_desired_width_mm - 8, (unit_number * unit_height_in_mm) - (unit_height_mm / 2) + y, -1);
                    else
                        for (y = mounting_hole_pattern)
                        {
                            translate([half_desired_width_mm - 11, (unit_number * unit_height_in_mm) - (unit_height_mm / 2) + y, 10 + plate_thickness])
                                rotate([0, 90, 0])
                                    linear_extrude(22, center=false, twist=0, $fn=this_fn)
                                        if (tap_or_heat_set_holes == 0.00)
                                            circle(d=5.5, $fn=this_fn, false);
                                        else
                                            circle(d=tap_or_heat_set_holes, $fn=this_fn, false);

                        // Optionally, add alignment pin holes if the option is enabled.
                        if (add_alignment_pin_holes)
                            alignment_pin_hole(half_desired_width_mm - 2.5, (unit_number * unit_height_in_mm) - (unit_height_mm / 2) + y, 2 + (heavy_device / 2));
                        }
                }
            }
            else
            {
                // We're only doing top/bottom holes, so let's work out where those go.
                if (safe_bolt_together_faceplate_ears == "None")
                {
                    // Top hole is pretty straigthforward: unit zero's first hole pattern entry.
                    faceplate_screw_hole_slot(0 - half_desired_width_mm + 8, 0 - (unit_height_mm / 2) + mounting_hole_pattern[0], -1);
                    faceplate_screw_hole_slot(half_desired_width_mm - 8, 0 - (unit_height_mm / 2) + mounting_hole_pattern[0], -1);

                    // Bottom hole is a little more complicated. We deduce the last
                    // mounting hole for the last unit and populate that only. When 
                    // half-units are enabled, we back up to the top of the half unit 
                    // so we're not trying to put holes in weird/nonexistent places.
                    faceplate_screw_hole_slot(0 - half_desired_width_mm + 8, ((round(unit_height) - 1) * unit_height_in_mm) - (unit_height_mm / 2) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1], -1);
                    faceplate_screw_hole_slot(half_desired_width_mm - 8, ((round(unit_height) - 1) * unit_height_in_mm) - (unit_height_mm / 2) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1], -1);
                }
                else 
                {
                    if (safe_bolt_together_faceplate_ears == "One Side")
                    {
                        faceplate_screw_hole_slot(0 - half_desired_width_mm + 8, 0 - (unit_height_mm / 2) + mounting_hole_pattern[0], -1);

                        faceplate_screw_hole_slot(0 - half_desired_width_mm + 8, ((round(unit_height) - 1) * unit_height_in_mm) - (unit_height_mm / 2) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1], -1);
                    }
                    translate([0 - half_desired_width_mm - 11, 0 - (unit_height_mm / 2) + mounting_hole_pattern[0], 10 + plate_thickness])
                        rotate([0, 90, 0])
                            linear_extrude(22, center=false, twist=0, $fn=this_fn)
                                if (tap_or_heat_set_holes == 0.00)
                                    circle(d=5.5, $fn=this_fn, false);
                                else
                                    circle(d=tap_or_heat_set_holes, $fn=this_fn, false);
                    translate([half_desired_width_mm - 11, 0 - (unit_height_mm / 2) + mounting_hole_pattern[0], 10 + plate_thickness])
                        rotate([0, 90, 0])
                            linear_extrude(22, center=false, twist=0, $fn=this_fn)
                                if (tap_or_heat_set_holes == 0.00)
                                    circle(d=5.5, $fn=this_fn, false);
                                else
                                    circle(d=tap_or_heat_set_holes, $fn=this_fn, false);

                    translate([0 - half_desired_width_mm - 11, ((round(unit_height) - 1) * unit_height_in_mm) - (unit_height_mm / 2) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1], 10 + plate_thickness])
                        rotate([0, 90, 0])
                            linear_extrude(22, center=false, twist=0, $fn=this_fn)
                                if (tap_or_heat_set_holes == 0.00)
                                    circle(d=5.5, $fn=this_fn, false);
                                else
                                    circle(d=tap_or_heat_set_holes, $fn=this_fn, false);
                    translate([half_desired_width_mm - 11, ((round(unit_height) - 1) * unit_height_in_mm) - (unit_height_mm / 2) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1], 10 + plate_thickness])
                        rotate([0, 90, 0])
                            linear_extrude(22, center=false, twist=0, $fn=this_fn)
                                if (tap_or_heat_set_holes == 0.00)
                                    circle(d=5.5, $fn=this_fn, false);
                                else
                                    circle(d=tap_or_heat_set_holes, $fn=this_fn, false);

                    // Optionally, add alignment pin holes if the option is enabled.
                    if (add_alignment_pin_holes)
                    {
                        alignment_pin_hole(half_desired_width_mm - 2.5, 0 - (unit_height_mm / 2) + mounting_hole_pattern[0], 2 + (heavy_device / 2));

                        alignment_pin_hole(half_desired_width_mm - 2.5, ((round(unit_height) - 1) * unit_height_in_mm) - (unit_height_mm / 2) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1], 2 + (heavy_device / 2));

                        if (safe_bolt_together_faceplate_ears == "Both Sides")
                        {
                            alignment_pin_hole(0 - half_desired_width_mm + 2.5, 0 - (unit_height_mm / 2) + mounting_hole_pattern[0], 2 + (heavy_device / 2));

                            alignment_pin_hole(0 - half_desired_width_mm + 2.5, ((round(unit_height) - 1) * unit_height_in_mm) - (unit_height_mm / 2) + mounting_hole_pattern[half_unit ? 0 : len(mounting_hole_pattern) - 1], 2 + (heavy_device / 2));
                        }
                    }
                }
            }


            // Optionally punch ventllation holes into the faceplate. Start by clearing
            // out the space into which the grid will be placed.
            if (faceplate_vent_hole_pattern != "None")
                translate([0,0,-1])
                    four_rounded_corner_plate(grid_height - 2, grid_width - 2, 15, faceplate_radius);
        } // difference end


        // Time to handle actual grid settings...
        if (faceplate_vent_hole_pattern != "None")
            create_ventilation_grid(faceplate_vent_hole_pattern, grid_width, grid_height, faceplate_vent_hole_size, faceplate_vent_wall_thickness, faceplate_vent_grid_horizontal_offset, faceplate_vent_grid_vertical_offset, faceplate_vent_grid_angle)


        // If the faceplate grid is enabled but the cage is to be split for printing
        // on a small-volume printer, place a reinforcement strip across where the
        // cage will be split so that the grid has a clean edge and isn't just hanging
        // in open space.
        if ((split_cage_into_two_halves) && (faceplate_vent_hole_pattern != "None"))
            translate([cage_horizontal_offset, 0, plate_thickness / 2])
                cube([12, unit_height_mm, plate_thickness], center=true);
    } // union end
}

// Create a hollow tube of a given diameter/height with a given wall thickness
module tube(diameter, height, wall_thickness, facet_count)
{
    difference()
    {
        cylinder(h=height, d=diameter, center=true, $fn=facet_count);
        cylinder(h=height, d=diameter - (wall_thickness * 2), center=true, $fn=facet_count);
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

// Create and position a marker for positioning modifications.
// (Show a marker to indicate where a modification is centered.)
module mod_offset_marker(marker_offset, marker_height, units_required)
{
    if ((show_ruler) && ($preview) && (!split_cage_into_two_halves))
    {
        translate([marker_offset, 0, marker_height])
            color("green")
                cube([1, (units_required * unit_height_in_mm) + 15, 1], center=true);
        translate([marker_offset, 0 - (units_required * unit_height_in_mm) / 2 - 13, 20])
            translate([0, 0, 0])
                scale([0.5, 0.5, 1.0])
                    color("green")
                        linear_extrude(height=1, center=true)
                            text(str(marker_offset), halign="center");
        translate([marker_offset, 0 - (units_required * unit_height_in_mm) / 2 - 20, 20])
            translate([0, 0, 0])
                scale([0.5, 0.5, 1.0])
                    color("green")
                        linear_extrude(height=1, center=true)
                            text("MOD CENTER", halign="center");   
        translate([marker_offset, 0 - (units_required * unit_height_in_mm) / 2 - 14, 19])
                color("white")
                    four_rounded_corner_plate(16, 50, 1, 5);
    }
}

// Create fan screw holes relative to a center offset value relative to
// the dead-center of a rack faceplate.
module fan_screws(screw_centers, hole_diameter)
{
    translate([0 - (screw_centers / 2), 0 - (screw_centers / 2), 3.5])
        rotate([0, 0, 90])
            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
    translate([0 + (screw_centers / 2), 0 - (screw_centers / 2), 3.5])
        rotate([0, 0, 90])
            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
    translate([0 - (screw_centers / 2), (screw_centers / 2), 3.5])
        rotate([0, 0, 90])
            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
    translate([0 + (screw_centers / 2), (screw_centers / 2), 3.5])
        rotate([0, 0, 90])
            cylinder(h=10, d=hole_diameter, center=true, $fn=this_fn);
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
            cylinder(d=1.75, h=6, $fn=this_fn, center=true);                      
}

// Place a Keystone receptacle at the given coordinates.
module place_keystone(xx, yy, zz)
{
    translate([xx, yy, zz])
        rotate ([0, 0, 90])
            translate([-13.5, -9.5, 0])
                keystone_Module();
}

// Create a ventilation hole grid that can be inserted into a hole in the object.
// Where possible, each grid type is generated from the center out so that it
// will automatically center itself within said hole in the object.
module create_ventilation_grid(grid_pattern, grid_width, grid_height, vent_hole_size, vent_wall_thickness, vent_grid_horizontal_offset, vent_grid_vertical_offset, vent_grid_angle)
{
    if (grid_pattern == "Hex")
    {
        // Hexagonal grid, using a hex-grid code snippet to manage the trigonometry
        // involved in properly gridding hexagons.
        grid_count = grid_width / (vent_hole_size + vent_wall_thickness);
        
        // We're using an intersection to create a "plug" of the grid pattern to
        // fill the hole we'd just cut out of the faceplate. Basically we create
        // a rectangular cuboid and subtract holes from it to create a grid of a
        // desired set of dimensions.
        intersection()
        {
            translate([0,0,-1])
                cube([grid_width - 2, grid_height - 2, 15], center=true);

            translate([0,0,0])
                rotate([0, 0, vent_grid_angle])
                    hex_grid(
                        diameter=(vent_hole_size * 2) + vent_wall_thickness,
                        thickness=vent_wall_thickness,
                        rows=grid_count * 2,
                        columns=grid_count * 2
                    );
        }
    }
    else
    if (grid_pattern == "Triangle")
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
            translate([0,0,plate_thickness / 2])
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
                                    cube([vent_wall_thickness, grid_width * 3, plate_thickness + 3], center=true);
                                rotate([0, 0, 120])
                                    cube([vent_wall_thickness, grid_width * 3, plate_thickness + 3], center=true);
                            }
                            translate([0-x, 0, (plate_thickness / 2) - 1])
                            {
                                rotate([0, 0, 60])
                                    cube([vent_wall_thickness, grid_width * 3, plate_thickness + 3], center=true);
                                rotate([0, 0, 120])
                                    cube([vent_wall_thickness, grid_width * 3, plate_thickness + 3], center=true);
                            }
                        }
                        for (y = [0: half_height : grid_width * 2])
                        {
                            translate([y, 0, 0])
                                rotate([0, 0, 90])
                                    cube([grid_width * 2, vent_wall_thickness, plate_thickness + 6], center=true);
                            translate([0 - y, 0, 0])
                                rotate([0, 0, 90])
                                    cube([grid_width * 2, vent_wall_thickness, plate_thickness + 6], center=true);
                        }
                    }
        }
    }
    else
    if (grid_pattern == "Isometric")
    {
        intersection()
        {
            translate([0,0,plate_thickness / 2])
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
                                    cube([vent_wall_thickness, grid_width * 3, plate_thickness + 3], center=true);
                                rotate([0, 0, 120])
                                    cube([vent_wall_thickness, grid_width * 3, plate_thickness + 3], center=true);
                            }
                            translate([0 - x, 0, (plate_thickness / 2) - 1])
                            {
                                rotate([0, 0, 60])
                                    cube([vent_wall_thickness, grid_width * 3, plate_thickness + 3], center=true);
                                rotate([0, 0, 120])
                                    cube([vent_wall_thickness, grid_width * 3, plate_thickness + 3], center=true);
                            }
                        }
                    }
        }
    }
    else
    if (grid_pattern == "Grid")
    {
        intersection()
        {
            translate([0,0,plate_thickness / 2])
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
                                    cube([vent_wall_thickness, grid_width * 2.66, plate_thickness + 3], center=true);
                                rotate([0, 0, 135])
                                    cube([vent_wall_thickness, grid_width * 2.66, plate_thickness + 3], center=true);
                            }
                            translate([0 - x, 0, (plate_thickness / 2) - 1])
                            {
                                rotate([0, 0, 45])
                                    cube([vent_wall_thickness, grid_width * 2.66, plate_thickness + 3], center=true);
                                rotate([0, 0, 135])
                                    cube([vent_wall_thickness, grid_width * 2.66, plate_thickness + 3], center=true);
                            }
                        }
                    }
        }
    }
    else
    {
        // Non-hexagonal grid, using a simple grid of holes of varied shape.
        hole_facet_count = 
          (grid_pattern == "Round" ? this_fn:0) + 
          (grid_pattern == "Checkerboard" ? 4:0) + 
          (grid_pattern == "Octagon" ? 8:0);
        hole_rotation_angle = 
//          (grid_pattern == "Grid" ? 45:0) +
          (grid_pattern == "Octagon" ? 22.5:0);
        wall_thickness_divisor =
          (grid_pattern == "Round" ? 1:2);

        // Unlike how we handle the above grids, for other hole shapes we'll simply
        // create the grid by punching holes in a rectangular cuboid of the desired size.
        difference()
        {
            translate([0,0,plate_thickness / 2])
                cube([grid_width - 2, grid_height - 2, plate_thickness], center=true);

            translate([vent_grid_horizontal_offset,vent_grid_vertical_offset,0])
                rotate([0, 0, 45 + vent_grid_angle])
                    union()            
                    {
                        for (x = [0: (vent_hole_size * 2) + (vent_wall_thickness / wall_thickness_divisor):grid_width * 2])
                        {
                            for (y = [0: (vent_hole_size * 2) + (vent_wall_thickness / wall_thickness_divisor):grid_width * 2])
                            {
                                translate([x, y, (plate_thickness / 2) - 1])
                                    rotate([0, 0, hole_rotation_angle])
                                        cylinder(h=plate_thickness + 3, r=vent_hole_size, center=true, $fn=hole_facet_count);
                                translate([0 - x, y, (plate_thickness / 2) - 1])
                                    rotate([0, 0, hole_rotation_angle])
                                        cylinder(h=plate_thickness + 3, r=vent_hole_size, center=true, $fn=hole_facet_count);
                                translate([x, 0 - y, (plate_thickness / 2) - 1])
                                    rotate([0, 0, hole_rotation_angle])
                                        cylinder(h=plate_thickness + 3, r=vent_hole_size, center=true, $fn=hole_facet_count);
                                translate([0 - x, 0 - y, (plate_thickness / 2) - 1])
                                    rotate([0, 0, hole_rotation_angle])
                                        cylinder(h=plate_thickness + 3, r=vent_hole_size, center=true, $fn=hole_facet_count);
                            }
                        }
                    }
        }
    }
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



// Library incorporations for special features



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
//
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

/*
  hex-grid: Generate repeating hexagon grid in OpenSCAD
  Author: @charlespascoe
  Licensed under the MIT License
*/

// Hexagonal hole grid generation
//
// Created by @charlespascoe
// Originally posted at
//    https://github.com/charlespascoe/hex-grid/blob/master/hex-grid.scad
//
// Modified by WebMaka to make it center itself relative to the center point of the
// translate above it, if any.
module hex(diameter, thickness)
{
    difference()
    {
        circle(d=diameter, $fn=6);
        circle(d=diameter - thickness * 2, $fn=6);
    }
}

function compute_x_delta(outer_radius,inner_radius) = (outer_radius + inner_radius) * 0.5 * (1 + cos(60));
function compute_y_delta(outer_radius,inner_radius) = (outer_radius + inner_radius) * 0.5 * sin(60);

module hex_grid(diameter, thickness, rows, columns) 
{
    outer_radius = diameter / 2;
    inner_radius = outer_radius - thickness;

    x_delta = compute_x_delta(outer_radius,inner_radius);

    y_delta = compute_y_delta(outer_radius,inner_radius);

    translate([0,0,plate_thickness / 2])
        linear_extrude(plate_thickness, center=true, convexity=10, twist=0, $fn=this_fn)
            union() 
            {
                for (r=[0:1:(rows / 2) + 1]) 
                {
                    translate([0, 2 * y_delta * r, 0])
                    {
                        for (c=[0:2:(columns / 2) + 1]) 
                        {
                            translate([x_delta * c, 0, 0])
                              hex(diameter, thickness);
                            translate([0 - (x_delta * c), 0, 0])
                              hex(diameter, thickness);
                        }

                        for (c=[1:2:(columns / 2) + 1]) 
                        {
                            translate([x_delta * c, y_delta, 0])
                              hex(diameter, thickness);
                            translate([0 - (x_delta * c), y_delta, 0])
                              hex(diameter, thickness);
                        }
                    }
                    translate([0, 0 - (2 * y_delta * r), 0])
                    {
                        for (c=[0:2:(columns / 2) + 1]) 
                        {
                            translate([x_delta * c, 0, 0])
                              hex(diameter, thickness);
                            translate([0 - (x_delta * c), 0, 0])
                              hex(diameter, thickness);
                        }

                        for (c=[1:2:(columns / 2) + 1]) 
                        {
                            translate([x_delta * c, y_delta, 0])
                              hex(diameter, thickness);
                            translate([0 - (x_delta * c), y_delta, 0])
                              hex(diameter, thickness);
                        }
                    }
                }
            }
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



// The act of creation, manifest...



// Make a cage and cut it in half.
module make_half_cage()
{
    // Calculate how many units tall the mount needs to be in order to hold 
    // the device and provide at least 8-10mm of clearance above/below for support
    // structure depending on the heavy_device setting.
    total_height_required = device_height + support_cage_base_size + (heavy_device * support_cage_heavy_device_multiplier);
    units_required = (ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1);

    // Calculate whether the device will fit within the INTERNAL width for the
    // given rack width, again allowing at least 10mm of clearance on each side
    // for support structure. Note that for 1/2-width and 1/3-width sizes in 19"
    // racks, we will auto-scale 1/3-to-1/2, 1/2-to-full, or even 1/3-to-full
    // as required to fit the device dimensions.
    //
    // NOTE: This seems kludgy AF but has to be done this way, with a series of
    // conditional additions, because of how OpenSCAD handles variables.
    total_width_required = device_width + support_cage_base_size + (heavy_device * support_cage_heavy_device_multiplier);    
    rack_cage_width_required = rack_cage_width + 
      (((rack_cage_width == 4.75) && (total_width_required > 80) && (total_width_required <= 125)) ? 1.58:0) + // Too wide for 1/4-rack @ 19" but not for 1/3-wide
      (((rack_cage_width == 4.75) && (total_width_required > 125) && (total_width_required <= 220)) ? 4.75:0) + // Too wide for 1/4-rack @ 19" but not for 1/2-wide
      (((rack_cage_width == 4.75) && (total_width_required > 220) && (total_width_required < 430)) ? 14.25:0) + // Too wide for both 1/4-rack and 1/2-rack @ 19"
      (((rack_cage_width == 4.75001) && (total_width_required > 80) && (total_width_required <= 125)) ? 1.57999:0) + // Too wide for 1/4-rack @ 19" but not for 1/3-wide
      (((rack_cage_width == 4.75001) && (total_width_required > 125) && (total_width_required <= 220)) ? 4.74999:0) + // Too wide for 1/4-rack @ 19" but not for 1/2-wide
      (((rack_cage_width == 4.75001) && (total_width_required > 220) && (total_width_required < 430)) ? 14.24999:0) + // Too wide for both 1/4-rack and 1/2-rack @ 19"

      (((rack_cage_width == 5) && (total_width_required > 93) && (total_width_required <= 220)) ? 5:0) + // Too wide for 5" rack but not too wide for 10"

      (((rack_cage_width == 5.001) && (total_width_required > 93) && (total_width_required <= 220)) ? 4.999:0) + // Too wide for 1/2-rack @ 10" but not too wide for 10"
      (((rack_cage_width == 6) && (total_width_required > 120) && (total_width_required <= 220)) ? 4:0) + // Too wide for 6" but not too wide for 10"
      (((rack_cage_width == 6) && (total_width_required > 220) && (total_width_required < 430)) ? 13:0) + // Too wide for both 6" and 10"

      (((rack_cage_width == 6.33) && (total_width_required > 130) && (total_width_required <= 220)) ? 3.16669:0) + // Too wide for 1/3-rack @ 19" but not for 1/2-wide
      (((rack_cage_width == 6.33) && (total_width_required > 220) && (total_width_required < 430)) ? 12.66669:0) + // Too wide for both 1/3-rack and 1/2-rack @ 19"

      (((rack_cage_width == 7) && (total_width_required > 145) && (total_width_required < 220)) ? 3:0) + // Too wide for 7" but not too wide for 10"
      (((rack_cage_width == 7) && (total_width_required > 220)) ? 12:0) + // Too wide for both 7" and 10"

      (((rack_cage_width == 9.5) && (total_width_required > 210)) ? 9.5:0) +  // Too wide for 1/2-rack @ 19"

      (((rack_cage_width == 10) && (total_width_required > 220)) ? 9:0) + // Too wide for 10"
      (((rack_cage_width == 19) && (total_width_required > 430)) ? -10:0); // Too wide for 19" - if you're hitting this, what are you trying to mount?

    total_depth_required = device_depth + 22;

    // Determine hole diameters for screw clearances based on the tap/heat-set
    // hole setting. We'll use close-clearance hole diameters for the corresponding
    // tap/heat-set hole setting, so as to automatically add screw clearance holes
    // to match the selected tap diameter or heat-set.
    //
    // NOTE: Here's a different kludge to work around immutable variables: a
    // lookup table we search for values.
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

      [2.60, 3.15], // 2.6:"M3 Tapped (2.6mm hole)",    
      [3.50, 4.20], // 3.5:"M4 Tapped (3.5mm hole)",    
      [4.40, 5.25], // 4.4:"M5 Tapped (4.4mm hole)",    
      [5.00, 6.30], // 5.00:"M6 Tapped (5.0mm hole)",   
      [2.07, 2.95], // 2.07:"4-40 Tapped (0.0813 in. hole)",    
      [2.53, 3.66], // 2.53:"6-32 Tapped (.0997 in. hole)",   
      [3.19, 4.31], // 3.19:"8-32 Tapped (.1257 in. hole)",    
      [3.53, 4.98], // 3.53:"10-24/10-32 Tapped (.1389 in. hole)",    
      [4.79, 6.53], // 4.79:"1/4-20 Tapped (.1887 in. hole)",    

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


    // Change the faceplate ear(s) setting to accurately reflect the new size
    // if the device dimensions were too wide to fit the selected rack width.
    faceplate_ear_options = [
        [4.75, "One Side"],
        [4.75001, "Both Sides"],
        [5, "None"],
        [5.001, "One Side"],
        [6, "None"],
        [6.33, "One Side"],
        [6.33001, "Both Sides"],
        [7, "None"],
        [9.5, "One Side"],
        [10, "None"],
        [19, "None"],
    ];
    safe_bolt_together_faceplate_ears = faceplate_ear_options[search(rack_cage_width_required, faceplate_ear_options)[0]][1];


    // Cage horizontal offset, for shifting the cage to one side. We need
    // to sanity check this to avoid the user pushing the cage off the side
    // of the faceplate.  

    // How wide is our working space? We have to reserve 15.875mm (5/8") for each rack
    // side, and 12mm for bolt-together ears for half- and third-width cages.
    working_width_a = (rack_cage_width_required * 25.4) / 2 -
       (safe_bolt_together_faceplate_ears == "None" ? 15.875:12);
    working_width_b = 0 - ((rack_cage_width_required * 25.4) / 2 -
       (safe_bolt_together_faceplate_ears == "Both Sides" ? 12:15.875));

    // Is the offset small enough to keep the cage inside the safe working area of the 
    // faceplate?
    // When the offset sanity check fails, force the offset to zero.
    outer_horizontal_edge = total_width_required / 2;
    safe_cage_horizontal_offset = 0.00 + 
      ((
        ((cage_horizontal_offset > 0) && (outer_horizontal_edge + cage_horizontal_offset > working_width_a))
        ||
        ((cage_horizontal_offset < 0) && (0 - outer_horizontal_edge + cage_horizontal_offset < working_width_b))
      ) ? 0.00:cage_horizontal_offset);


    // Cage vertical offset, for shifting the cage up or down. We need to
    // sanity check this to avoid the user pushing the cage off the edge of
    // the faceplate.  
    outer_vertical_edge = (units_required * unit_height_in_mm) / 2;

    // When the offset sanity check fails, force the offset to zero.
    safe_cage_vertical_offset = 0.00 + 
      ((
        ((cage_vertical_offset >= 0) && ((total_height_required / 2) + cage_vertical_offset > outer_vertical_edge))
        ||
        ((cage_vertical_offset < 0) && (0 - (total_height_required / 2) + cage_vertical_offset < 0 - outer_vertical_edge))
      ) ? 0.00:cage_vertical_offset);


    // Helper vars to reduce reduncancies in code.
    rack_cage_width_mm = rack_cage_width * 25.4;


    // First, we'll create a half cage.
    translate([rack_cage_width_mm / 4 -10, (units_required * unit_height_in_mm) / 2 + 1, 0])
        union()
        {
            difference()
            {
                // Create the cage...
                do_the_thing();       
                
                // Then cut the cage in half...
                translate([safe_cage_horizontal_offset + rack_cage_width_mm / 2 - 0.001, 0, total_depth_required / 2 - 1])
                    cube([rack_cage_width_mm + 0.01, (units_required + 1) * unit_height_in_mm, total_depth_required], center=true);

                // Then cut grooves for the tabs that attach the halves to each other...
                translate([safe_cage_horizontal_offset, -((device_height / 2) + 8 + heavy_device + (heavy_device / 2)) + plate_thickness + safe_cage_vertical_offset, device_depth + plate_thickness + (add_retention_lip ? 2:0)])
                    rotate([90, 0, 0])
                        four_rounded_corner_plate(12, 40, plate_thickness, 5);
                        
                translate([0, (device_height / 2) + 8.05 + heavy_device + (heavy_device / 2) + safe_cage_vertical_offset, 10 + heavy_device])
                    rotate([90, 0, 0])
                        four_rounded_corner_plate(12, 40, 0.1 + plate_thickness, 5);

                // Then, punch holes for tapping or heat-set inserts...
                translate([safe_cage_horizontal_offset-10, -((device_height / 2) + heavy_device + (heavy_device / 2)) + safe_cage_vertical_offset, device_depth + plate_thickness + (add_retention_lip ? 2:0)])
                    rotate([90, 0, 0])
                        cylinder(d=tap_or_heat_set_holes, h=16, $fn=this_fn, center=true);

                translate([safe_cage_horizontal_offset-10, (device_height / 2) + heavy_device + (heavy_device / 2) - 2 + safe_cage_vertical_offset, 10 + heavy_device])
                    rotate([90, 0, 0])
                        cylinder(d=tap_or_heat_set_holes, h=16, $fn=this_fn, center=true);

                translate([cage_horizontal_offset-10, (device_height / 2) + heavy_device + (heavy_device / 2) + 14 - heavy_device + safe_cage_vertical_offset, 10 + heavy_device])
                    rotate([90, 0, 0])
                        cylinder(d=screw_clearance_hole * 2, h=16, $fn=this_fn, center=true);

                // Optionally, add alignment pin holes if the option is enabled.
                if (add_alignment_pin_holes)
                {
                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, 2 + (heavy_device / 2));
                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, 13.5);
                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, ((units_required * unit_height_in_mm) / 2) - 2.5, 2 + (heavy_device / 2));
                
                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, -((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, 2 + (heavy_device / 2));
                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, -((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, 13.5);
                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, -(((units_required * unit_height_in_mm) / 2) - 2.5), 2 + (heavy_device / 2));

                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, device_depth - 1 + (heavy_device / 2));
                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, device_depth + 9 + (heavy_device / 2));

                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, -((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, device_depth - 1 + (heavy_device / 2));
                    alignment_pin_hole(safe_cage_horizontal_offset-2.5, -((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, device_depth + 9 + (heavy_device / 2));

                    // If either the "extra support" or "make bottom a shelf" options are 
                    // enabled, add some more alignment pins based on the height of the device.
                    if ((extra_support) || (make_bottom_solid) || (cage_top_bottom_vent_hole_pattern != "None"))
                    {
                        if (device_depth > 50)
                        {
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth / 2) + 2 + (heavy_device / 2));                      
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth / 2) + 2 + (heavy_device / 2));                      
                        }
                        if (device_depth > 100)
                        {
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth / 4) + 2 + (heavy_device / 2));
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth / 4) + 2 + (heavy_device / 2));
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth * 0.75) + 2 + (heavy_device / 2)); 
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth * 0.75) + 2 + (heavy_device / 2));
                        }
                    }

                    // If either the "extra support" or "make top a shelf" options are 
                    // enabled, add some more alignment pins based on the height of the device.
                    if ((extra_support) || (make_top_solid) || (cage_top_bottom_vent_hole_pattern != "None"))
                    {
                        if (device_depth > 50)
                        {
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth / 2) + 2 + (heavy_device / 2));                      
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth / 2) + 2 + (heavy_device / 2));                      
                        }
                        if (device_depth > 100)
                        {
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth / 4) + 2 + (heavy_device / 2));
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth / 4) + 2 + (heavy_device / 2));
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth * 0.75) + 2 + (heavy_device / 2)); 
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth * 0.75) + 2 + (heavy_device / 2));
                        }
                    }
                }
            } // difference end


            // Then add tabs for attaching the halves to each other.
            difference()
            {
                translate([safe_cage_horizontal_offset, (device_height / 2) + 8.25 + heavy_device + (heavy_device / 2) + safe_cage_vertical_offset, device_depth + plate_thickness + (add_retention_lip ? 2:0)])
                    rotate([90, 0, 0])
                        four_rounded_corner_plate(11.5, 40, plate_thickness, 5);
                
                // ... And punch a screw hole into the tab.
                translate([safe_cage_horizontal_offset + 10, (device_height / 2) + plate_thickness + (heavy_device / 2) + safe_cage_vertical_offset, device_depth + plate_thickness + (add_retention_lip ? 2:0)])
                    rotate([90, 0, 0])
                        cylinder(d=screw_clearance_hole, h=16, $fn=this_fn, center=true);
            }

            difference()
            {
                translate([safe_cage_horizontal_offset, 0-((device_height / 2) + 8.25 + heavy_device + (heavy_device / 2)) + plate_thickness + safe_cage_vertical_offset, 10.1 + heavy_device])
                    rotate([90, 0, 0])
                        four_rounded_corner_plate(11.5, 40, 3.8 + heavy_device, 5);

                translate([safe_cage_horizontal_offset + 10, 0-((device_height / 2) + heavy_device + (heavy_device / 2)) - 6 + safe_cage_vertical_offset, 10 + heavy_device])
                    rotate([90, 0, 0])
                        cylinder(d=screw_clearance_hole, h=16, $fn=this_fn, center=true);
            }
        } // union end



    // Now let's create another entire half cage in its entirety by
    // doing the above again, but rotating the full cage before splitting
    // it.
    rotate([0, 0, 180])
        translate([-safe_cage_horizontal_offset + rack_cage_width_mm / 4 - 10, (units_required * unit_height_in_mm) / 2 + 1, 0])
            union()
            {
                difference()
                {
                    // Create the cage...
                    rotate([0, 0, 180])
                        do_the_thing();       

                    // Then cut the cage in half...
                    translate([-safe_cage_horizontal_offset + rack_cage_width_mm / 2 - 0.001, -0.001, total_depth_required / 2 - 1])
                        cube([rack_cage_width_mm + 0.01, (units_required + 1) * unit_height_in_mm, total_depth_required], center=true);

                    // Then cut grooves for the tabs that attach the halves to each other...
                    translate([-safe_cage_horizontal_offset, 0-((device_height / 2) + 8 + heavy_device + (heavy_device / 2)) + plate_thickness - safe_cage_vertical_offset, device_depth + plate_thickness + (add_retention_lip ? 2:0)])
                        rotate([90, 0, 0])
                                four_rounded_corner_plate(12, 40, plate_thickness, 5);
                            
                    translate([-safe_cage_horizontal_offset, (device_height / 2) + 8.05 + heavy_device + (heavy_device / 2) - safe_cage_vertical_offset, 10 + heavy_device])
                        rotate([90, 0, 0])
                            four_rounded_corner_plate(12, 40, 0.1 + plate_thickness, 5);

                    // Then, punch holes for tapping or heat-set inserts...
                    translate([-safe_cage_horizontal_offset-10, 0-((device_height / 2) + heavy_device + (heavy_device / 2)) - safe_cage_vertical_offset, device_depth + plate_thickness + (add_retention_lip ? 2:0)])
                        rotate([90, 0, 0])
                            cylinder(d=tap_or_heat_set_holes, h=16, $fn=this_fn, center=true);

                    translate([-safe_cage_horizontal_offset-10, (device_height / 2) + heavy_device + (heavy_device / 2) - 2 - safe_cage_vertical_offset, 10 + heavy_device])
                        rotate([90, 0, 0])
                            cylinder(d=tap_or_heat_set_holes, h=16, $fn=this_fn, center=true);

                    translate([-safe_cage_horizontal_offset-10, (device_height / 2) + heavy_device + (heavy_device / 2) + 14 - heavy_device + safe_cage_vertical_offset, 10 + heavy_device])
                        rotate([90, 0, 0])
                            cylinder(d=screw_clearance_hole * 2, h=16, $fn=this_fn, center=true);

                    // Optionally, add alignment pin holes if the option is enabled.
                    if (add_alignment_pin_holes)
                    {
                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) - safe_cage_vertical_offset, 2 + (heavy_device / 2));
                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) - safe_cage_vertical_offset, 13.5);
                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, ((units_required * unit_height_in_mm) / 2) - 2.5, 2 + (heavy_device / 2));
                    
                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, -((device_height / 2) + 2.5 + (heavy_device / 2)) - safe_cage_vertical_offset, 2 + (heavy_device / 2));
                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) - safe_cage_vertical_offset, 13.5);
                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-(((units_required * unit_height_in_mm) / 2) - 2.5), 2 + (heavy_device / 2));

                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) - safe_cage_vertical_offset, device_depth - 1 + (heavy_device / 2));
                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) - safe_cage_vertical_offset, device_depth + 9 + (heavy_device / 2));

                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) - safe_cage_vertical_offset, device_depth - 1 + (heavy_device / 2));
                        alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) - safe_cage_vertical_offset, device_depth + 9 + (heavy_device / 2));
  
                    // If the "extra support," "make bottom a shelf," or cage top/bottom 
                    // ventilation options are enabled, add some more alignment pins 
                    // based on the height of the device.
                    if ((extra_support) || (make_bottom_solid) || (cage_top_bottom_vent_hole_pattern != "None"))
                    {
                        if (device_depth > 50)
                        {
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) - safe_cage_vertical_offset, (device_depth / 2) + 2 + (heavy_device / 2));                      
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) - safe_cage_vertical_offset, (device_depth / 2) + 2 + (heavy_device / 2));                      
                        }
                        if (device_depth > 100)
                        {
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) - safe_cage_vertical_offset, (device_depth / 4) + 2 + (heavy_device / 2));                      
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) - safe_cage_vertical_offset, (device_depth / 4) + 2 + (heavy_device / 2));                      
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) - safe_cage_vertical_offset, (device_depth * 0.75) + 2 + (heavy_device / 2));                      
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) - safe_cage_vertical_offset, (device_depth * 0.75) + 2 + (heavy_device / 2));                      
                        }
                    }

                    // If either the "extra support" or "make top a shelf" options are 
                    // enabled, add some more alignment pins based on the height of the device.
                    if ((extra_support) || (make_top_solid) || (cage_top_bottom_vent_hole_pattern != "None"))
                    {
                        if (device_depth > 50)
                        {
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth / 2) + 2 + (heavy_device / 2));                      
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth / 2) + 2 + (heavy_device / 2));                      
                        }
                        if (device_depth > 100)
                        {
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth / 4) + 2 + (heavy_device / 2));
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth / 4) + 2 + (heavy_device / 2));
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, (device_height / 2) + 2.5 + (heavy_device / 2) + safe_cage_vertical_offset, (device_depth * 0.75) + 2 + (heavy_device / 2)); 
                            alignment_pin_hole(-safe_cage_horizontal_offset-2.5, 0-((device_height / 2) + 2.5 + (heavy_device / 2)) + safe_cage_vertical_offset, (device_depth * 0.75) + 2 + (heavy_device / 2));
                        }
                    }
                }
            } // difference end

            // Then add tabs for attaching the halves to each other.
            difference()
            {
                translate([-safe_cage_horizontal_offset, (device_height / 2) + 8.25 + heavy_device + (heavy_device / 2) - safe_cage_vertical_offset, device_depth + plate_thickness + (add_retention_lip ? 2:0)])
                    rotate([90, 0, 0])
                        four_rounded_corner_plate(11.5, 40, plate_thickness, 5);
                
                // ... And punch a screw hole into the tab.
                translate([-safe_cage_horizontal_offset + 10, (device_height / 2) + plate_thickness + (heavy_device / 2) - safe_cage_vertical_offset, device_depth + plate_thickness + (add_retention_lip ? 2:0)])
                    rotate([90, 0, 0])
                        cylinder(d=screw_clearance_hole, h=16, $fn=this_fn, center=true);
            }

            difference()
            {
                translate([-safe_cage_horizontal_offset, 0-((device_height / 2) + 8.1 + heavy_device + (heavy_device / 2)) + plate_thickness - safe_cage_vertical_offset, 10.1 + heavy_device])
                    rotate([90, 0, 0])
                        four_rounded_corner_plate(11.8, 40, 3.8 + heavy_device, 5);

                translate([-safe_cage_horizontal_offset + 10, 0-((device_height / 2) + heavy_device + (heavy_device / 2)) - 6 - safe_cage_vertical_offset, 10 + heavy_device])
                    rotate([90, 0, 0])
                        cylinder(d=screw_clearance_hole, h=16, $fn=this_fn, center=true);
            }
        } // union end


    // Although we disable the ruler in split-cage mode, we'll draw the build
    // volume marker as it's most relevant at this point.
    if ((show_ruler) && ($preview) && (show_build_outline > 0))
    {
        // Show an outline for build volumes by creating a cube and
        // carving it out.
        color("maroon")
            difference()
            {
                translate([0, 0, show_build_outline / 2 + 0.01])
                    cube([show_build_outline, show_build_outline, show_build_outline], center=true);

                translate([5, 0, show_build_outline / 2])
                    cube([show_build_outline * 1.1, show_build_outline - 1, show_build_outline - 1], center=true);
                translate([0, 5, show_build_outline / 2])
                    cube([show_build_outline - 1, show_build_outline * 1.1, show_build_outline - 1], center=true);
                translate([0, 0, show_build_outline / 2])
                    cube([show_build_outline - 1, show_build_outline - 1, show_build_outline * 1.1], center=true);
            }

        translate([0, 0 - (show_build_outline / 2) - 10, 1])
            color("blue")
                linear_extrude(height=1, center=true)
                    text(str(show_build_outline, "mm BUILD VOLUME"), halign="center", valign="center", size=5);   
        translate([0, 0 - (show_build_outline / 2) -10, 0])
                color("white")
                    four_rounded_corner_plate(10, 90, 1, 2.5);
    }
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



// The Process™!
module do_the_thing()
{
    // Calculate how many units tall the mount needs to be in order to hold 
    // the device and provide at least 8-10mm of clearance above/below for support
    // structure depending on the heavy_device setting.
    total_height_required = (faceplate_only == 0.0 ? (device_height + support_cage_base_size + (heavy_device * support_cage_heavy_device_multiplier)) : ((faceplate_only - 0.001) * unit_height_in_mm));
    units_required = (faceplate_only == 0.0 ? ((ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1)) : ((ceil((total_height_required * 2) / unit_height_in_mm)) / 2));

    // Calculate whether the device will fit within the INTERNAL width for the
    // given rack width, again allowing at least 10mm of clearance on each side
    // for support structure. Note that for 1/2-width and 1/3-width sizes in 19"
    // racks, we will auto-scale 1/3-to-1/2, 1/2-to-full, or even 1/3-to-full
    // as required to fit the device dimensions.
    //
    // NOTE: This seems kludgy AF but has to be done this way, with a series of
    // conditional additions, because of how OpenSCAD handles variables.
    total_width_required = (faceplate_only == 0.0 ? ((device_width * number_of_devices) + ((plate_thickness + multiple_device_gap) * (number_of_devices - 1)) + support_cage_base_size + (heavy_device * support_cage_heavy_device_multiplier)) : (0.0));    

    rack_cage_width_required = rack_cage_width + 
      (((rack_cage_width == 4.75) && (total_width_required > 80) && (total_width_required <= 125)) ? 1.58:0) + // Too wide for 1/4-rack @ 19" but not for 1/3-wide
      (((rack_cage_width == 4.75) && (total_width_required > 125) && (total_width_required <= 210)) ? 4.75:0) + // Too wide for 1/4-rack @ 19" but not for 1/2-wide
      (((rack_cage_width == 4.75) && (total_width_required > 210) && (total_width_required < 430)) ? 14.25:0) + // Too wide for both 1/4-rack and 1/2-rack @ 19"
      (((rack_cage_width == 4.75001) && (total_width_required > 80) && (total_width_required <= 125)) ? 1.57999:0) + // Too wide for 1/4-rack @ 19" but not for 1/3-wide
      (((rack_cage_width == 4.75001) && (total_width_required > 125) && (total_width_required <= 220)) ? 4.74999:0) + // Too wide for 1/4-rack @ 19" but not for 1/2-wide
      (((rack_cage_width == 4.75001) && (total_width_required > 220) && (total_width_required < 430)) ? 14.24999:0) + // Too wide for both 1/4-rack and 1/2-rack @ 19"

      (((rack_cage_width == 5) && (total_width_required > 93) && (total_width_required <= 220)) ? 5:0) + // Too wide for 1/2-rack @ 10" but not too wide for 10"
      (((rack_cage_width == 5.001) && (total_width_required > 93) && (total_width_required <= 220)) ? 4.999:0) + // Too wide for 1/2-rack @ 10" but not too wide for 10"
      (((rack_cage_width == 6) && (total_width_required > 120) && (total_width_required <= 220)) ? 4:0) + // Too wide for 6" but not too wide for 10"
      (((rack_cage_width == 6) && (total_width_required > 220) && (total_width_required < 430)) ? 13:0) + // Too wide for both 6" and 10"

      (((rack_cage_width == 6.33) && (total_width_required > 130) && (total_width_required <= 220)) ? 3.17:0) + // Too wide for 1/3-rack @ 19" but not for 1/2-wide
      (((rack_cage_width == 6.33) && (total_width_required > 220) && (total_width_required < 430)) ? 12.67:0) + // Too wide for both 1/3-rack and 1/2-rack @ 19"
      (((rack_cage_width == 6.33001) && (total_width_required > 130) && (total_width_required <= 220)) ? 3.16999:0) + // Too wide for 1/3-rack @ 19" but not for 1/2-wide
      (((rack_cage_width == 6.33001) && (total_width_required > 220) && (total_width_required < 430)) ? 12.66669:0) + // Too wide for both 1/3-rack and 1/2-rack @ 19"

      (((rack_cage_width == 7) && (total_width_required > 145) && (total_width_required < 220)) ? 3:0) + // Too wide for 7" but not too wide for 10"
      (((rack_cage_width == 7) && (total_width_required > 220)) ? 12:0) + // Too wide for both 7" and 10"

      (((rack_cage_width == 9.5) && (total_width_required > 210)) ? 9.5:0) +  // Too wide for 1/2-rack @ 19"

      (((rack_cage_width == 10) && (total_width_required > 220)) ? 9:0) + // Too wide for 10"
      (((rack_cage_width == 19) && (total_width_required > 430)) ? -9:0); // Too wide for 19" - if you're hitting this, what are you trying to mount?

    total_depth_required = (faceplate_only == 0.0) ? device_depth + 0 : 0.0;


    // Time for warnings based on settings...

    // Warn the user if the rack size had to be increased to fit the device.
    if (rack_cage_width != rack_cage_width_required)
    {
        echo();
        echo();
        echo(" * * * WARNING! * * *");
        echo(" Device dimensions are too large to fit the selected rack width.");
        echo(str(" Width increased from ", rack_cage_width, " to ", rack_cage_width_required, "."));
        echo(" Double-check your settings, especially for bolt-together faceplates.");
        echo();
        echo();

        check_console();
    }


    // Change the faceplate ear(s) setting to accurately reflect the new size
    // if the device dimensions were too wide to fit the selected rack width.
    faceplate_ear_options = [
        [4.75, "One Side"],
        [4.75001, "Both Sides"],
        [5, "None"],
        [5.001, "One Side"],
        [6, "None"],
        [6.33, "One Side"],
        [6.33001, "Both Sides"],
        [7, "None"],
        [9.5, "One Side"],
        [10, "None"],
        [19, "None"],
    ];
    safe_bolt_together_faceplate_ears = faceplate_ear_options[search(rack_cage_width_required, faceplate_ear_options)[0]][1];


    // Establish outside sizes for the mod options. We'll use these later for 
    // both sanity checking and automatic positioning.
    //
    // The format is simple:
    // ["ModName", width, height],
    mod_sizes = [
      ["None",0, 0],      

      ["Keystone", 25, 28],
      ["DSeries", 26, 31],

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
    right_side_mod_width = mod_sizes[search([right_side_mod_type], mod_sizes)[0]][1];
    right_side_mod_height = mod_sizes[search([right_side_mod_type], mod_sizes)[0]][2];
    left_side_mod_width = mod_sizes[search([left_side_mod_type], mod_sizes)[0]][1];
    left_side_mod_height = mod_sizes[search([left_side_mod_type], mod_sizes)[0]][2];
    centered_mod_width = mod_sizes[search([centered_mod_type], mod_sizes)[0]][1];
    centered_mod_height = mod_sizes[search([centered_mod_type], mod_sizes)[0]][2];



    // How wide is our working space? We have to reserve 15.875mm (5/8") for each rack
    // side, and 12mm for bolt-together ears for half-/third-/quarter-width cages.
    working_width_a = (rack_cage_width_required * 25.4) / 2 -
       (safe_bolt_together_faceplate_ears == "None" ? 15.875:12);
    working_width_b = 0 - ((rack_cage_width_required * 25.4) / 2 -
       (safe_bolt_together_faceplate_ears == "Both Sides" ? 12:15.875));
    working_width_total = (rack_cage_width_required * 25.4) -
       (safe_bolt_together_faceplate_ears == "One Side" ? 12:15.875) -
       (safe_bolt_together_faceplate_ears == "Both Sides" ? 12:15.875);


    // Cage horizontal offset, for shifting the cage to one side. We need to
    // sanity check this to avoid the user pushing the cage off the side of
    // the faceplate.  
    
    // Is the offset small enough to keep the cage inside the safe working area of the 
    // faceplate? If not, we should probably warn about it.
    outer_horizontal_edge = total_width_required / 2;
    if (
         ((cage_horizontal_offset > 0) && (outer_horizontal_edge + cage_horizontal_offset > working_width_a))
         ||
         ((cage_horizontal_offset < 0) && (0 - outer_horizontal_edge + cage_horizontal_offset < working_width_b))
       )
    {
        echo();
        echo();
        echo(" * * * WARNING! * * *");
        echo(" Cage HORIZONTAL offset exceeds safe distance, and would likely interfere with mounting in the rack.");
        echo(" Offset has been forced to zero. Double-check your offset settings.");
        echo();
        echo();

        check_console();
    }

    // When the offset sanity check fails, force the offset to zero.
    safe_cage_horizontal_offset = 0.00 + (faceplate_only == 0.0 ? (
      ((
        ((cage_horizontal_offset >= 0) && (outer_horizontal_edge + cage_horizontal_offset > working_width_a))
        ||
        ((cage_horizontal_offset < 0) && (0 - outer_horizontal_edge + cage_horizontal_offset < working_width_b))
      ) ? 0.00:cage_horizontal_offset)) : working_width_a);

    // Cage vertical offset, for shifting the cage up or down. We need to
    // sanity check this to avoid the user pushing the cage off the edge of
    // the faceplate.  
    outer_vertical_edge = (units_required * unit_height_in_mm) / 2;
    if (
         ((cage_vertical_offset >= 0) && ((total_height_required / 2) + cage_vertical_offset > outer_vertical_edge))
         ||
         ((cage_vertical_offset < 0) && (0 - (total_height_required / 2) + cage_vertical_offset < 0 - outer_vertical_edge))
       )
    {
        echo();
        echo();
        echo(" * * * WARNING! * * *");
        echo(" Cage VERTICAL offset exceeds safe distance, and would likely interfere with mounting in the rack.");
        echo(" Offset has been forced to zero. Double-check your offset settings.");
        echo();
        echo();

        check_console();
    }

    // When the offset sanity check fails, force the offset to zero.
    safe_cage_vertical_offset = 0.00 + (faceplate_only == 0.0 ? (
      ((
        ((cage_vertical_offset >= 0) && ((total_height_required / 2) + cage_vertical_offset > outer_vertical_edge))
        ||
        ((cage_vertical_offset < 0) && (0 - (total_height_required / 2) + cage_vertical_offset < 0 - outer_vertical_edge))
      ) ? 0.00:cage_vertical_offset)) : 0.0);


    // Mod slot sanity checking, to make sure faceplate modifications will
    // both fit on the faceplate and not interfere with the cage.    


    // If we're only generating a faceplate and not a full cage, sanity-check the centered
    // mod to ensure it fits within the faceplate's height/width.
    if (faceplate_only != 0.0)
    {
        if (centered_mod_type != "None")
        {        
            if ((centered_mod_width * centered_mod_grid_columns) > working_width_total)
            {
                echo();
                echo();
                echo(" * * * WARNING! * * *");
                echo(" Centered mod's width exceeds safe distance, and would likely interfere with mounting in the rack.");
                echo(" Centered mod has been disabled. Double-check your mod settings.");
                echo();
                echo(); 

                check_console();
            }
            else if ((centered_mod_height * centered_mod_grid_rows) >= units_required * unit_height_in_mm - (reinforce_faceplate ? plate_thickness * 2 : 0))
            {
                echo();
                echo();
                echo(" * * * WARNING! * * *");
                echo(" Centered mod's vertical size exceeds the faceplate's height and won't fit.");
                echo(" Centered mod has been disabled. Double-check your faceplate/cage height settings.");
                echo();
                echo();

                check_console();
            }
        }
    }

    safe_centered_mod_type = 
      ((
        (faceplate_only == 0.0)
        ||
        ((centered_mod_width * centered_mod_grid_columns) > working_width_total)
        ||
        ((centered_mod_height * centered_mod_grid_rows) >= units_required * unit_height_in_mm - (reinforce_faceplate ? plate_thickness * 2 : 0))
      ) ? "None":centered_mod_type);


    // Determine the open (slack) space on either side of the cage - this will
    // be used to find a default location for modifications, if there's room.
    slack_space_a = working_width_a - outer_horizontal_edge - (faceplate_only == 0.0 ? safe_cage_horizontal_offset : (safe_centered_mod_type != "None" ? centered_mod_width / 2:0.0));
    slack_space_b = working_width_b + outer_horizontal_edge - (faceplate_only == 0.0 ? safe_cage_horizontal_offset : (safe_centered_mod_type != "None" ? centered_mod_width / 2:0.0));

    // Create a "safe" offset value for the modification, if possible. This is
    // basically a way to sidestep the inability to change the value of a
    // variable, as OpenSCAD treats most variables as constant.

    // First, the left-side mod.
    safe_left_side_mod_horizontal_offset = 0.00 +
      ((
        (left_side_mod_horizontal_offset == 0.00) 
        &&
        (slack_space_a <= abs(slack_space_b)) // That equals makes mod two prioritize the negative-X axis over positive-X.
        &&
        (abs(slack_space_b) > left_side_mod_width)
        &&
        (0 - outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0) + (slack_space_b / 2) - (left_side_mod_width / 2) > working_width_b)
      ) ? round(0 - outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0) + (slack_space_b / 2)):0.00)
      +
      ((
        (left_side_mod_horizontal_offset == 0.00) 
        &&
        (slack_space_a > abs(slack_space_b))
        &&
        (slack_space_a > left_side_mod_width)
        &&
        (right_side_mod_type == "None")
        &&
        (outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0) + (slack_space_a / 2) + (left_side_mod_width / 2) < working_width_a)
      ) ? round(outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0) + (slack_space_a / 2)):0.00)
      +
      ((
         ((left_side_mod_horizontal_offset > 0) && (left_side_mod_horizontal_offset + (left_side_mod_width / 2) > working_width_a))
         ||
         ((left_side_mod_horizontal_offset < 0) && (left_side_mod_horizontal_offset - (left_side_mod_width / 2) < working_width_b))
         ||
         ((left_side_mod_horizontal_offset > 0) && (left_side_mod_horizontal_offset - (left_side_mod_width / 2) < outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0)))
         ||
         ((left_side_mod_horizontal_offset < 0) && (left_side_mod_horizontal_offset + (left_side_mod_width / 2) > 0 - outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0)))
       ) ? 0.00:left_side_mod_horizontal_offset); 
          
    // If we cannot set a safe offset for the modification, or it's too tall to
    // fit within the height of the completed cage, throw an alert.
    if (left_side_mod_type != "None")
    {        
        if (safe_left_side_mod_horizontal_offset == 0.00)
        {
            echo();
            echo();
            echo(" * * * WARNING! * * *");
            echo(" Left-side mod's offset exceeds safe distance, and would likely interfere with either the cage proper or mounting in the rack.");
            echo(" Left-side mod has been disabled. Double-check your height settings.");
            echo();
            echo();

            check_console();
        }
        else if (
            (((left_side_mod_height * left_side_mod_grid_rows) / 2) + 0 + left_side_mod_vertical_offset >= (units_required * unit_height_in_mm) / 2 - (reinforce_faceplate ? plate_thickness : 0.00))
            ||
            (0 - (((left_side_mod_height * left_side_mod_grid_rows) / 2) - 0 - left_side_mod_vertical_offset) <= 0 - (units_required * unit_height_in_mm) / 2 - (reinforce_faceplate ? plate_thickness : 0.00))
          )
        {
            echo();
            echo();
            echo(" * * * WARNING! * * *");
            echo(" Left-side mod's vertical size/offset exceeds the faceplate's height and won't fit.");
            echo(" Left-side mod has been disabled. Double-check your offset settings.");
            echo();
            echo();

            check_console();
        }
    }


    // Now the right-side mod...
    safe_right_side_mod_horizontal_offset = 0.00 +
      // If the mod's offset is zero, check to see if there's a good place to 
      // put it by default. we do this by seeing if there's room on either side.
      ((
        (right_side_mod_horizontal_offset == 0.00) 
        &&
        (slack_space_a >= abs(slack_space_b)) // That equals makes this mod prioritize the positive-X axis over negative-X.
        &&
        (slack_space_a > (right_side_mod_width * right_side_mod_grid_columns))
        &&
        (outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0) + (slack_space_a / 2) + ((right_side_mod_width * right_side_mod_grid_columns) / 2) < working_width_a)
      ) ? round(outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0) + (slack_space_a / 2)):0.00)
      +
      ((
        (right_side_mod_horizontal_offset == 0.00) 
        &&
        (slack_space_a < abs(slack_space_b))
        &&
        (abs(slack_space_b) > (right_side_mod_width * right_side_mod_grid_columns))
        &&
        (0 - outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0) + (-slack_space_b / 2) - ((right_side_mod_width * right_side_mod_grid_columns) / 2) > working_width_b)
      ) ? round(0 - outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0) + (-slack_space_b / 2)):0.00)
      +
      ((
         ((right_side_mod_horizontal_offset >= 0) && (right_side_mod_horizontal_offset + ((right_side_mod_width * right_side_mod_grid_columns) / 2) > working_width_a))
         ||
         ((right_side_mod_horizontal_offset < 0) && (right_side_mod_horizontal_offset - ((right_side_mod_width * right_side_mod_grid_columns) / 2) < working_width_b))
         ||
         ((right_side_mod_horizontal_offset >= 0) && (right_side_mod_horizontal_offset - ((right_side_mod_width * right_side_mod_grid_columns) / 2) < outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0)))
         ||
         ((right_side_mod_horizontal_offset < 0) && (right_side_mod_horizontal_offset + ((right_side_mod_width * right_side_mod_grid_columns) / 2) > 0 - outer_horizontal_edge + (faceplate_only == 0.0 ? safe_cage_horizontal_offset : 0.0)))
       ) ? 0.00:right_side_mod_horizontal_offset); 

    // If we cannot set a safe offset for the modification, or it's too tall to
    // fit within the height of the completed faceplate, throw an alert.
    if (right_side_mod_type != "None")
    {        
        if (safe_right_side_mod_horizontal_offset == 0.00)
        {
            echo();
            echo();
            echo(" * * * WARNING! * * *");
            echo(" Right-side mod's offset exceeds safe distance, and would likely interfere with either the cage proper or mounting in the rack.");
            echo(" Right-side mod has been disabled. Double-check your offset settings.");
            echo();
            echo(); 

            check_console();
        }
        else if (
            (((right_side_mod_height * right_side_mod_grid_rows) / 2) + 0 + right_side_mod_vertical_offset >= (units_required * unit_height_in_mm) / 2 - (reinforce_faceplate ? plate_thickness : 0.00))
            ||
            (0 - (((right_side_mod_height * right_side_mod_grid_rows) / 2) - 0 - right_side_mod_vertical_offset) <= 0 - (units_required * unit_height_in_mm) / 2 - (reinforce_faceplate ? plate_thickness : 0.00))
          )
        {
            echo();
            echo();
            echo(" * * * WARNING! * * *");
            echo(" Right-side mod's vertical size/position exceeds the faceplate's height and won't fit.");
            echo(" Right-side mod has been disabled. Double-check your height settings.");
            echo();
            echo();

            check_console();
        }
    }


    // If we have a mod enabled but its offset is zero, which means the sanity
    // check failed, disable that mod. Likewise if it's too tall to fit the
    // cage vertically.
    safe_right_side_mod_type = 
      ((
        (safe_right_side_mod_horizontal_offset == 0.00)
        ||
        (((right_side_mod_height * right_side_mod_grid_rows) / 2) + 0 + right_side_mod_vertical_offset >= (units_required * unit_height_in_mm) / 2 - (reinforce_faceplate ? plate_thickness : 0.00))
        ||
        (0 - (((right_side_mod_height * right_side_mod_grid_rows) / 2) - 0 - right_side_mod_vertical_offset) <= 0 - (units_required * unit_height_in_mm) / 2 - (reinforce_faceplate ? plate_thickness : 0.00))
      ) ? "None":right_side_mod_type);
    safe_left_side_mod_type = 
      ((
        (safe_left_side_mod_horizontal_offset == 0.00)
        ||
        (((left_side_mod_height * left_side_mod_grid_rows) / 2) + 0 + left_side_mod_vertical_offset >= (units_required * unit_height_in_mm) / 2 - (reinforce_faceplate ? plate_thickness : 0.00))
        ||
        (0 - (((left_side_mod_height * left_side_mod_grid_rows) / 2) - 0 - left_side_mod_vertical_offset) <= 0 - (units_required * unit_height_in_mm) / 2 - (reinforce_faceplate ? plate_thickness : 0.00))
      ) ? "None":left_side_mod_type);


    // Sanity-check for rounded corners
    safe_faceplate_rounded_corners = ((faceplate_rounded_corners < (device_height / 2) - 2 && (faceplate_rounded_corners < (device_width / 2) - 2)) ? faceplate_rounded_corners : 0.001);
    if (safe_faceplate_rounded_corners == 0.001)
    {
        echo();
        echo();
        echo(" * * * WARNING! * * *");
        echo(" Rounded-corner setting exceeds safe boundaries for this size device.");
        echo(" Rounded-corner setting has been set to zero. Double-check your settings.");
        echo();
        echo();

        check_console();
    }


    // Helper variables
    rack_cage_width_required_mm = rack_cage_width_required * 25.4;


    //  Time to build the rack cage. Let's get to it!  
    translate([0,
      // The Y height gets shifted if we're generating the cage separately or
      // generating a rear support cage.
      (
        (
          (print_cage_separately)
          &&
          (!split_cage_into_two_halves)
          &&
          (faceplate_only == 0.0)
        )
        ||
        (
          (generate_rear_support_cage)
          &&
          (!print_cage_separately)
          &&
          (!split_cage_into_two_halves)
          && (faceplate_only == 0.0)
        )
        ? 0 - (units_required * unit_height_in_mm) / 2 - 10 : 0
      ), 0])
    {
        // Note that we're doing difference/union/difference/union, with the inner two
        // being what creates the cage proper, and the outer two acting as post-
        // processing on the completed cage "assembly."
        //
        // Post-processing...
        difference()
        {
            union()
            {
                // The cage proper...
                difference()
                {
                    union()
                    {
                        // Create the faceplate.
                            create_blank_faceplate(rack_cage_width_required, units_required, safe_bolt_together_faceplate_ears);


                        // Optionally create a ruler if we're not rendering or doing a split cage.
                        if ((show_ruler) && ($preview) && (!split_cage_into_two_halves))
                        {
                            for (i= [0 - ceil((rack_cage_width_required_mm / 2) / 5) * 5:5:ceil((rack_cage_width_required_mm / 2) / 5) * 5])
                            {
                                translate([i, 0, 6 + heavy_device])
                                {
                                    if (i % 10 == 0)
                                        color("red")
                                            cube([0.1, units_required * unit_height_in_mm + 10, 1.5], center=true);
                                    else
                                        color("maroon")
                                            cube([0.1, units_required * unit_height_in_mm + 3, 1], center=true);
                                    if (i % 25 == 0)
                                    {
                                        translate([i / (rack_cage_width_required_mm / 2), (units_required * unit_height_in_mm) / 2 + 9, 0 + heavy_device])
                                            color("red")
                                                linear_extrude(height=1, center=true)
                                                    text(str(i), halign="center", valign="center", size=5);   
                                        translate([i / (rack_cage_width_required_mm / 2), 0 - (units_required * unit_height_in_mm) / 2 - 9, 0 + heavy_device])
                                            color("red")
                                                linear_extrude(height=1, center=true)
                                                    text(str(i), halign="center", valign="center", size=5);
                                        translate([i / (rack_cage_width_required_mm / 2),  (units_required * unit_height_in_mm) / 2 + 9, -1 + heavy_device])
                                            color("white")
                                                four_rounded_corner_plate(10, 16, 1, 2.5);
                                        translate([i / (rack_cage_width_required_mm / 2), 0 - (units_required * unit_height_in_mm) / 2 - 9, -1 + heavy_device])
                                            color("white")
                                                four_rounded_corner_plate(10, 16, 1, 2.5);
                                    }
                                }
                            }

                            for (i= [0 - ceil(((units_required * unit_height_in_mm) / 2) / 5) * 5:5:ceil(((units_required * unit_height_in_mm) / 2) / 5) * 5])
                            {
                                translate([0, i, 6 + heavy_device])
                                {
                                    if (i % 10 == 0)
                                        color("green")
                                            cube([rack_cage_width_required_mm + 10, 0.1, 1.5], center=true);
                                    else
                                        color("darkgreen")
                                            cube([rack_cage_width_required_mm + 3, 0.1, 1], center=true);
                                    if (i % 25 == 0)
                                    {
                                        translate([(rack_cage_width_required_mm / 2) + 12, i / (units_required * unit_height_in_mm / 2), 0 + heavy_device])
                                            color("green")
                                                linear_extrude(height=1, center=true)
                                                    text(str(i), halign="center", valign="center", size=5);   
                                        translate([(0 - rack_cage_width_required_mm / 2) - 12, i / ( units_required * unit_height_in_mm / 2 - 9), 0 + heavy_device])
                                            color("green")
                                                linear_extrude(height=1, center=true)
                                                    text(str(i), halign="center", valign="center", size=5);
                                        translate([(rack_cage_width_required_mm / 2) + 12,  i / (units_required * unit_height_in_mm / 2 + 9), -1 + heavy_device])
                                            color("white")
                                                four_rounded_corner_plate(10, 16, 1, 2.5);
                                        translate([0 - (rack_cage_width_required_mm / 2) - 12,  i / (units_required * unit_height_in_mm / 2 + 9), -1 + heavy_device])
                                            color("white")
                                                four_rounded_corner_plate(10, 16, 1, 2.5);
                                    }
                                }
                            }

                            // Show a height marker to indicate the Z-axis required to print the cage
                            if (faceplate_only == 0.0)
                            {
                                translate([0, (((print_cage_separately) && (!split_cage_into_two_halves)) ? (((units_required * unit_height_in_mm) / 2) + (total_height_required / 2) + 5):0), (((print_cage_separately) && (!split_cage_into_two_halves)) ? (7 + total_depth_required):(total_depth_required + 12 + heavy_device)) + (add_retention_lip ? 1:0)])
                                    color("blue")
                                        cube([ceil(rack_cage_width_required_mm / 5) * 5 , 1, 1], center=true);
                                translate([ceil((rack_cage_width_required_mm / 2) / 5) * 5 + 2, (((print_cage_separately) && (!split_cage_into_two_halves)) ? (((units_required * unit_height_in_mm) / 2) + (total_height_required / 2) + 5 + 4):4), total_depth_required + (((print_cage_separately) && (!split_cage_into_two_halves)) ? 8:14 + heavy_device) + (add_retention_lip ? 1:0)])
                                    color("blue")
                                        linear_extrude(height=1, center=true)
                                            text(str((((print_cage_separately) && (!split_cage_into_two_halves)) ? (4 + total_depth_required + 3.5):(total_depth_required + 12 + heavy_device)) + (add_retention_lip ? 1:0), "mm"), halign="left", valign="center", size=5);   
                                translate([ceil((rack_cage_width_required_mm / 2) / 5) * 5 + 2, (((print_cage_separately) && (!split_cage_into_two_halves)) ? (((units_required * unit_height_in_mm) / 2) + (total_height_required / 2) + 1):-4), total_depth_required + (((print_cage_separately) && (!split_cage_into_two_halves)) ? 8:14 + heavy_device) + (add_retention_lip ? 1:0)])
                                    color("blue")
                                        linear_extrude(height=1, center=true)
                                            text("PRINT HEIGHT", halign="left", valign="center", size=5);   
                                translate([ceil((rack_cage_width_required_mm / 2) / 5) * 5 + 26, (((print_cage_separately) && (!split_cage_into_two_halves)) ? (((units_required * unit_height_in_mm) / 2) + (total_height_required / 2) + 5):0), total_depth_required + (((print_cage_separately) && (!split_cage_into_two_halves)) ? 7:13 + heavy_device) + (add_retention_lip ? 1:0)])
                                        color("white")
                                            four_rounded_corner_plate(18, 56, 1, 5);

                                // Show markers to indicate where the cage is centered.
                                translate([safe_cage_horizontal_offset, 0, 19])
                                    color("blue")
                                        cube([1, (units_required * unit_height_in_mm) + 15, 1], center=true);
                                translate([safe_cage_horizontal_offset, 0 - (units_required * unit_height_in_mm) / 2 - 13, 20])
                                    color("blue")
                                        linear_extrude(height=1, center=true)
                                            text(str(safe_cage_horizontal_offset), halign="center", valign="center", size=5);   
                                translate([safe_cage_horizontal_offset, 0 - (units_required * unit_height_in_mm) / 2 - 20, 20])
                                    color("blue")
                                        linear_extrude(height=1, center=true)
                                            text("CAGE H CENTER", halign="center", valign="center", size=5);   
                                translate([safe_cage_horizontal_offset, 0 - (units_required * unit_height_in_mm) / 2 - 17, 19])
                                        color("white")
                                            four_rounded_corner_plate(18, 60, 1, 5);

                                translate([0, safe_cage_vertical_offset, 19])
                                    color("darkblue")
                                        cube([rack_cage_width_required_mm + 15, 1, 1], center=true);
                                translate([0 - rack_cage_width_required_mm / 2 - 13, safe_cage_vertical_offset + 4, 20])
                                    color("darkblue")
                                        linear_extrude(height=1, center=true)
                                            text(str(safe_cage_vertical_offset), halign="right", valign="center", size=5);   
                                        cube([rack_cage_width_required_mm + 15, 1, 1], center=true);
                                translate([0 - rack_cage_width_required_mm / 2 - 13, safe_cage_vertical_offset - 4, 20])
                                    color("darkblue")
                                        linear_extrude(height=1, center=true)
                                            text("CAGE V CENTER", halign="right", valign="center", size=5);   
                                translate([0 - rack_cage_width_required_mm / 2 - 41, safe_cage_vertical_offset, 19])
                                        color("white")
                                            four_rounded_corner_plate(18, 62, 1, 5);
                            }

                            // Show markers to indicate which way is "up" for the cage.
                            translate([0, 0 - (units_required * unit_height_in_mm) / 2 - 30, 0])
                                color("red")
                                    linear_extrude(height=1, center=true)
                                        text("CAGE TOP", halign="center", valign="center", size=5);
                            translate([0, 0 - (units_required * unit_height_in_mm) / 2 - 30, -1])
                                            color("white")
                                                four_rounded_corner_plate(10, 50, 1, 2.5);
                            translate([0, 0 - (units_required * unit_height_in_mm) / 2 - 30, -1])
                            rotate([0, 180, 180])
                                color("red")
                                    linear_extrude(height=1, center=true)
                                        text("CAGE TOP", halign="center", valign="center", size=5);

                            // Show the cage's height in units.
                            translate([(rack_cage_width_required_mm / 2) + 25, 4, 0 + heavy_device])
                                color("green")
                                    linear_extrude(height=1, center=true)
                                        text(str(units_required, "U"), halign="left", valign="center", size=5);   
                            translate([(rack_cage_width_required_mm / 2) + 25, -4, 0 + heavy_device])
                                color("green")
                                    linear_extrude(height=1, center=true)
                                        text("UNIT HEIGHT", halign="left", valign="center", size=5);
                            translate([(rack_cage_width_required_mm / 2) + 46, 0, -1 + heavy_device])
                                color("white")
                                    four_rounded_corner_plate(20, 50, 1, 2.5);


                            // Show an outline for build volumes by creating a cube and
                            // carving it out.
                            if (show_build_outline > 0)
                                translate([0, ((((print_cage_separately)&& (!split_cage_into_two_halves)) || (generate_rear_support_cage))  ? (units_required * unit_height_in_mm) / 2 + 10:0), 0])
                                {
                                    color("maroon")
                                        difference()
                                        {
                                            translate([0, 0, show_build_outline / 2 + 0.01])
                                                cube([show_build_outline, show_build_outline, show_build_outline], center=true);
                                            
                                            translate([5, 0, show_build_outline / 2])
                                                cube([show_build_outline * 1.1, show_build_outline - 1, show_build_outline - 1], center=true);
                                            translate([0, 5, show_build_outline / 2])
                                                cube([show_build_outline - 1, show_build_outline * 1.1, show_build_outline - 1], center=true);
                                            translate([0, 0, show_build_outline / 2])
                                                cube([show_build_outline - 1, show_build_outline - 1, show_build_outline * 1.1], center=true);
                                            
                                        }
                                    translate([0, 0 - (show_build_outline / 2) - 10, 1])
                                        color("blue")
                                            linear_extrude(height=1, center=true)
                                                text(str(show_build_outline, "mm (CUBED) BUILD VOLUME"), halign="center", valign="center", size=5);   
                                    translate([0, 0 - (show_build_outline / 2) - 10, 0])
                                            color("white")
                                                four_rounded_corner_plate(10, 120, 1, 2.5);
                        
                                }
                        }


                        if ((device_width > 0) && (device_height > 0) && (faceplate_only == 0.0))
                        {
                            // Create a reinforcing block behind the faceplate centered on
                            // where we will cut out the opening for the device.
                            for (index = [0:number_of_devices - 1])
                            {
                                translate([safe_cage_horizontal_offset + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 5 + heavy_device + (split_cage_into_two_halves ? 5 - (heavy_device / 2):1)])
                                    cube([device_width + (support_cage_base_size + (support_cage_heavy_device_multiplier * heavy_device)), total_height_required, 10 + heavy_device + (split_cage_into_two_halves ? 5 - (heavy_device / 2):0)], center=true);
                            }
                        

                            // Create the cage proper, or if making a detached cage, add
                            // reinforcing blocks to the corners to support its legs.
                            if ((!print_cage_separately) || (split_cage_into_two_halves))
                            {
                                for (index = [0:number_of_devices - 1])
                                    create_detached_cage(safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)), safe_cage_vertical_offset, 0);
                            }
                            else
                            {
                                translate([(total_width_required / 2) + safe_cage_horizontal_offset - (support_cage_base_size / 2) + 2 - (heavy_device / 1.5), (total_height_required / 2) + safe_cage_vertical_offset - 8 - (heavy_device / 2), 14])
                                    cube([16 + heavy_device, 16 + heavy_device, 24], center=true);
                                translate([0 - ((total_width_required / 2) + safe_cage_horizontal_offset - (support_cage_base_size / 2) - 1.5 + (support_cage_base_size - 11) + (heavy_device / 1.5)), (total_height_required / 2) + safe_cage_vertical_offset - 8 - (heavy_device / 2), 14])
                                    cube([16 + heavy_device, 16 + heavy_device, 24], center=true);
                                translate([(total_width_required / 2) + safe_cage_horizontal_offset - (support_cage_base_size / 2) + 2 - (heavy_device / 1.5), 0 - (total_height_required / 2) + safe_cage_vertical_offset + 8 + (heavy_device / 2), 14])
                                    cube([16 + heavy_device, 16 + heavy_device, 24], center=true);
                                translate([0 - ((total_width_required / 2) + safe_cage_horizontal_offset - (support_cage_base_size / 2) - 1.5 + (support_cage_base_size - 11) + (heavy_device / 1.5)), 0 - (total_height_required / 2) + safe_cage_vertical_offset + 8 + (heavy_device / 2), 14])
                                    cube([16 + heavy_device, 16 + heavy_device, 24], center=true);

                                // If creating a detached cage that will hold more than
                                // one device, add support blocks between each device.
                                if (number_of_devices > 1)
                                    for (index = [1:number_of_devices - 1])
                                    {
                                        translate([safe_cage_horizontal_offset - (total_width_required / 2) - multiple_device_gap + 5 + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)), (total_height_required / 2) + safe_cage_vertical_offset - 8 - (heavy_device / 2), 14])
                                            cube([18 + heavy_device, 16 + heavy_device, 15], center=true);
                                        translate([safe_cage_horizontal_offset - (total_width_required / 2) - multiple_device_gap + 5 +((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)), 0 - (total_height_required / 2) + safe_cage_vertical_offset + 8 + (heavy_device / 2), 14])
                                            cube([18 + heavy_device, 16 + heavy_device, 15], center=true);

                                        translate([safe_cage_horizontal_offset - (total_width_required / 2) + 5 + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)), (total_height_required / 2) + safe_cage_vertical_offset - 8 - (heavy_device / 2), 14])
                                            cube([18 + heavy_device, 16 + heavy_device, 15], center=true);
                                        translate([safe_cage_horizontal_offset - (total_width_required / 2) + 5 + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)), 0 - (total_height_required / 2) + safe_cage_vertical_offset + 8 + (heavy_device / 2), 14])
                                            cube([18 + heavy_device, 16 + heavy_device, 15], center=true);
                                    }

                                if (extra_support)
                                    for (index = [0:number_of_devices - 1])
                                    {
                                        translate([-9 + safe_cage_horizontal_offset + 9 + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), 0 - (total_height_required / 2) + safe_cage_vertical_offset + 8 + (heavy_device / 2), 15])
                                            cube([38 + heavy_device, 16 + heavy_device, 15], center=true);
                                        translate([-9 + safe_cage_horizontal_offset + 9 + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), -18 + (total_height_required / 2) + safe_cage_vertical_offset + 10 - (heavy_device / 2), 15])
                                            cube([38 + heavy_device, 16 + heavy_device, 15], center=true);
                                    }
                            }
                        }



                        // Handle faceplate ventilation grid restrictions if enabled. Note
                        // that we will center restrictions on the cage, shifting them to
                        // keep with any offsets as required.
                        if ((faceplate_vent_hole_pattern != "None") && (faceplate_vent_position != "All") && (faceplate_only == 0.0))
                            translate([(faceplate_vent_position == "S" ? safe_cage_horizontal_offset + 3:0), (faceplate_vent_position == "TB" ? safe_cage_vertical_offset:0), plate_thickness / 2])
                                cube([(faceplate_vent_position == "S" ? total_width_required:rack_cage_width_required_mm - 32), (faceplate_vent_position == "TB" ? total_height_required:(units_required * unit_height_in_mm) - 2), plate_thickness], center=true);

                        // Split cage with ventilation - create a seam at the split so
                        // the ventilation grid isn't floating.
                        if ((faceplate_vent_hole_pattern != "None") && (split_cage_into_two_halves) && (faceplate_only == 0.0))
                        {
                            translate([0, 0, plate_thickness / 2])
                                cube([12, units_required * unit_height_in_mm - 2, plate_thickness], center=true);
                        }



                        // Additional faceplate modifications - additions

                        // RIGHT mod slot
                        // Show an offset marker to point to the offset from center where 
                        // the modification is centered.
                        if (safe_right_side_mod_type != "None")
                        {
                            mod_offset_marker(safe_right_side_mod_horizontal_offset, 19, units_required);
                            faceplate_mod_addition(safe_right_side_mod_type, safe_right_side_mod_horizontal_offset, right_side_mod_vertical_offset, right_side_mod_width, right_side_mod_height, right_side_mod_grid_rows, right_side_mod_grid_columns);
                        }

                        // LEFT mod slot
                        if (safe_left_side_mod_type != "None")
                        {
                            mod_offset_marker(safe_left_side_mod_horizontal_offset, 19, units_required);
                            faceplate_mod_addition(safe_left_side_mod_type, safe_left_side_mod_horizontal_offset, left_side_mod_vertical_offset, left_side_mod_width, left_side_mod_height, left_side_mod_grid_rows, left_side_mod_grid_columns);
                        }

                        // Centered mod - requires faceplate only without a cage
                        if ((faceplate_only != 0.0) && (safe_centered_mod_type != "None"))
                            faceplate_mod_addition(safe_centered_mod_type, 0, 0, centered_mod_width, centered_mod_height, centered_mod_grid_rows, centered_mod_grid_columns);

                    } // union end



                    // Carve out the device area, leaving a retention lip if the
                    // option for this is enabled.
                    if (faceplate_only == 0.0)
                        for (index = [0:number_of_devices - 1])
                        {
                            translate([safe_cage_horizontal_offset + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, (device_depth + device_clearance) / 2 - 1])
                                linear_extrude(device_depth + device_clearance - (add_retention_lip ? 4:0), center=true)
                                    offset(r=safe_faceplate_rounded_corners, $fn=this_fn)
                                        square([device_width + device_clearance - (safe_faceplate_rounded_corners * 2), device_height + device_clearance - (safe_faceplate_rounded_corners * 2)], center=true);


                            if (add_retention_lip)
                            {
                                translate([safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, (device_depth + device_clearance) / 2 - 2])
                                    linear_extrude(device_depth + device_clearance, center=true)
                                        offset(r=safe_faceplate_rounded_corners, $fn=this_fn)
                                            square([device_width + device_clearance - 2 - (safe_faceplate_rounded_corners * 2), device_height + device_clearance - 2 - (safe_faceplate_rounded_corners * 2)], center=true);
                            }
                        }


                        // Carve out slots for the detached cage if we're printing the cage separately
                        if ((print_cage_separately) && (!split_cage_into_two_halves) && (faceplate_only == 0.0))
                        {
                            for (index = [0:number_of_devices - 1])
                            {
                                translate(v=[0, 0, 0 - heavy_device - (add_retention_lip ? 0.5:0)])
                                    create_detached_cage(safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, snap_fit_tolerance);

                                // Create 1.75mm pin holes in the legs for locking pins, assuming we're
                                // making a separated cage.
                                if ((print_cage_separately) && (!split_cage_into_two_halves))
                                {
                                    translate([safe_cage_horizontal_offset-((device_width + device_clearance) / 2) - heavy_device - 4 - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), (device_height + device_clearance) / 2 + safe_cage_vertical_offset, 19 - heavy_device - (add_retention_lip ? 0.5:0)])
                                        rotate([135, 90, 0])
                                            cylinder(h=30, d=1.76, center=true, $fn=this_fn);
                                    translate([safe_cage_horizontal_offset-((device_width + device_clearance) / 2) - heavy_device - 4 - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), 0 - ((device_height + device_clearance) / 2 - safe_cage_vertical_offset), 19 - heavy_device - (add_retention_lip ? 0.5:0)])
                                        rotate([45, 90, 0])
                                            cylinder(h=30, d=1.76, center=true, $fn=this_fn);
                                    translate([safe_cage_horizontal_offset+((device_width + device_clearance) / 2) + heavy_device + 4 - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), (device_height + device_clearance) / 2 + safe_cage_vertical_offset, 19 - heavy_device - (add_retention_lip ? 0.5:0)])
                                        rotate([45, 90, 0])
                                            cylinder(h=30, d=1.76, center=true, $fn=this_fn);
                                    translate([safe_cage_horizontal_offset+((device_width + device_clearance) / 2) + heavy_device + 4 - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), 0 - ((device_height + device_clearance) / 2 - safe_cage_vertical_offset), 19 - heavy_device - (add_retention_lip ? 0.5:0)])
                                        rotate([135, 90, 0])
                                            cylinder(h=30, d=1.76, center=true, $fn=this_fn);

                                    translate([0 - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), (device_height + device_clearance) / 2 + safe_cage_vertical_offset + 2.5, 19 - heavy_device - (add_retention_lip ? 0.5:0)])
                                        rotate([0, 90, 0])
                                            cylinder(h=60, d=1.76, center=true, $fn=this_fn);
                                    translate([0 - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), 0 - ((device_height + device_clearance) / 2 - safe_cage_vertical_offset) -  2.5, 19 - heavy_device - (add_retention_lip ? 0.5:0)])
                                        rotate([0, 90, 0])
                                            cylinder(h=60, d=1.76, center=true, $fn=this_fn);
                                }
                            }
                        }



                    // Additional faceplate modifications - subtractions
                    // Right mod slot
                    if (safe_right_side_mod_type != "None")
                        faceplate_mod_subtraction(safe_right_side_mod_type, safe_right_side_mod_horizontal_offset, right_side_mod_vertical_offset, right_side_mod_width, right_side_mod_height, right_side_mod_grid_rows, right_side_mod_grid_columns);

                    // Left mod slot
                    if (safe_left_side_mod_type != "None")
                        faceplate_mod_subtraction(safe_left_side_mod_type, safe_left_side_mod_horizontal_offset, left_side_mod_vertical_offset, left_side_mod_width, left_side_mod_height, left_side_mod_grid_rows, left_side_mod_grid_columns);

                    // Centered mod - requires faceplate only without a cage
                    if ((faceplate_only != 0.0) && (safe_centered_mod_type != "None"))
                        faceplate_mod_subtraction(safe_centered_mod_type, 0, 0, centered_mod_width, centered_mod_height, centered_mod_grid_rows, centered_mod_grid_columns);

                } // difference end



                // Post-processing! Union/difference operations below this point are 
                // performed on the completed cage.



                // Mounting holes (subrack support) - centered - additions
                if ((narrow_edge_centered_holes != 0.00) && (faceplate_only == 0.00))
                {
                    for (index = [0:number_of_devices - 1])
                    {
                        // Determine which edge is the shorter
//                        if (device_width > device_height)
//                        {
//                            translate([0 - safe_cage_horizontal_offset - (total_width_required / 2) + (7 + heavy_device) + (device_width - heavy_device / 2) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 5])
//                                cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
//                            translate([safe_cage_horizontal_offset - (total_width_required / 2) + (7 + heavy_device) - (heavy_device / 2) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 5])
//                                cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
//                        }
//                        else
//                        {
//                            translate([safe_cage_horizontal_offset - (total_width_required / 2) + (7 + heavy_device) + (device_width / 2) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)), 0 + safe_cage_vertical_offset - (device_height / 2) + ((support_cage_base_size - 8) / 2), 5])
//                                cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
//                            translate([safe_cage_horizontal_offset - (total_width_required / 2) + (7 + heavy_device) + (device_width / 2) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)), safe_cage_vertical_offset + (device_height / 2) + ((support_cage_base_size - 8) / 2), 5])
//                                cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
//                        }
                    
                        // Determine which edge is the shorter
                        if (device_width > device_height)
                        {
                            translate([0 - safe_cage_horizontal_offset - (device_width / 2) - (device_width / 2) - (total_width_required / 2) + (device_width - heavy_device / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 5])
                                cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                            translate([safe_cage_horizontal_offset + (device_width / 2) - (device_width / 2) - (total_width_required / 2) + (device_width - heavy_device / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 5])
                                cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                        }
                        else
                        {
                            translate([safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), 0 + safe_cage_vertical_offset - (device_height / 2), 5])
                                cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                            translate([safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset + (device_height / 2), 5])
                                cylinder(h=10, d=narrow_edge_centered_holes * 2.5, center=true, $fn=this_fn);
                        }
                    }
                }

                // Mounting holes (subrack support) - corners - additions
                if ((edge_corner_holes != 0.00) && (faceplate_only == 0.00))
                {
                    for (index = [0:number_of_devices - 1])
                    {
                        translate([0 + safe_cage_horizontal_offset - (device_width / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), 0 + safe_cage_vertical_offset - (device_height / 2), 5])
                            cylinder(h=10, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([safe_cage_horizontal_offset + (device_width / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), 0 + safe_cage_vertical_offset - (device_height / 2), 5])
                            cylinder(h=10, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([0 + safe_cage_horizontal_offset - (device_width / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset + (device_height / 2), 5])
                            cylinder(h=10, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                        translate([safe_cage_horizontal_offset + (device_width / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset + (device_height / 2), 5])
                            cylinder(h=10, d=edge_corner_holes * 2.5, center=true, $fn=this_fn);
                    }
                }
            } // union end

            // Mounting holes (subrack support) - centered - subtractions
            if ((narrow_edge_centered_holes != 0.00) && (faceplate_only == 0.00))
            {
                for (index = [0:number_of_devices - 1])
                {
                    // Determine which edge is the shorter
                    if (device_width > device_height)
                    {
                        translate([0 - safe_cage_horizontal_offset - (device_width / 2) - (device_width / 2) - (total_width_required / 2) + (device_width - heavy_device / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 5])
                            cylinder(h=12, d=narrow_edge_centered_holes, center=true, $fn=this_fn);
                        translate([safe_cage_horizontal_offset + (device_width / 2) - (device_width / 2) - (total_width_required / 2) + (device_width - heavy_device / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 5])
                            cylinder(h=12, d=narrow_edge_centered_holes, center=true, $fn=this_fn);
                    }
                    else
                    {
                        translate([safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), 0 + safe_cage_vertical_offset - (device_height / 2), 5])
                            cylinder(h=12, d=narrow_edge_centered_holes, center=true, $fn=this_fn);
                        translate([safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset + (device_height / 2), 5])
                            cylinder(h=12, d=narrow_edge_centered_holes, center=true, $fn=this_fn);
                    }


                    if ((print_cage_separately) && (!split_cage_into_two_halves) && (faceplate_only == 0.0))
                        create_detached_cage(safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 0);
                }
            }

            // Mounting holes (subrack support) - corners - subtractions
            if ((edge_corner_holes != 0.00) && (faceplate_only == 0.00))
            {
                for (index = [0:number_of_devices - 1])
                {
                    translate([0 + safe_cage_horizontal_offset - (device_width / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), 0 + safe_cage_vertical_offset - (device_height / 2), 5])
                        cylinder(h=12, d=edge_corner_holes, center=true, $fn=this_fn);
                    translate([safe_cage_horizontal_offset + (device_width / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), 0 + safe_cage_vertical_offset - (device_height / 2), 5])
                        cylinder(h=12, d=edge_corner_holes, center=true, $fn=this_fn);
                    translate([0 + safe_cage_horizontal_offset - (device_width / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset + (device_height / 2), 5])
                        cylinder(h=12, d=edge_corner_holes, center=true, $fn=this_fn);
                    translate([safe_cage_horizontal_offset + (device_width / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset + (device_height / 2), 5])
                        cylinder(h=12, d=edge_corner_holes, center=true, $fn=this_fn);


                    if ((print_cage_separately) && (!split_cage_into_two_halves) && (faceplate_only == 0.0))
                        create_detached_cage(safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index + (heavy_device / 2)) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 0);
                }
            }
        } // difference end
    } // translate end


    // Create the cage proper if doing so separately.
    if ((print_cage_separately) && (!split_cage_into_two_halves) && (faceplate_only == 0.0))
    {
        for (index = [0:number_of_devices - 1])
            translate([0 - safe_cage_horizontal_offset - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index) + ((support_cage_base_size - 8) / 2), total_height_required / 2 + 5 + safe_cage_vertical_offset, plate_thickness + total_depth_required + 7.5 + (add_retention_lip ? 1.5:0)])
                rotate([180, 0, 0])
                    create_detached_cage(safe_cage_horizontal_offset, safe_cage_vertical_offset, 0);
    }


    // If we're also creating a rear support bracket, generate this as well.
    if ((generate_rear_support_cage) && (!print_cage_separately) && (!split_cage_into_two_halves) && (faceplate_only == 0.0))
    {

        // Settings for rear support subcage, which attaches to the backside of a rack
        // to support longer/heavier items from behind so they cannot sag.
        rack_cage_depth = (total_depth_required + 12 + heavy_device) + (add_retention_lip ? 1:0);
        rear_support_depth = rack_total_depth - rack_cage_depth + rear_support_overlap + (plate_thickness * 2);

        translate([0, (units_required * unit_height_in_mm) / 2 + 10, 0])
        {
            difference()
            {
                union()
                {
                    // Create the rear-mount faceplate.
                    create_blank_faceplate(rack_cage_width_required, units_required, safe_bolt_together_faceplate_ears);

                    // Create a reinforcing block behind said faceplate.
                    for (index = [0:number_of_devices - 1])
                    {
                        translate([safe_cage_horizontal_offset + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), safe_cage_vertical_offset, 5 + heavy_device + (split_cage_into_two_halves ? 5 - (heavy_device / 2):0)])
                            cube([device_width + 4 + (support_cage_base_size + (support_cage_heavy_device_multiplier * heavy_device)), total_height_required, 10 + heavy_device + (split_cage_into_two_halves ? 5 - (heavy_device / 2):0)], center=true);
                    }


                    // Create two side plates to act as support panels.
                    for (index = [0:number_of_devices - 1])
                    {
                        translate([safe_cage_horizontal_offset + plate_thickness + (heavy_device / 2) - (total_width_required / 2) + (device_width) + (7.25 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), safe_cage_vertical_offset, rear_support_depth / 2])
                            rotate([0, 90, 0])
                                two_rounded_corner_plate(device_height + 0.02, rear_support_depth, plate_thickness + 0.5, support_radius);

                        translate([safe_cage_horizontal_offset - plate_thickness + (heavy_device / 2) - (total_width_required / 2) + (6.75 + heavy_device) - plate_thickness + ((device_width + plate_thickness + multiple_device_gap) * index) - 1, safe_cage_vertical_offset, rear_support_depth / 2])
                            rotate([0, 90, 0])
                                two_rounded_corner_plate(device_height + 0.02, rear_support_depth, plate_thickness + 0.5, support_radius);


                        // Create reinforcing bracing at right angles to the side plates.
                        translate([safe_cage_horizontal_offset + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), safe_cage_vertical_offset - (device_height / 2), rear_support_depth / 2 - 5])
                            rotate([0, 90, 90])
                                two_rounded_corner_plate(device_width + (plate_thickness * 2) + (heavy_device * 2) + 5, rear_support_depth - 10, plate_thickness, support_radius);

                        translate([safe_cage_horizontal_offset + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), safe_cage_vertical_offset + (device_height / 2) - plate_thickness, rear_support_depth / 2 - 5])
                            rotate([0, 90, 90])
                                two_rounded_corner_plate(device_width + (plate_thickness * 2) + (heavy_device * 2) + 5, rear_support_depth - 10, plate_thickness, support_radius);


                        // Create a reinforcing/butt block at the edge of the overlap area.
                        translate([safe_cage_horizontal_offset + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index) - 1, safe_cage_vertical_offset, rear_support_depth - rear_support_overlap - (plate_thickness / 2)])
                            cube([device_width + (plate_thickness * 2) + (heavy_device * 2) + 4, device_height, plate_thickness], center=true);
                    }

                    // TODO: If extra_support is enabled, create top and bottom supports as well.



                } // union end
                
                for (index = [0:number_of_devices - 1])
                {
                    // Carve out a passthrough for the device.
                    translate([safe_cage_horizontal_offset + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index), safe_cage_vertical_offset, rack_total_depth / 2 - 1])
                        cube([device_width + device_clearance, device_height + device_clearance,rack_total_depth + 20], center=true);
                    
                    // Carve out the overlap region where rear overlaps front.
                    translate([safe_cage_horizontal_offset + (heavy_device / 2) - (total_width_required / 2) + (device_width / 2) + (7 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index) - (device_clearance / 2), safe_cage_vertical_offset, rear_support_depth - (rear_support_overlap / 2) - 0.5])
                        cube([device_width + device_clearance + ((4 + heavy_device) * 2) + device_clearance, device_height + device_clearance, rear_support_overlap + 1], center=true);
                }

                // Carve out side ventilation from the side panels.
                if (rear_support_depth - rear_support_overlap - (plate_thickness * 2) > cutout_radius * 3)
                {
                    for (index = [0:number_of_devices - 1])
                    {
                        translate([safe_cage_horizontal_offset - 2 + plate_thickness + (heavy_device / 2) - (total_width_required / 2) + (device_width) + (7.25 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index) - 1, safe_cage_vertical_offset, ((rear_support_depth - rear_support_overlap - (plate_thickness * 3.5)) / 2) + 10 + heavy_device])
                            rotate([0, 90, 0])
                                four_rounded_corner_plate(device_height - (plate_thickness * 4), rear_support_depth - rear_support_overlap - (plate_thickness * 6),  plate_thickness + 4, cutout_radius);
                        
                        translate([0 - (safe_cage_horizontal_offset + 2 + (plate_thickness * 2.1) + (heavy_device / 2) - (total_width_required / 2) + (device_width) + (7.25 + heavy_device) + ((device_width + plate_thickness + multiple_device_gap) * index)), safe_cage_vertical_offset, ((rear_support_depth - rear_support_overlap - (plate_thickness * 3.5)) / 2) + 10 + heavy_device])
                            rotate([0, 90, 0])
                                four_rounded_corner_plate(device_height - (plate_thickness * 4), rear_support_depth - rear_support_overlap - (plate_thickness * 6),  plate_thickness + 4, cutout_radius);
                    }
                }
            } // difference end

            // Display print height marker if ruler is enabled.
            if ((show_ruler) && ($preview))
            {
                translate([0, (((print_cage_separately) && (!split_cage_into_two_halves)) ? (((units_required * unit_height_in_mm) / 2) + (total_height_required / 2) + 5):0), rear_support_depth])
                    color("blue")
                        cube([ceil(rack_cage_width_required_mm / 5) * 5 , 1, 1], center=true);
                translate([ceil((rack_cage_width_required_mm / 2) / 5) * 5 + 2, (((print_cage_separately) && (!split_cage_into_two_halves)) ? (((units_required * unit_height_in_mm) / 2) + (total_height_required / 2) + 5 + 4):4), rear_support_depth])
                    color("blue")
                        linear_extrude(height=1, center=true)
                            text(str(rear_support_depth, "mm"), halign="left", valign="center", size=5);   
                translate([ceil((rack_cage_width_required_mm / 2) / 5) * 5 + 2, (((print_cage_separately) && (!split_cage_into_two_halves)) ? (((units_required * unit_height_in_mm) / 2) + (total_height_required / 2) + 1):-4), rear_support_depth])
                    color("blue")
                        linear_extrude(height=1, center=true)
                            text("PRINT HEIGHT", halign="left", valign="center", size=5);   
                translate([ceil((rack_cage_width_required_mm / 2) / 5) * 5 + 26, (((print_cage_separately) && (!split_cage_into_two_halves)) ? (((units_required * unit_height_in_mm) / 2) + (total_height_required / 2) + 5):0), rear_support_depth - 1])
                        color("white")
                            four_rounded_corner_plate(18, 56, 1, 5);
            }
        } // translate end
    }
    
    
    // Flattening conversion for 2D export
    if (reduce_faceplate_to_2d)
    {
        projection();
    }
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



// Create the actual cage proper. By moving this to a module, it can be
// called more than once, which comes in handy for object difference()
// operations like creating holes in the faceplate for the cage's legs.
module create_detached_cage(safe_cage_horizontal_offset, safe_cage_vertical_offset, size_offset)
{
    // Calculate how many units tall the mount needs to be in order to hold 
    // the device and provide at least 8-10mm of clearance above/below for support
    // structure depending on the heavy_device setting.
    total_height_required = device_height + support_cage_base_size + (heavy_device * support_cage_heavy_device_multiplier);
    units_required = (ceil(total_height_required * (allow_half_heights ? 2:1) / unit_height_in_mm)) / (allow_half_heights ? 2:1);
    total_width_required = device_width + support_cage_base_size + (heavy_device * support_cage_heavy_device_multiplier);


    // Sanity-check for rounded corners
    safe_faceplate_rounded_corners = ((faceplate_rounded_corners < (device_height / 2) - 2 && (faceplate_rounded_corners < (device_width / 2) - 2)) ? faceplate_rounded_corners : 0.001);


    difference()
    {
        union()
        {
            // Create two side plates and carve most of them out for ventillation
            translate([safe_cage_horizontal_offset-((device_width + device_clearance) / 2) - 4 - heavy_device - 0.001 - (size_offset / 2) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, ((device_depth + device_clearance) / 2) + 6 + heavy_device - (device_clearance / 2) + (add_retention_lip ? 1:0)])
                rotate([90, 90, 90])
                    difference()
                    {
                        two_rounded_corner_plate(total_height_required, device_depth + device_clearance + 6 + size_offset + (add_retention_lip ? 1:0), plate_thickness + size_offset, support_radius);
                        
                        // If the device depth is too shallow/narrow, skip the ventillation cutouts.
                        if ((device_depth > 15 + cutout_radius) && (device_height > 15 + cutout_radius) && (!make_sides_solid))
                        {
                            if (cage_sides_vent_hole_pattern != "None")
                                difference()
                                {
                                    translate([8, 0, -1])
                                        two_rounded_corner_plate(device_height - 8, device_depth - 8 - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);
                                    create_ventilation_grid(cage_sides_vent_hole_pattern, device_depth + device_clearance + size_offset + (add_retention_lip ? 1:0), device_height, cage_sides_vent_hole_size, cage_sides_vent_wall_thickness, cage_sides_vent_grid_horizontal_offset, cage_sides_vent_grid_vertical_offset, cage_sides_vent_grid_angle);
                                }
                            else
                                translate([8, 0, -1])
                                    two_rounded_corner_plate(device_height - 8, device_depth - 8 - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);
                        }
                    } // difference end
            translate([safe_cage_horizontal_offset + ((device_width + device_clearance) / 2) + 0.001 - (size_offset / 2) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, ((device_depth + device_clearance) / 2) + 6 + heavy_device - (device_clearance / 2) + (add_retention_lip ? 1:0)])
                rotate([90, 90, 90])
                    difference()
                    {
                        two_rounded_corner_plate(total_height_required, device_depth + device_clearance + 6 + size_offset + (add_retention_lip ? 1:0), plate_thickness + size_offset, support_radius);
                        if ((device_depth > 15 + cutout_radius) && (device_height > 15 + cutout_radius) && (!make_sides_solid))
                        {
                            if (cage_sides_vent_hole_pattern != "None")
                                difference()
                                {
                                    translate([8, 0, -1])
                                        two_rounded_corner_plate(device_height - 8, device_depth - 8 - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);
                                    create_ventilation_grid(cage_sides_vent_hole_pattern, device_depth - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), device_height, cage_sides_vent_hole_size, cage_sides_vent_wall_thickness, cage_sides_vent_grid_horizontal_offset, cage_sides_vent_grid_vertical_offset, cage_sides_vent_grid_angle);
                                }
                            else
                                translate([8, 0, -1])
                                    two_rounded_corner_plate(device_height - 8, device_depth - 8 - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);   
                        }
                    }

            // Create two top/bottom plates and carve most of them out for ventillation
            translate([safe_cage_horizontal_offset + ((support_cage_base_size - 8) / 2), (device_height + device_clearance) / 2 + 0.001 + safe_cage_vertical_offset - (size_offset / 2), ((device_depth + device_clearance) / 2) + 6 + heavy_device - (device_clearance / 2) + (add_retention_lip ? 1:0)])
                rotate([0, 90, 90])
                    difference()
                    {
                        two_rounded_corner_plate(total_width_required, device_depth + device_clearance + 6 + size_offset + (add_retention_lip ? 1:0), plate_thickness + size_offset, support_radius);
                        
                        // Again, skip ventillation cutouts for short heights,
                        // but also on this one side only, if "make bottom a
                        // shelf" option is enabled.
                        if ((device_depth > 15 + cutout_radius) && (device_width > 15 + cutout_radius) && (!make_bottom_solid))
                        {
                            if (!extra_support)
                            {
                                if (cage_top_bottom_vent_hole_pattern != "None")
                                    difference()
                                    {
                                        translate([8, 0, -1])
                                            two_rounded_corner_plate(device_width - 8 - (safe_faceplate_rounded_corners * 2), device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);    
                                        create_ventilation_grid(cage_top_bottom_vent_hole_pattern, device_depth - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), device_width - (safe_faceplate_rounded_corners * 2), cage_top_bottom_vent_hole_size, cage_top_bottom_vent_wall_thickness, cage_top_bottom_vent_grid_horizontal_offset, cage_top_bottom_vent_grid_vertical_offset, cage_top_bottom_vent_grid_angle);
                                    }
                                else
                                    translate([8, 0, -1])
                                        // Note that we're adjusting the cutout to compensate for rounded corners,
                                        // so that the cage still supports the device even if it's not sharply rectangular.
                                        two_rounded_corner_plate(device_width - 8 - (safe_faceplate_rounded_corners * 2), device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);    
                            }
                            else
                            {
                                if ((device_width - 8) / 4 + 8 > 22)
                                {
                                    if (cage_top_bottom_vent_hole_pattern != "None")
                                    {
                                        difference()
                                        {
                                            translate([8, (device_width - 8) / 4 + 8 - (safe_faceplate_rounded_corners / 2), -1])
                                                two_rounded_corner_plate((device_width - 8) / 2 - 16 - safe_faceplate_rounded_corners, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);
                                            create_ventilation_grid(cage_top_bottom_vent_hole_pattern, device_depth  - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), device_width - (safe_faceplate_rounded_corners * 2), cage_top_bottom_vent_hole_size, cage_top_bottom_vent_wall_thickness, cage_top_bottom_vent_grid_horizontal_offset, cage_top_bottom_vent_grid_vertical_offset, cage_top_bottom_vent_grid_angle);
                                        }
                                        difference()
                                        {
                                            translate([8, -(device_width - 8) / 4 - 8 + (safe_faceplate_rounded_corners / 2), -1])
                                                two_rounded_corner_plate((device_width - 8) / 2 - 16 - safe_faceplate_rounded_corners, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);
                                            create_ventilation_grid(cage_top_bottom_vent_hole_pattern, device_depth  - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), device_width - (safe_faceplate_rounded_corners * 2), cage_top_bottom_vent_hole_size, cage_top_bottom_vent_wall_thickness, cage_top_bottom_vent_grid_horizontal_offset, cage_top_bottom_vent_grid_vertical_offset, cage_top_bottom_vent_grid_angle);
                                        }
                                    }
                                    else
                                    {
                                        translate([8, (device_width - 8) / 4 + 8 - (safe_faceplate_rounded_corners / 2), -1])
                                            two_rounded_corner_plate((device_width - 8) / 2 - 16 - safe_faceplate_rounded_corners, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);      
                                        translate([8, -(device_width - 8) / 4 - 8 + (safe_faceplate_rounded_corners / 2), -1])
                                            two_rounded_corner_plate((device_width - 8) / 2 - 16 - safe_faceplate_rounded_corners, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);
                                    }
                                }
                            }
                        }
                    } // difference end

            // Enabling the extra support option adds center supports
            // and reinforcing structures to the top and bottom.
            if (extra_support)
            {
                difference()
                {
                    translate([safe_cage_horizontal_offset - 2 - heavy_device - 10 + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, ((device_depth + device_clearance) / 2) + 6 + heavy_device - (device_clearance / 2) - (split_cage_into_two_halves ? 8 : 0) + (add_retention_lip ? 1:0)])
                        rotate([90, 90, 90])
                            two_rounded_corner_plate(total_height_required, device_depth + device_clearance - (split_cage_into_two_halves ? 12 : 0) + 6 + size_offset + (add_retention_lip ? 1:0), plate_thickness + size_offset, support_radius);

                    translate([safe_cage_horizontal_offset + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, (device_depth / 2) + (add_retention_lip ? 1:0)])
                        cube([device_width + device_clearance + 1, device_height + device_clearance + 1, device_depth + device_clearance + 50 + (add_retention_lip ? 1:0)], center=true);
                }

                difference()
                {
                    translate([safe_cage_horizontal_offset - 2 - heavy_device + 10 - (size_offset / 2) + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, ((device_depth + device_clearance) / 2) + 6 + heavy_device - (device_clearance / 2) - (split_cage_into_two_halves ? 8 : 0) + (add_retention_lip ? 1:0)])
                        rotate([90, 90, 90])
                            two_rounded_corner_plate(total_height_required, device_depth + device_clearance - (split_cage_into_two_halves ? 12 : 0) + 6 + size_offset + (add_retention_lip ? 1:0), plate_thickness + size_offset, support_radius);

                    translate([safe_cage_horizontal_offset + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, (device_depth / 2) + (add_retention_lip ? 1:0)])
                        cube([device_width + device_clearance + 1, device_height + device_clearance + 1, device_depth + device_clearance + 50 + (add_retention_lip ? 1:0)], center=true);
                }
            }

            translate([safe_cage_horizontal_offset + ((support_cage_base_size - 8) / 2), 0-((device_height + device_clearance) / 2) - 4 - heavy_device - 0.001 + safe_cage_vertical_offset - (size_offset / 2), ((device_depth + device_clearance) / 2) + 6 + heavy_device - (device_clearance / 2) + (add_retention_lip ? 1:0)])
                rotate([0, 90, 90])
                    difference()
                    {
                        two_rounded_corner_plate(total_width_required, device_depth + device_clearance + 6 + size_offset + (add_retention_lip ? 1:0), plate_thickness + size_offset, support_radius);
                        
                        if ((device_depth > 15 + cutout_radius) && (device_width > 15 + cutout_radius) && (!make_top_solid))
                        {
                            if (!extra_support)
                            {
                                if (cage_top_bottom_vent_hole_pattern != "None")
                                {
                                    difference()
                                    {
                                        translate([8, 0, -1])
                                            two_rounded_corner_plate(device_width - 8, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);      
                                        create_ventilation_grid(cage_top_bottom_vent_hole_pattern, device_depth - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), device_width - (safe_faceplate_rounded_corners * 2), cage_top_bottom_vent_hole_size, cage_top_bottom_vent_wall_thickness, cage_top_bottom_vent_grid_horizontal_offset, cage_top_bottom_vent_grid_vertical_offset, cage_top_bottom_vent_grid_angle);
                                   }
                                }
                                else                                   
                                    translate([8, 0, -1])
                                        two_rounded_corner_plate(device_width - 8, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);      
                            } else {
                                if ((device_width - 8) / 4 + 8 > 22)
                                {
                                    if (cage_top_bottom_vent_hole_pattern != "None")
                                    {
                                        difference()
                                        {
                                            translate([8, (device_width - 8) / 4 + 8, -1])
                                                two_rounded_corner_plate((device_width - 8) / 2 - 16, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);  
                                            create_ventilation_grid(cage_top_bottom_vent_hole_pattern, device_depth  - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), device_width - (safe_faceplate_rounded_corners * 2), cage_top_bottom_vent_hole_size, cage_top_bottom_vent_wall_thickness, cage_top_bottom_vent_grid_horizontal_offset, cage_top_bottom_vent_grid_vertical_offset, cage_top_bottom_vent_grid_angle);
                                        }
                                        difference()
                                        {
                                             translate([8, -(device_width - 8) / 4 - 8, -1])
                                                two_rounded_corner_plate((device_width - 8) / 2 - 16, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius); 
                                            create_ventilation_grid(cage_top_bottom_vent_hole_pattern, device_depth  - cutout_edge + 6 + size_offset + (add_retention_lip ? 1:0), device_width - (safe_faceplate_rounded_corners * 2), cage_top_bottom_vent_hole_size, cage_top_bottom_vent_wall_thickness, cage_top_bottom_vent_grid_horizontal_offset, cage_top_bottom_vent_grid_vertical_offset, cage_top_bottom_vent_grid_angle);
                                       }
                                    }
                                    else
                                    {
                                        translate([8, (device_width - 8) / 4 + 8, -1])
                                            two_rounded_corner_plate((device_width - 8) / 2 - 16, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius);  
                                        translate([8, -(device_width - 8) / 4 - 8, -1])
                                            two_rounded_corner_plate((device_width - 8) / 2 - 16, device_depth - 2 - cutout_edge + size_offset + (add_retention_lip ? 1:0), 6 + heavy_device + size_offset, cutout_radius); 
                                    }
                                }
                            }
                        }
                    } // difference end
            
            // Create a back plate and carve most of it out for ventillation
            translate([safe_cage_horizontal_offset + ((support_cage_base_size - 8) / 2), safe_cage_vertical_offset, 2 + device_depth + device_clearance + (heavy_device / 2) + (add_retention_lip ? 1:0)])
                difference()
                {
                    cube([device_width + 2, device_height + 2, plate_thickness], center=true);                    
                    translate([0, 0, -5 - (heavy_device * support_cage_heavy_device_multiplier) * 0.5])
                        four_rounded_corner_plate(device_height - cutout_edge, device_width - cutout_edge, 8 + heavy_device * support_cage_heavy_device_multiplier, cutout_radius);
                }

            // If we're splitting the cage and using a top/bottom ventilation grid and
            // NOT using extra support, band the sides of the cage to support the grid.
            // (If extra support is enabled this will be handled automatically.)
            if ((split_cage_into_two_halves) && (cage_top_bottom_vent_hole_pattern != "None") && (!extra_support))
            {
                translate([safe_cage_horizontal_offset, 0-((device_height + device_clearance) / 2) - 4 - heavy_device - 0.001 + safe_cage_vertical_offset - (size_offset / 2), ((device_depth + device_clearance) / 2) + 8 + heavy_device - (device_clearance / 2) + (add_retention_lip ? 1:0)])
                    rotate([0, 90, 90])
                            two_rounded_corner_plate(12, device_depth + device_clearance + 6 + size_offset + (add_retention_lip ? 1:0), plate_thickness + size_offset, 0.001);

                translate([safe_cage_horizontal_offset, ((device_height + device_clearance) / 2) - 0.001 + safe_cage_vertical_offset - (size_offset / 2), ((device_depth + device_clearance) / 2) + 8 + heavy_device - (device_clearance / 2) + (add_retention_lip ? 1:0)])
                    rotate([0, 90, 90])
                            two_rounded_corner_plate(12, device_depth + device_clearance + 6 + size_offset + (add_retention_lip ? 1:0), plate_thickness + size_offset, 0.001);
            }
                
            // If we're splitting the cage and using a top/bottom ventilation grid, band
            // the bottom of the cage to support the grid.
            if ((print_cage_separately) && (cage_top_bottom_vent_hole_pattern != "None") )
            {
                translate([safe_cage_horizontal_offset, ((device_height + device_clearance) / 2) - 0.001 + safe_cage_vertical_offset - (size_offset / 2) + (plate_thickness / 2), 15 + heavy_device])
                    cube([device_width + device_clearance, plate_thickness + size_offset, 14], center=true);
                translate([safe_cage_horizontal_offset, 0 - ((device_height + device_clearance) / 2) - 0.001 + safe_cage_vertical_offset - (size_offset / 2) - (plate_thickness / 2), 15 + heavy_device])
                    cube([device_width + device_clearance, plate_thickness + size_offset, 14], center=true);
            }

            // If we're splitting the cage and using a side ventilation grid, band
            // the bottom of the cage to support the grid.
            if ((print_cage_separately) && (cage_sides_vent_hole_pattern != "None") )
            {
                translate([safe_cage_horizontal_offset + ((device_width + device_clearance + plate_thickness) / 2), safe_cage_vertical_offset, 15 + heavy_device])
                    cube([plate_thickness + size_offset, device_height + device_clearance, 14], center=true);
                translate([0 - ((device_width + device_clearance + plate_thickness) / 2) + safe_cage_horizontal_offset, safe_cage_vertical_offset, 15 + heavy_device])
                    cube([plate_thickness + size_offset, device_height + device_clearance, 14], center=true);
            }
        } // union end


        // Create 1.75mm pin holes in the legs for locking pins, assuming we're
        // making a separated cage.
        if ((print_cage_separately) && (!split_cage_into_two_halves))
        {
            translate([safe_cage_horizontal_offset-((device_width + device_clearance) / 2) - heavy_device - 4, (device_height + device_clearance) / 2 + safe_cage_vertical_offset, 19])
                rotate([135, 90, 0])
                    cylinder(h=30, d=1.75, center=true, $fn=this_fn);
            translate([safe_cage_horizontal_offset-((device_width + device_clearance) / 2) - heavy_device - 4, 0 - ((device_height + device_clearance) / 2 - safe_cage_vertical_offset), 19])
                rotate([45, 90, 0])
                    cylinder(h=30, d=1.75, center=true, $fn=this_fn);
            translate([safe_cage_horizontal_offset+((device_width + device_clearance) / 2) + heavy_device + 4, (device_height + device_clearance) / 2 + safe_cage_vertical_offset, 19])
                rotate([45, 90, 0])
                    cylinder(h=30, d=1.75, center=true, $fn=this_fn);
            translate([safe_cage_horizontal_offset+((device_width + device_clearance) / 2) + heavy_device + 4, 0 - ((device_height + device_clearance) / 2 - safe_cage_vertical_offset), 19])
                rotate([135, 90, 0])
                    cylinder(h=30, d=1.75, center=true, $fn=this_fn);

            translate([0, (device_height + device_clearance) / 2 + safe_cage_vertical_offset + 2.5, 19])
                rotate([0, 90, 0])
                    cylinder(h=50, d=1.75, center=true, $fn=this_fn);
            translate([0, 0 - ((device_height + device_clearance) / 2 - safe_cage_vertical_offset) -  2.5, 19])
                rotate([0, 90, 0])
                    cylinder(h=50, d=1.75, center=true, $fn=this_fn);
        }
    } // difference end
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 



// Faceplate modification handlers
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
            // Keystone Receptacle
            if (mod_type == "Keystone")
                place_keystone(horizontal_offset + x_offset, vertical_offset + 1.5 + y_offset, 0);

            // Neutrik D-Series Cutout
            if (mod_type == "DSeries")
            {                    
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cylinder(16, d=24, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    rect_screws(19, 24, 3.2);
            }
    
            // 30mm fan
            if (mod_type == "30mmFan")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
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
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
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
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
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
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
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
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
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
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
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
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cube([140.2, 140.2, 3], center=true);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                {
                    fan_grill_cutout(140);
                    fan_screws(125, 4.4);
                }
            }
            
    
            // 10mm Hole (For Button/Light/etc.)
            if (mod_type == "10mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cylinder(16, d=10, center=true, $fn=this_fn);

            // 12mm Hole (For Button/Light/etc.)
            if (mod_type == "12mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cylinder(16, d=12, center=true, $fn=this_fn);

            // 16mm Hole (For Button/Light/etc.)
            if (mod_type == "16mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cylinder(16, d=16, center=true, $fn=this_fn);

            // 19mm Hole (For Button/Light/etc.)
            if (mod_type == "19mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cylinder(16, d=19, center=true, $fn=this_fn);

            // 24mm Hole (For Button/Light/etc.)
            if (mod_type == "24mmButton")
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
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
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cylinder(16, d=50, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    fan_screws(47, 5.5);
            }
            
            // 16A (20A NA) Power Inlet - 4-7-Wire
            if (mod_type == "16A4")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cylinder(16, d=67, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    fan_screws(60, 5.5);
            }
            
            // 32A (30A NA) Power Inlet - 3-Wire
            if (mod_type == "32A3")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                    cylinder(16, d=71, center=true, $fn=this_fn);
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 0])
                    fan_screws(60, 5.5);
            }
            
            // 32A (30A NA) Power Inlet - 4-7-Wire
            if (mod_type == "32A4")
            {
                translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
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
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                        cylinder(16, d=custom_cutout_a_diameter_height, center=true, $fn=this_fn);
                    if (custom_cutout_a_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 4 + heavy_device])
                            cylinder(plate_thickness, d=custom_cutout_a_diameter_height + 6, center=true, $fn=this_fn);

                }
                else
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, -1])
                        four_rounded_corner_plate(custom_cutout_a_diameter_height, custom_cutout_a_width, plate_thickness + 2, corner_radius);
                    if (custom_cutout_a_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 2])
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
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                        cylinder(16, d=custom_cutout_b_diameter_height, center=true, $fn=this_fn);
                    if (custom_cutout_b_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 4 + heavy_device])
                            cylinder(plate_thickness, d=custom_cutout_b_diameter_height + 6, center=true, $fn=this_fn);

                }
                else
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, -1])
                        four_rounded_corner_plate(custom_cutout_b_diameter_height, custom_cutout_b_width, plate_thickness + 2, corner_radius);
                    if (custom_cutout_b_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 2])
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
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, 5 + heavy_device])
                        cylinder(16, d=custom_cutout_c_diameter_height, center=true, $fn=this_fn);
                    if (custom_cutout_c_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 4 + heavy_device])
                            cylinder(plate_thickness, d=custom_cutout_c_diameter_height + 6, center=true, $fn=this_fn);

                }
                else
                {
                    translate([horizontal_offset + x_offset, vertical_offset + y_offset, -1])
                        four_rounded_corner_plate(custom_cutout_c_diameter_height, custom_cutout_c_width, plate_thickness + 2, corner_radius);
                    if (custom_cutout_c_snap_in_recess)
                        translate([horizontal_offset + x_offset, vertical_offset + y_offset, 2])
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
            if (mod_type == "Keystone")
                translate([horizontal_offset + x_offset, vertical_offset + 2.5 + y_offset, 5.5])
                    cube([19, 28, 11], center=true);
        }
}


// Drop a warning into the console if the support structure setting is too small.
if (support_cage_base_size < 8)
{
    echo("");
    echo("");
    echo("WARNING: Support structure size setting is too small. This WILL break things.");
    echo("Change 'support_cage_base_size' to 8 or higher to remove this warning.");
    echo("");
    echo("");
}



// Are we splitting the completed cage in half?
if ((split_cage_into_two_halves) && (faceplate_only == 0.0))
    // We are!
    make_half_cage();
// We are not! Are we doing a flat plane for a faceplate?
else if ((reduce_faceplate_to_2d) && ((faceplate_only != 0.0)))
    projection()
        do_the_thing();
// We are not! Just do the thing!
else
    do_the_thing();


/* END! */

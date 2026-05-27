<img width="835" height="157" alt="cagemaker_full_logotype" src="https://github.com/user-attachments/assets/ce93d3e3-ebee-4622-8a0a-d32a5959471d" />

&nbsp;

Copyright © 2025-2026 by WebMaka - this file is licensed under CC BY-NC-SA 4.0.
To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/4.0/

&nbsp;

Quickly create a 3D-printable object file for a rack cage for any device of a given size that can fit into practically any size rack or rack system. Simply provide the device's dimensions, and optionally tweak a few settings, then press F6 then F7 to generate and save a STL file.

&nbsp;

> [!NOTE]
> :no_entry_sign::robot: NO AI - This project is human-produced - no AI assistance or vibe coding has been employed in its development.

&nbsp;

## CageMaker PRCG + OpenSCAD Playground

I'm happy to announce that CageMaker PRCG is now available in a fork of the Java-based OpenSCAD port [OpenSCAD Playground](https://github.com/openscad/openscad-playground). This allows using CageMaker PRCG right from a web browser without having to install any additional software. The full feature set of CageMaker PRGC is available, and Playground can even export completed STL files for slicing and printing.

Be sure to [check out the quick-start guide](https://github.com/WebMaka/CageMakerPRCG/blob/main/openscad_playground_quick_start_guide.md), or [jump over to the Playground and start creating cages](https://cagemaker.org/playground/). Not sure what the options are for? The wiki's [Configuration Options](https://github.com/WebMaka/CageMakerPRCG/wiki/ConfigOptions) page has a complete breakdown of the options, with screenshots of what they do.

&nbsp;

## Minimum & Maximum Sizes

These are the size limits for printing a complete cage of a given width that is one unit (1.75"/44.45mm) tall and complies with EIA-310-D. These assume default settings for all options, but most notably the **heavy device** setting as this thickens all surfaces and reduces available working space.

By default, CageMaker PRCG creates a support structure around the device's dimensions that adds 12-20mm to those dimensions, and also enforces a safe mounting space of 5/8" or 15.875mm on either side - the maximum width value listed here is the greatest device width that fits the given rack width setting before automatically scaling to the next wider size. For example, when creating a cage for a 19" rack, a device wider than 67mm won't fit into a quarter-width bolt-together but will fit in a third-width.

| Rack Width | Maximum Device Width | Minimum Build Volume For Split Cages | Minimum Build Volume For Full-Width Cages |
| --- | :---: | :---: | :---: |
| Quarter-19" Bolt-Together (4.75") | 67mm | 100mm | 130mm |
| 5" Micro-Rack | 80mm | 100mm | 130mm |
| Half-10" Bolt-Together (5") | 80mm | 100mm | 130mm |
| 6" Micro-Rack | 107mm | 110mm | 160mm |
| Third-19" Bolt-Together (6.33") | 117mm | 110mm | 170mm |
| 7" Micro-Rack | 132mm | 120mm | 180mm |
| Half-19" Bolt-Together (9.5") | 197mm | 150mm | 250mm |
| 10" Mini-Rack | 207mm | 150mm | 260mm |
| 19" Full Rack | 417mm | 270mm | 490mm |

&nbsp;

## Please Support The Developer!

If this is useful to you, please consider donating or subscribing to my Patreon. I fund my projects entirely out-of-pocket, and any additional funding will help.
 
https://patreon.com/webmaka

&nbsp;

<img width="624" height="301" src="https://github.com/user-attachments/assets/3aff54f1-7faa-4a80-82e3-aabe52922683" />

![20251217_104840](https://github.com/user-attachments/assets/51f9aa6f-41c2-4e6d-9217-fbe1aa3a790c)

![20251217_104725](https://github.com/user-attachments/assets/2d5cb894-1762-4182-ab1b-7aa4efc9a020)

&nbsp;

## Installation &amp; Usage

This script was built to work with/in OpenSCAD version 2021.01. To obtain a copy of OpenSCAD, visit this URL:

  https://openscad.org/

> [!TIP]
> To make CageMaker PRCG's massive number of options easier to understand, make sure OpenSCAD's Customizer is set to show descriptions by changing the dropdown setting next to the "Reset" button atop the Customizer panel to "Show Details" or "Description Only". Consult the [Configuration Options](https://github.com/WebMaka/CageMakerPRCG/wiki/ConfigOptions) for detailed explanations with screenshots of the function and purpose of each option.

To use this script:

1. Launch OpenSCAD.
2. Open this script.
3. Use the Customizer to configure the size of the object that you wish to rack-mount. Optionally, configure other settings to suit.
4. Press F6 to instruct OpenSCAD to fully calculate and render the rack cage as an object.
5. Press F7 to save the created object as a STL file.
6. Slice and print the object.

&nbsp;

## Documentation

The Wiki contains loads and loads of documentation for CageMaker...

[Features](https://github.com/WebMaka/CageMakerPRCG/wiki/Features)  
[Version/Revision History](https://github.com/WebMaka/CageMakerPRCG/wiki/History)  
[Screenshots and Pictures](https://github.com/WebMaka/CageMakerPRCG/wiki/Screenshots)  
[Configuration Options](https://github.com/WebMaka/CageMakerPRCG/wiki/ConfigOptions)  
[Best Usage and Printing Practices](https://github.com/WebMaka/CageMakerPRCG/wiki/BestPractices)  
[FAQ](https://github.com/WebMaka/CageMakerPRCG/wiki/FAQ)  
[Credits](https://github.com/WebMaka/CageMakerPRCG/wiki/Credits)  
[License](https://github.com/WebMaka/CageMakerPRCG/wiki/License)


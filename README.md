<img width="835" height="157" alt="cagemaker_full_logotype" src="https://github.com/user-attachments/assets/ce93d3e3-ebee-4622-8a0a-d32a5959471d" />

&nbsp;

### :star2: 500 STARS! THANK YOU FOR YOUR SUPPORT! :star2:

&nbsp;

> [!IMPORTANT]
> This is the EXPERIMENTAL BRANCH - the version of CageMaker PRCG in this branch is a work-in-progress, and may (read: almost certainly will) be buggy and not ready for wide use.
> 
> USE THE EXPERIMENTAL BUILD WITH CAUTION, AND VERIFY THE RESULTS OF ANY GENERATED CAGES BEFORE SLICING AND PRINTING.

&nbsp;

Rack-mount almost any small(-ish) device into almost any rack, create custom faceplates with ventilation or mounting points for various connectors and cooling fans, create custom rackmount enclosures for projects, and more.

&nbsp;

> [!NOTE]
> :no_entry_sign::robot: NO AI - This project is human-produced - no AI assistance or vibe coding has been employed in its development.

&nbsp;

## Contents

[Installation &amp; Usage](#install)  
[Run CageMaker PRCG In A Web Browser With OpenSCAD Playground](#playground)  
[Documentation](#docs)  
[Please Support The Developer!](#support)  
[License](LICENSE.md)

&nbsp;

<a href="install"></a>
## Installation &amp; Usage

This script was built to work with/in OpenSCAD version 2021.01. To obtain a copy of OpenSCAD, visit this URL:

  https://openscad.org/

> [!TIP]
> To make CageMaker PRCG's massive number of options easier to understand, make sure OpenSCAD's Customizer is set to show descriptions by changing the dropdown setting next to the "Reset" button atop the Customizer panel to "Show Details" or "Description Only". Consult the [Configuration Options](https://github.com/WebMaka/CageMakerPRCG/wiki/ConfigOptions) for detailed explanations with screenshots of the function and purpose of each option.

To use this script:

1. Download (click the green "&lt;&gt; Code" button then select "Download ZIP") or clone ("git clone https://github.com/WebMaka/CageMakerPRCG.git" in a terminal). If downloading a ZIP, unpack it into a suitable location.
2. Double-click "CageMaker_PRCG_v0.7.scad" to launch OpenSCAD and load the script. If all goes well, OpenSCAD should show an extreme close-up of a default rack cage design in its preview window - press CTRL-SHIFT-V to zoom out to "show-all" distance.
3. Use the Customizer to configure the size of the object that you wish to rack-mount. Optionally, configure other settings to suit.
4. Press F6 to instruct OpenSCAD to fully calculate and render the rack cage as an object.
5. Press F7 to save the created object as a STL file.
6. Slice and print the object.

> [!IMPORTANT]
> If OpenSCAD cannot find the include files, make sure there is an "includes" directory in the same directory as "CageMaker_PRCG_v0.7.scad", and that it contains files. The directory layout and file locations in your copy should be the same as for this repo.

&nbsp;

<a href="playground"></a>
## Run CageMaker PRCG In A Web Browser With OpenSCAD Playground

CageMaker PRCG is also usable from within any reasonably modern web browser, thanks to a fork of the Java-based OpenSCAD port [OpenSCAD Playground](https://github.com/openscad/openscad-playground). This allows using CageMaker PRCG right from a web browser without having to install any additional software. The full feature set of CageMaker PRGC is available, and Playground can even export completed STL files for slicing and printing.

Be sure to [check out the quick-start guide](https://github.com/WebMaka/CageMakerPRCG/blob/main/openscad_playground_quick_start_guide.md), or [jump over to the Playground and start creating cages](https://cagemaker.org/playground/). Not sure what the options are for? The wiki's [Configuration Options](https://github.com/WebMaka/CageMakerPRCG/wiki/ConfigOptions) page has a complete breakdown of the options, with screenshots of what they do.

&nbsp;

<a href="docs"></a>
## Documentation

CageMaker PRCG is extensively documented, with detailed coverage for every single option. That documentation is included with the repo but can also be accessed here:

<p>
<a href="https://webmaka.github.io/CageMakerPRCG/QuickStartGuide.htm">Quick-Start Guide</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/BestPractices.htm">Best Practices</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/MaximumSupportedSizes.htm">Maximum Supported Sizes</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/SupportedModifications.htm">Supported Modifications</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/FAQ.htm">FAQ</a>
</p>
<p>
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions.htm">Configuration Options</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_TargetDevicePresets.htm">&rsaquo; Target Device Presets</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_TargetDeviceDimensions.htm">&rsaquo; Target Device Dimensions &amp; Geometry</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_OverallStructureGeometry.htm">&rsaquo; Overall Structure &amp; Geometry</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_RulersGuides.htm">&rsaquo; Rulers/Guides</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_3DPrinterSupport.htm">&rsaquo; 3D Printer Support</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_RackSettings.htm">&rsaquo; Rack Settings</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_FaceplateOptions.htm">&rsaquo; Faceplate Options</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_FaceplateVentilationOptions.htm">&rsaquo; Faceplate Ventillation Options</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_CageOptions.htm">&rsaquo; Cage Options</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_CageTopBottomOptions.htm">&rsaquo; Cage TOP and BOTTOM Geometry &amp; Ventillation Options</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_CageLeftRightOptions.htm">&rsaquo; Cage LEFT and RIGHT SIDE Geometry &amp; Ventillation Options</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_CageBackOptions.htm">&rsaquo; Cage BACK Geometry &amp; Modifications</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_RearSupportOptions.htm">&rsaquo; Rear Support Options</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_AdditionalFaceplateModifications.htm">&rsaquo; Additional Faceplate Modifications</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/ConfigOptions_CustomCutoutOptions.htm">&rsaquo; Custom Cutout Options</a>
<br />
<a href="ConfigOptions_IgnoreErrors.htm">&rsaquo; Ignore Errors</a>
<br />
<a href="ConfigOptions_RarelyChangedOptions.htm">&rsaquo; Rarely-Changed Options</a>
</p>
<p>
<a href="https://webmaka.github.io/CageMakerPRCG/Features.htm">Features</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/History.htm">History</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/Credits.htm">Credits</a>
<br />
<a href="https://webmaka.github.io/CageMakerPRCG/License.htm">License</a>
</p>

&nbsp;

<a href="support"></a>
## Please Support The Developer!

If this is useful to you, please consider donating or subscribing to my Patreon. I fund my projects entirely out-of-pocket, and any additional funding will help.

https://ko-fi.com/webmaka  
https://thanks.dev/webmaka  
https://patreon.com/webmaka

&nbsp;

<img width="624" height="301" src="https://github.com/user-attachments/assets/3aff54f1-7faa-4a80-82e3-aabe52922683" />

![20251217_104840](https://github.com/user-attachments/assets/51f9aa6f-41c2-4e6d-9217-fbe1aa3a790c)

![20251217_104725](https://github.com/user-attachments/assets/2d5cb894-1762-4182-ab1b-7aa4efc9a020)

&nbsp;

Copyright © 2025-2026 by WebMaka - this project is licensed under CC BY-NC-SA 4.0.

&nbsp;

# colorful

The colorful library.
Create a List of equally distant random colors.
Each color in the color list is generated
from the HSL color model using the [Color](https://pub.dartlang.org/packages/color) package,
and shares the same values
for saturation and lightness.

ColorPalettes can be generated from predefined palettes,
like Soft or Warm, or by supplying the values for
saturation and lightness, custom made.

# Usage

Predefined Color Palettes can be constructed by supplying the number of
distant colors.

To create a SoftPalette with 7 colors, call:

    SoftPalette sp = new SoftPalette(7);
    
The color list can be accessed with:
    
    sp.colors;
    
Other predefined ColorPalettes:

    WarmPalette wp = new WarmPalette(10);
    List<HexColor> cl = wp.colors;
    
    PopPalette pp = new PopPalette(6);
    List<HexColor> cl = pp.colors;
    
You can create custom palettes by supplying values for saturation, lightness
and size. 

    CustomPalette cp = new CustomPalette(41.0, 51.0, 8);
    
Values for saturation and lightness are percent values between 0 and 100.


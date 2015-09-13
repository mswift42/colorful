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
    
    sp.colors


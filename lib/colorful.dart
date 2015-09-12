// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The colorful library.
/// Create a List of equally distant random colors.
/// Each color in the color list has the same values
/// for saturation and lightness.
///
/// ColorPalettes can be generated from predefined palettes,
/// like Soft or Warm, or by supplying the values for
/// saturation and lightness, vustom made.
library colorful;

import 'package:color/color.dart';
import 'dart:math';

/// Instances of the class ColorPalette represent
/// an Array with length [size] of equally distant HexColors of the same
/// [saturation] and lightness values.
///
/// Saturation and lightness are [double] values between
/// 0 and 100 (inclusive).
abstract class ColorPalette {
  final double saturation;
  final double lightness;
  final int size;
  List<HexColor> colors = new List();

  /// creates a ColorPalette of size [size], with the
  /// hex colors in [List] [colors] converted from
  /// Hsl colors with saturation and lightness set to the given
  /// values, and the hue value calculated with method [hueRange].
  ColorPalette(this.saturation, this.lightness, this.size) {
    var hr = _hueRange(_randomHue());
    hr.forEach((i) =>
        colors.add(new Color.hsl(i, saturation, lightness).toHexColor()));
  }

  double _randomHue() {
    var rand = new Random();
    return rand.nextInt(360).toDouble();
  }

  List<double> _hueRange(double startValue) {
    var distance = 360.0 / this.size;
    var hrange = [startValue];
    var hue = startValue + distance;
    for (int i = 1; i < this.size; i++) {
      hrange.add(hue % 360);
      hue += distance;
    }
    return hrange;
  }
}
/// SoftPalette represents a ColorPalette with soft colors
/// of size [size].
///
/// The Hsl saturation value is set to 41 % and the
/// lightness value is set to 51 %.
class SoftPalette extends ColorPalette {
  /// Creates a SoftPalette of the given size.
  /// Saturation is set to 41.0 %, Lightness
  /// is set to 51.0 %.
  ///
  ///     SoftPalette sp = new SoftPalette(5);
  SoftPalette(int size) : super(41.0, 51.0, size);
}
/// WarmPalette represents a ColorPalette with warm colors
/// of size [size]
///
/// The Hsl saturation value is set to 34.1 % and the
/// lightness value is set to 66.1 %.
class WarmPalette extends ColorPalette {
  /// Creates a WarmPalette of the given size.
  /// Saturation is set to 34.1 %, Lightness
  /// is set to 66.1 %.
  ///
  ///     WarmPalette wp = new WarmPalette(8);
  WarmPalette(size) : super(34.1, 66.1, size);
}
/// CustomPalette represents a ColorPalette with
/// custom colors of size [size].
///
/// The Hsl saturation and lightness
/// are set to the given values.
class CustomPalette extends ColorPalette {
  /// Creates a CustomPalette with the given
  /// saturation and lightness of size [size].
  ///
  ///     CustomPalette cp = new CustomPalette(40.1, 66.4, 5);
  CustomPalette(saturation, lightness, size)
      : super(saturation, lightness, size);
}

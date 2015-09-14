// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The colorful library.
/// Create a List of equally distant random colors.
/// Each color in the color list is generated
/// from the HSL color model using the
/// [Color](https://pub.dartlang.org/packages/color) package,
/// and shares the same values
/// for saturation and lightness.
///
/// ColorPalettes can be generated from predefined palettes,
/// like Soft or Warm, or by supplying the values for
/// saturation and lightness, custom made.
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

  /// creates a ColorPalette of size [size].
  /// Saturation and Lightness are set as percentage values
  /// between 0 and 100.
  ColorPalette(this.saturation, this.lightness, this.size);

  /// colors returns a List of HexColors of length [size], each color with
  /// a different hue value and of the same saturation and lightness
  /// values.
  List<HexColor> colors() {
    var colorlist = new List();
    var hr = _hueRange(_randomHue());
    hr.forEach((i) => colorlist.add(new Color.hsl(i, saturation, lightness).toHexColor()));
    return colorlist;
  }
  /// randomHue returns a random Double between
  /// 0 and 359 (inclusive).
  double _randomHue() {
    var rand = new Random();
    return rand.nextInt(360).toDouble();
  }
  /// hueRange returns a List of length
  /// 'size' of Doubles between 0 and 360.
  /// The difference between each Double
  /// is (360 / list.length).
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
  /// toString() returns a newline seperated string
  /// containing every HexColor in [colors] with the
  /// '#' character prepended.
  String toString() {
    String res = '';
    colors().forEach((i) => res += '#${i}\n');
    return res;
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
/// PopPalette represents a ColorPalette with
/// colors that 'pop' of size [size]
///
/// The Hsl saturation value is set to 51.4 % and
/// the lightness value is set to 42.0 %.
class PopPalette extends ColorPalette {
  /// Creates a PopPalette with the given [size].
  /// Saturation is set to 51.4 %, Lightness is set
  /// to 42.0 %.
  ///
  ///     PopPalette pp = new PopPalette(8);
  PopPalette(size) : super(51.4, 42.0, size);
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



// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The colorful library.
library colorful;

import 'package:color/color.dart';
import 'dart:math';

abstract class ColorPalette {
  final double saturation;
  final double lightness;
  final int size;
  List<Color> colors = new List();

  ColorPalette(this.saturation, this.lightness, this.size) {
    var hr = hueRange(randomHue());
    hr.forEach((i) => colors.add(new Color.hsl(i, saturation, lightness)));
  }

  double randomHue() {
    var rand = new Random();
    return rand.nextInt(360).toDouble();
  }

  List<double> hueRange(double startValue) {
    var distance = 360.0 / this.size;
    var hrange = [startValue];
    var hue = startValue + distance;
    for (int i = 1;i < this.size; i++){
      hrange.add(hue % 360);
      hue += distance;
    }
    return hrange;
  }
}

class SoftPalette extends ColorPalette {

  SoftPalette(size) : super(0.4, 0.5, size);
}

class CustomPalette extends ColorPalette {
  CustomPalette(saturation, lightness, size) : super(saturation, lightness, size);
}

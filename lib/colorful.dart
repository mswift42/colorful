// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The colorful library.
library colorful;

import 'package:color/color.dart';
import 'dart:math';

class ColorPalette {
  final int size;
  List<Color> colors = new List();

  ColorPalette(this.size);

  double randomHue() {
    var rand = new Random();
    return rand.nextInt(360).toDouble();
  }
}

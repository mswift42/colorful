// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library colorful.test;

import 'package:colorful/colorful.dart';
import 'package:test/test.dart';

void main() {
  test('initialize ColorPalette', () {
    ColorPalette cp = new ColorPalette(3);
    expect(cp.size, 3);
    expect(cp.colors.length, 0);
  });
  test('randomHue returns valuse between 0 and 359', () {
    var cp = new ColorPalette(3);
    for (int i = 0;i<10000;i++) {
      var a = cp.randomHue();
      expect(a >= 0.0, true);
      expect(a <= 359.0, true);
    }
  });
}
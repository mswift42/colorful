// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library colorful.test;

import 'package:colorful/colorful.dart';
import 'package:test/test.dart';

void main() {
  test('initialize ColorPalette', () {
    ColorPalette cp = new ColorPalette(3, 20.0,20.0);
    expect(cp.size, 3);
    expect(cp.colors.length, 3);
  });
  test('randomHue returns valuse between 0 and 359', () {
    var cp = new ColorPalette(3,20.0,20.0);
    for (int i = 0;i<10000;i++) {
      var a = cp.randomHue();
      expect(a >= 0.0, true);
      expect(a <= 359.0, true);
    }
  });
  test('hueRange returns a List of length size.', () {
    var cp = new ColorPalette(3, 20.0, 20.0);
    var hr = cp.hueRange(20.0);
    expect(hr.length, 3);
  });
  test('hueRange values are all below 360', () {
    var cp = new ColorPalette(8, 20.0,20.0);
    var hr = cp.hueRange(20.0);
    expect(hr.any((i) => (i > 359.0)), false);
    cp = new ColorPalette(10, 20.0, 20.0);
    hr = cp.hueRange(300.0);
    expect(hr.any((i) => (i > 359.0)), false);
  });
}
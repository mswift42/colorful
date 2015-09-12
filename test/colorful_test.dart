// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library colorful.test;

import 'package:colorful/colorful.dart';
import 'package:color/color.dart';
import 'package:test/test.dart';

void main() {
  test('initialize SoftPalette', () {
    SoftPalette cp = new SoftPalette(3);
    expect(cp.size, 3);
    expect(cp.colors.length, 3);
  });
  test('initialised colorpalette colors fields are of type color', () {
    SoftPalette cp = new SoftPalette(10);
    expect(cp.size, 10);
    expect(cp.colors.length, 10);
    expect(cp.colors.every((i) => i is Color), true);
  });
  test('randomHue returns valuse between 0 and 359', () {
    var cp = new SoftPalette(8);
    for (int i = 0;i<10000;i++) {
      var a = cp.randomHue();
      expect(a >= 0.0, true);
      expect(a <= 359.0, true);
    }
  });
  test('hueRange returns a List of length size.', () {
    var cp = new SoftPalette(3);
    var hr = cp.hueRange(20.0);
    expect(hr.length, 3);
  });
  test('hueRange values are all below 360', () {
    var cp = new SoftPalette(8);
    var hr = cp.hueRange(20.0);
    expect(hr.any((i) => (i > 359.0)), false);
    cp = new SoftPalette(10);
    hr = cp.hueRange(300.0);
    expect(hr.any((i) => (i > 359.0)), false);
  });
  test('CustomPalette gets initialised correctly', () {
    var cp = new CustomPalette(0.4, 0.5, 8);
    expect(cp.size, 8);
    expect(cp.colors.length, 8);
  });
}
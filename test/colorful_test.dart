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
    expect(cp.colors.every((i) => i is HexColor), true);
  });
  test('CustomPalette gets initialised correctly', () {
    var cp = new CustomPalette(41.0, 51.0,8);
    expect(cp.size, 8);
    expect(cp.colors.length, 8);
  });
  test('WarmPalette gets initialised correctly', () {
    var cp = new WarmPalette(7);
    expect(cp.size, 7);
    expect(cp.colors.length, 7);
    expect(cp.colors.every((i) => i is HexColor), true);
  });
}
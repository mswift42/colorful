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
    expect(cp.colors().length, 3);
  });
  test('printing a colorpalette object returns the correct string', () {
    SoftPalette sp = new SoftPalette(10);
    var spstring = sp.toString();
    var split = spstring.trim().split('\n');
    expect(split.length,10);
    expect(split.every((i) => (i[0] == '#')), true);
  });
  test('initialised colorpalette colors fields are of type color', () {
    SoftPalette cp = new SoftPalette(10);
    expect(cp.size, 10);
    expect(cp.colors().length, 10);
    expect(cp.colors().every((i) => i is HexColor), true);
  });
  test('CustomPalette gets initialised correctly', () {
    var cp = new CustomPalette(41.0, 51.0,8);
    expect(cp.size, 8);
    expect(cp.colors().length, 8);
  });
  test('WarmPalette gets initialised correctly', () {
    var cp = new WarmPalette(7);
    expect(cp.size, 7);
    expect(cp.colors().length, 7);
    expect(cp.colors().every((i) => i is HexColor), true);
  });
  test('PopPalette gets initialised correctly', () {
    var pp = new PopPalette(7);
    expect(pp.size, 7);
    expect(pp.colors().length, 7);
    expect(pp.colors().every((i) => i is HexColor), true);
    var pp2 = new PopPalette(30);
    expect(pp2.size, 30);
    expect(pp2.colors().length, 30);
    expect(pp.colors().every((i) => i is HexColor), true);
  });
}
// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library colorful.test;

import 'package:colorful/colorful.dart';
import 'package:test/test.dart';

void main() {
  test('instance fields of class Color', () {
    Color c1 = new Color(22,33,44);
    expect(c1.r, 22);
    expect(c1.b, 44);
    expect(c1.g, 33);
  });
  test('isValid returns true for acceptable rgb values', () {
    Color c1 = new Color(0,0,0);
    expect(c1.isValid(), true);
    Color c2 = new Color(255,255,255);
    expect(c2.isValid(), true);
    Color c3 = new Color(0,0,255);
    expect(c2.isValid(), true);
  });
  test('isValid returns false for out of bounds rgb values', () {
    Color c1 = new Color(0,0,-1);
    expect(c1.isValid(), false);
    Color c2 = new Color(255,255,256);
    expect(c2.isValid(), false);
    Color c3 = new Color(500,500,500);
    expect(c3.isValid(), false);
    Color c4 = new Color(256,255,255);
    expect(c4.isValid(), false);
    Color c5 = new Color(0,256,0);
    expect(c5.isValid(), false);
  });
}

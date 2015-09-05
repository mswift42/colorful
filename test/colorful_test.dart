// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library colorful.test;

import 'package:colorful/colorful.dart';
import 'package:test/test.dart';

void main() {
  test('instance fields of class Color', () {
    Color c1 = new Color(0.1,0.1,0.8);
    expect(c1.r, 0.1);
    expect(c1.b, 0.8);
    expect(c1.g, 0.1);
  });
  test('isValid returns true for acceptable rgb values', () {
    Color c1 = new Color(0.0,0.0,0.0);
    expect(c1.isValid(), true);
    Color c2 = new Color(1.0,1.0,1.0);
    expect(c2.isValid(), true);
    Color c3 = new Color(0.0,0.0,1.0);
    expect(c2.isValid(), true);
  });
  test('isValid returns false for out of bounds rgb values', () {
    Color c1 = new Color(0.0,0.0,-0.1);
    expect(c1.isValid(), false);
    Color c2 = new Color(1.0,1.0,1.1);
    expect(c2.isValid(), false);
    Color c3 = new Color(2.0,2.0,2.0);
    expect(c3.isValid(), false);
    Color c4 = new Color(1.1,1.0,1.0);
    expect(c4.isValid(), false);
    Color c5 = new Color(0.0,1.1,0.0);
    expect(c5.isValid(), false);
  });
}

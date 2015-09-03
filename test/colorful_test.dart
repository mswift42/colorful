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
}

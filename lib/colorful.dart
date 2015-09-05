// Copyright (c) 2015, <Martin Haesler>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The colorful library.
library colorful;

class Color {
  double _r;
  double _g;
  double _b;

  Color(this._r, this._g, this._b);

  get r => _r;
  get g => _g;
  get b => _b;

  bool isValid() {
    return 0.0 <= this._r && this._r <= 1.0 &&
           0.0 <= this._g && this._g <= 1.0 &&
           0.0 <= this._b && this._b <= 1.0;
  }

  
  
}
import 'dart:math';

import 'package:flutter/material.dart';

/// Handles calling the ScreenUtil to set up font scaling. All routes should
/// return their child wrapped in this to ensure that all descendents in the
/// widget tree have access to font scaling.
class WrapScreenUtil extends StatelessWidget {
  final Widget child;
  WrapScreenUtil(this.child);

  @override
  Widget build(BuildContext context) {
    /// The current text scale factor
    final currentTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    /// The range text scaling can be in. We support 0.8x to 1.3x.
    var minVal = 0.8;
    var maxVal = 1.3;

    /// For screens < 375 width, fix the text scale factor floor at 1.0 because we just
    /// can't support huge text on screens this small. This would be something like the
    /// iPhone SE 1st gen (smaller than iPhone 7/8).
    if (MediaQuery.of(context).size.width < 375) {
      maxVal = min(1.0, maxVal);
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: currentTextScaleFactor.clamp(minVal, maxVal),
      ),
      child: child,
    );
  }
}

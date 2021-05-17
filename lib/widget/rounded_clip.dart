import 'package:flutter/material.dart';

import 'crb.dart' as crb;

class RoundedClip extends StatelessWidget {
  RoundedClip({
    required this.cornerRadius,
    required this.child,
  });
  final double cornerRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath.shape(
      shape: crb.ContinuousRectangleBorder(
        cornerRadius: cornerRadius,
      ),
      child: child,
    );
  }
}

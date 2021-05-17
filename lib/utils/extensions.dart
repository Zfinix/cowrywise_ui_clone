import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class EXT {}

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

extension PostFrameCallback on VoidCallback {
  void withPostFrameCallback() =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        this();
      });
}

extension StringExtensions on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(' ').map((str) => str.capitalize).join(' ');
  String get svg => 'assets/images/svg/$this.svg';
  String get png => 'assets/images/png/$this.png';
  String get ltt => 'assets/lottiefiles/$this.json';
}

extension TransformationsX on Matrix4 {
  /// Apply perspective to subsequent rotations
  void applyPerspective() => setEntry(2, 2, 0.001);
}

extension NumUtiltiesX on num {
  /// Convert degrees to radians
  ///
  /// Eg `360.degrees` and `2 * pi` are identical.
  double get degrees => vm.radians(toDouble());

  /// Convert a number of rotations to radians.
  ///
  /// Eg `1.rotation`, `360.degrees` and `2 * pi` are identical.
  double get rotations => this * 360.degrees;
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';


void overrideDeviceColors([Color? color]) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    /* set Status bar color in Android devices. */
    statusBarColor: Colors.transparent,
    /* set Status bar icons color in Android devices.*/
    statusBarIconBrightness:
        Platform.isIOS ? Brightness.light : Brightness.light,
    /* set Status bar icon color in iOS. */
    statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
    systemNavigationBarColor: color ?? colorPrimaryDark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

extension CustomThemeContext on BuildContext {
  ThemeData get themeData => ThemeData(
        primaryColor: colorPrimary,
        brightness: Brightness.light,
        fontFamily: 'Circular',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

import 'package:cowrywise/pages/login_or_sign_up.dart';
import 'package:cowrywise/utils/extensions.dart';
import 'package:cowrywise/utils/theme.dart';
import 'package:flutter/material.dart';

import 'widget/ic_wads.dart';
import 'utils/navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    overrideDeviceColors();

    return MaterialApp(
      title: 'Cowrywise',
      theme: context.themeData,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator.key,
      home: LoginOrSignup(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    await Future.delayed(Duration(seconds: 4));
    navigator.navigateFromSplash(LoginOrSignup());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('splashscreen_bg'.png),
          ),
        ),
      ),
    );
  }
}

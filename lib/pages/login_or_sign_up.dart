import 'package:cowrywise/utils/colors.dart';
import 'package:cowrywise/utils/extensions.dart';
import 'package:cowrywise/widget/button.dart';
import 'package:cowrywise/widget/builders/repeating_animated_builder.dart';
import 'package:cowrywise/widget/ic_wads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginOrSignup extends StatefulWidget {
  LoginOrSignup({Key? key}) : super(key: key);

  @override
  _LoginOrSignupState createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup>
    with SingleTickerProviderStateMixin {
  late final AnimationController c;

  @override
  void initState() {
    c = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    c.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryDark,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 30),
                child: SvgPicture.asset(
                  'ic_blue_cw_lockup'.svg,
                  color: white,
                  height: 25,
                )),
            WadsLayout(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Build wealth, the smart way.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: white,
                    fontSize: 35,
                  ),
                ),
                Gap(10),
                Text(
                  'Save and invest with Cowrywise, the only wealth management app you really need.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: colorTextWhite.withOpacity(0.8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Flexible(
                    child: CowryOutlinedButton(
                      height: 53,
                      margin: EdgeInsets.zero,
                      color: white,
                      title: 'LOG IN',
                    ),
                  ),
                  Gap(20),
                  Flexible(
                    child: CowryButton(
                      height: 53,
                      margin: EdgeInsets.zero,
                      color: white,
                      textColor: colorPrimaryDark,
                      title: 'SIGN UP',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WadsLayout extends StatelessWidget {
  const WadsLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          right: 50,
          child: IcWad(
            rotation: 20,
          ),
        ),
        Positioned(
          top: context.screenHeight(.72),
          right: 50,
          child: IcWad(
            rotation: 80,
          ),
        ),
        Positioned(
          top: context.screenHeight(.3),
          right: context.screenWidth(.23),
          child: IcWad(
            rotation: 0,
          ),
        ),
        Positioned(
          top: context.screenHeight(.51),
          right: 45,
          child: IcWad(
            rotation: -20,
          ),
        ),
        Positioned(
          top: context.screenHeight(.35),
          left: 40,
          child: IcWad(
            rotation: 80,
          ),
        ),
        Positioned(
          top: context.screenHeight(.778),
          left: 40,
          child: IcWad(
            rotation: 90,
          ),
        ),
        Positioned(
          top: 50,
          left: 40,
          child: IcWad(
            rotation: -50,
          ),
        ),
      ],
    );
  }
}

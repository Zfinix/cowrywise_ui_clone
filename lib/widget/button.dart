import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cowrywise/utils/colors.dart';

import 'rounded_clip.dart';
import 'crb.dart' as crb;
import 'touchables/touchable_opacity.dart';

/// Custom Cowry UI Button
class CowryButton extends StatelessWidget {
  const CowryButton({
    Key? key,
    this.onPressed,
    this.child,
    this.title,
    this.color,
    this.textColor = white,
    this.height,
    this.width,
    this.margin,
    this.isLoading = false,
    this.disabled = false,
    this.textStyle,
  }) : super(key: key);

  /// The [child] contained by the container.
  /// If non-null, the button will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///

  final Widget? child;

  ///The [title] of the  button.
  /// Ignored if [child] is not null.
  final String? title;
  final Color? color;
  final Color textColor;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final bool isLoading, disabled;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: RoundedClip(
        cornerRadius: 10,
        child: AbsorbPointer(
          absorbing: disabled == true,
          child: AnimatedOpacity(
            opacity: disabled ? 0.5 : 1,
            duration: Duration(milliseconds: 300),
            child: TouchableOpacity(
              onTap: isLoading == true ? null : onPressed,
              child: Container(
                color:
                    (color ?? colorPrimary).withOpacity((isLoading) ? 0.7 : 1),
                height: height ?? 64,
                width: width ?? double.infinity,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: !isLoading
                      ? (child ??
                          Text(
                            title ?? '',
                            style: textStyle ??
                                TextStyle(
                                  fontSize: 14,
                                  color: textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(white),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom Cowry Outlined UI Button
class CowryOutlinedButton extends StatelessWidget {
  const CowryOutlinedButton({
    Key? key,
    this.onPressed,
    this.child,
    this.title,
    this.color,
    this.textColor = white,
    this.height,
    this.width,
    this.margin,
    this.isLoading = false,
    this.disabled = false,
  }) : super(key: key);

  /// The [child] contained by the container.
  /// If non-null, the button will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///

  final Widget? child;

  ///The [title] of the  button.
  /// Ignored if [child] is not null.
  final String? title;
  final Color? color;
  final Color textColor;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final bool isLoading, disabled;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: AbsorbPointer(
        absorbing: disabled == true,
        child: AnimatedOpacity(
          opacity: disabled ? 0.5 : 1,
          duration: Duration(milliseconds: 300),
          child: TouchableOpacity(
            onTap: (isLoading) ? null : onPressed,
            child: Container(
              height: height ?? 64,
              decoration: ShapeDecoration(
                shape: crb.ContinuousRectangleBorder(
                    cornerRadius: 10,
                    borderSide: BorderSide(
                      color: (color ?? colorPrimaryDark)
                          .withOpacity((isLoading) ? 0.7 : 1),
                    )),
              ),
              width: width ?? double.infinity,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: !isLoading
                    ? (child ??
                        Text(
                          title ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(white),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

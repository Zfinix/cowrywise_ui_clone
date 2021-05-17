import 'package:flutter/widgets.dart';

class RepeatingAnimatedBuilder extends StatefulWidget {
  /// A convenience builder that repeats an animation and
  /// provides the value to the builder as a `t` double.
  ///
  /// Can be set to `yoyo` or `loop` using [type]
  const RepeatingAnimatedBuilder({
    Key? key,
    required this.builder,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.linear,
    this.type = RepeatingAnimationType.loop,
    this.child,
  }) : super(key: key);

  /// Provides double `t` animated to a convenience builder.
  final Widget Function(BuildContext context, double t, Widget? child) builder;

  /// Duration to animate
  final Duration duration;

  /// Curve to animate
  final Curve curve;

  /// Type of repeating animation, `yoyo` or `loop`
  final RepeatingAnimationType type;

  /// A child that will not be rebuilt during animation.
  ///
  /// Passed through to [builder] arguments
  final Widget? child;

  @override
  _RepeatingAnimatedBuilderState createState() =>
      _RepeatingAnimatedBuilderState();
}

class _RepeatingAnimatedBuilderState extends State<RepeatingAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          switch (widget.type) {
            case RepeatingAnimationType.yoyo:
              controller.reverse();
              break;
            case RepeatingAnimationType.loop:
            default:
              controller.repeat();
              break;
          }
          break;

        case AnimationStatus.dismissed:
          switch (widget.type) {
            case RepeatingAnimationType.yoyo:
              controller.forward();
              break;
            case RepeatingAnimationType.loop:
            default:
              break;
          }
          break;

        case AnimationStatus.forward:
        case AnimationStatus.reverse:
        default:
          break;
      }
    });

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: controller,
      builder: (context, t, child) {
        return widget.builder(context, widget.curve.transform(t), child);
      },
      child: widget.child,
    );
  }
}

enum RepeatingAnimationType { yoyo, loop }

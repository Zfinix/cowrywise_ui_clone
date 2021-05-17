import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


final navigator = CowryNav();

class CowryNav {
  /// Navigator state key
  final key = GlobalKey<NavigatorState>();

  /// Navigator's current state
  NavigatorState? get state => key.currentState;

  /// Navigator's current context
  BuildContext get context => state!.context;

  /// Instance of ControllerVM

  /// Smooth navigation from Splash
  Future navigateFromSplash(
    Widget route, {
    bool isDialog = false,
  }) {
    popView();
    print('Nav: Current Route -> ${(route.runtimeType)}');
    return state!.push(PageTransition(
      type: PageTransitionType.fade,
      alignment: Alignment.center,
      duration: Duration(milliseconds: 2000),
      child: route,
    ));
  }

  /// Push a named route
  void pushTop(String routeName) {
    print('Nav: Current Route -> ${(routeName)}');

    state!.pushNamed(routeName);
  }

  /// Push a replacement route
  void replaceTop(
    Widget page, {
    bool isDialog = false,
    bool isTransparent = false,
  }) {
    final route = _materialRoute(
      page,
      isDialog: isDialog,
      isTransparent: isTransparent,
    );
    state!.pushReplacement(route);
  }

  /// Push a  route and replace the root route
  void replaceRoot(
    Widget root, {
    bool isDialog = false,
    bool isTransparent = false,
  }) {
    final route = _materialRoute(
      root,
      isDialog: isDialog,
      isTransparent: isTransparent,
    );
    state!.pushAndRemoveUntil(route, (route) => false);
  }

  /// Push a  route
  void pushTo(
    Widget? page, {
    bool isDialog = false,
    bool isTransparent = false,
  }) {
    final route = _materialRoute(
      page,
      isDialog: isDialog,
      isTransparent: isTransparent,
    );
    state!.push(route);
  }

  /// Pop to initial route
  void popToFirst() => state!.popUntil((route) => route.isFirst);

  /// Pop/remove current route
  void popView() => state!.pop();

  /// If ui can pop/remove current route
  bool get canPop => state!.canPop();

  /// Custom material route
  MaterialPageRoute<Object> _materialRoute(
    Widget? widget, {
    bool isDialog = false,
    bool isTransparent = false,
  }) {
    print('Nav: Current Route -> ${(widget.runtimeType)}');

    return isTransparent
        ? TransparentRoute(
            builder: (context) => widget!,
          ) as MaterialPageRoute<Object>
        : MaterialPageRoute(
            fullscreenDialog: isDialog,
            builder: (BuildContext context) => widget!,
          );
  }
}

extension MyNavigator on BuildContext {
  void navigateFromSplash(
    Widget route, {
    bool isDialog = false,
  }) =>
      navigator.navigateFromSplash(
        route,
        isDialog: isDialog,
      );

  void navigateReplace(
    Widget route, {
    bool isDialog = false,
    bool isTransparent = false,
  }) =>
      navigator.replaceTop(
        route,
        isDialog: isDialog,
        isTransparent: isTransparent,
      );

  void navigate(
    Widget route, {
    bool isDialog = false,
    bool isTransparent = false,
  }) =>
      navigator.pushTo(
        route,
        isDialog: isDialog,
        isTransparent: isTransparent,
      );

  void popToFirst() => navigator.popToFirst();

  void popView() => navigator.popView();

  bool get canPop => navigator.canPop;
}

class FadeInRoute<T> extends MaterialPageRoute<T> {
  FadeInRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: SlideTransition(
          transformHitTests: false,
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0, -1.0),
            ).animate(secondaryAnimation),
            child: result,
          ),
        ),
      ),
    );
  }
}

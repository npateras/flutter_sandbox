import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class MyTransitions {
  static CustomTransitionPage getSlideTransitionPage(
      {required BuildContext context,
        required GoRouterState state,
        required Widget child,
        required bool leftToRight}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(0.8, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              // textDirection: leftToRight ? TextDirection.ltr : TextDirection.rtl,
              child: child),
    );

  }
  static Page<dynamic> Function (BuildContext context, GoRouterState state) getSlidePageBuilder(
      {
        required Widget child,
        required bool leftToRight}) {
    return (context, state) => MyTransitions.getSlideTransitionPage(
      context: context, state: state, child: child, leftToRight: leftToRight,);
  }
}
import 'package:eye_do/router.dart';
import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorService({required this.navigatorKey});

  void onPop() {
    navigatorKey.currentState!.pop();
  }

  void onExercise() {
    navigatorKey.currentState!.pushReplacementNamed(AppRouter.exercise);
  }

  void onStart() {
    navigatorKey.currentState!.pushNamed(AppRouter.startExercise);
  }

  void onNotification() {
    navigatorKey.currentState!.pushNamed(AppRouter.notification);
  }

  void onMain() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRouter.navigation,
      (route) => false,
    );
  }
}

import 'package:eye_do/ui/screens/exercise/exercise_screen.dart';
import 'package:eye_do/ui/screens/exercise/start_exercise_screen.dart';
import 'package:eye_do/ui/screens/eye/eye_screen.dart';
import 'package:eye_do/ui/screens/navigatotion/navigation_screen.dart';
import 'package:eye_do/ui/screens/notification/notification_screen.dart';
import 'package:eye_do/ui/screens/schedule/schedule_screen.dart';
import 'package:eye_do/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String eye = '/eye';
  static const String schedule = '/schedule';
  static const String exercise = '/exercise';
  static const String startExercise = '/start-exercise';
  static const String notification = '/notification';
  static const String navigation = '/navigation';

  static MaterialPageRoute onGenerateRouters(RouteSettings settings) {
    final args = settings.arguments as AppRouterArguments?;

    final routes = <String, WidgetBuilder>{
      splash: (_) => const SplashScreen(),
      eye: (_) => EyeScreen(),
      schedule: (_) => const ScheduleScreen(),
      notification: (_) => const NotificationScreen(),
      exercise: (_) => const ExerciseScreen(),
      startExercise: (_) => const StartExerciseScreen(),
      navigation: (_) => const NavigationScreen(),
    };

    WidgetBuilder? builder = routes[settings.name!];
    return MaterialPageRoute(builder: (ctx) => builder!(ctx));
  }
}

class AppRouterArguments {
  AppRouterArguments();
}

import 'package:eye_do/data/database/database.dart';
import 'package:eye_do/domain/services/local_notification_service.dart';
import 'package:eye_do/domain/services/loger.dart';
import 'package:eye_do/domain/services/navigator_service.dart';
import 'package:eye_do/domain/services/shared_preferences_service.dart';
import 'package:eye_do/domain/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

class LocatorService {
  final navigatorKey = GlobalKey<NavigatorState>();
  final getIt = GetIt.instance;
  final localNotificationPlugin = FlutterLocalNotificationsPlugin();
  final dataBase = EyeDoDataBase();
  late ThemeService themeService;

  final sharedPreferencesService = SharedPreferencesService();

  late NavigatorService navigatorService;
  late LocalNotificationService localNotificationService;

  LocatorService() {
    initLogger();
    navigatorService = NavigatorService(navigatorKey: navigatorKey);
    localNotificationService = LocalNotificationService(
      localNotificationPlugin: localNotificationPlugin,
      dataBase: dataBase,
    );
    themeService = ThemeService(sharedPreferencesService: sharedPreferencesService);
    _register();
  }

  void _register() {
    getIt.registerSingleton<NavigatorService>(navigatorService);
    getIt.registerSingleton<SharedPreferencesService>(sharedPreferencesService);
    getIt.registerSingleton<EyeDoDataBase>(dataBase);
    getIt.registerSingleton<LocalNotificationService>(localNotificationService);
    getIt.registerSingleton<ThemeService>(themeService);
  }
}

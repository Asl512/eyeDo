import 'package:eye_do/data/database/database.dart';
import 'package:eye_do/domain/interactors/exception_interactor.dart';
import 'package:eye_do/domain/redux/reducer.dart';
import 'package:eye_do/domain/redux/store.dart';
import 'package:eye_do/domain/services/local_notification_service.dart';
import 'package:eye_do/domain/services/loger.dart';
import 'package:eye_do/domain/services/navigator_service.dart';
import 'package:eye_do/domain/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

class LocatorService {
  final navigatorKey = GlobalKey<NavigatorState>();
  final getIt = GetIt.instance;
  final localNotificationPlugin = FlutterLocalNotificationsPlugin();
  late Store<AppState> store;
  final dataBase = EyeDoDataBase();

  final sharedPreferencesService = SharedPreferencesService();

  final exceptionInteractor = ExceptionInteractor();

  late NavigatorService navigatorService;
  late LocalNotificationService localNotificationService;

  LocatorService() {
    initLogger();
    navigatorService = NavigatorService(navigatorKey: navigatorKey);
    localNotificationService = LocalNotificationService(
      localNotificationPlugin: localNotificationPlugin,
      dataBase: dataBase,
    );
    store = Store(
      appReducer,
      initialState: const AppState(),
      middleware: [],
    );
    _register();
  }

  void _register() {
    getIt.registerSingleton<NavigatorService>(navigatorService);
    getIt.registerSingleton<SharedPreferencesService>(sharedPreferencesService);
    getIt.registerSingleton<ExceptionInteractor>(exceptionInteractor);
    getIt.registerSingleton<EyeDoDataBase>(dataBase);
    getIt.registerSingleton<LocalNotificationService>(localNotificationService);
  }
}

import 'package:eye_do/data/database/database.dart';
import 'package:eye_do/domain/services/local_notification_service.dart';
import 'package:eye_do/domain/services/navigator_service.dart';
import 'package:eye_do/domain/services/shared_preferences_service.dart';
import 'package:eye_do/domain/services/theme_service.dart';
import 'package:get_it/get_it.dart';

class GetItService {
  final getIt = GetIt.instance;

  NavigatorService get navigatorService => getIt.get<NavigatorService>();

  SharedPreferencesService get sharedPreferencesService => getIt.get<SharedPreferencesService>();


  EyeDoDataBase get eyeDoDataBase => getIt.get<EyeDoDataBase>();

  LocalNotificationService get localNotificationService => getIt.get<LocalNotificationService>();

  ThemeService get themeService => getIt.get<ThemeService>();
}

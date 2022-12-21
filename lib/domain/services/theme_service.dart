import 'package:eye_do/data/models/app_theme.dart';
import 'package:eye_do/domain/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  final SharedPreferencesService sharedPreferencesService;
  late AppTheme _appTheme = appThemes.first;

  ThemeService({required this.sharedPreferencesService}) {
    _setFromCashTheme();
  }

  void _setFromCashTheme() async {
    AppTheme theme = await sharedPreferencesService.getTheme();
    _appTheme = theme;
    notifyListeners();
  }

  AppTheme get appTheme => _appTheme;

  void setTheme({required AppTheme appTheme}) {
    _appTheme = appTheme;
    sharedPreferencesService.setTheme(name: appTheme.name);
    notifyListeners();
  }
}

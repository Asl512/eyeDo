import 'package:eye_do/data/models/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const toStart = 'TOSTART';
  static const count = 'COUNT';
  static const exercise = 'EXERCISE';
  static const theme = 'THEME';
}

class SharedPreferencesService {
  //TOSTART

  Future<bool> setStatusStart({required bool status}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(SharedPreferencesKeys.toStart, status);
  }

  Future<bool> getStatusStart() async {
    final prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool(SharedPreferencesKeys.toStart);
    if (status == null) return false;
    return status;
  }

  Future<bool> removeStatusStart() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(SharedPreferencesKeys.toStart);
  }

  //COUNT

  Future<void> plusCount() async {
    final prefs = await SharedPreferences.getInstance();
    int count = await getCount();
    count++;
    await prefs.setInt(SharedPreferencesKeys.count, count);
  }

  Future<int> getCount() async {
    final prefs = await SharedPreferences.getInstance();
    int? count = prefs.getInt(SharedPreferencesKeys.count);
    if (count == null) return 0;
    return count;
  }

  //EXERCISE

  Future<void> plusExercise() async {
    final prefs = await SharedPreferences.getInstance();
    int exercise = await getExercise();
    exercise++;
    await prefs.setInt(SharedPreferencesKeys.exercise, exercise);
  }

  Future<int> getExercise() async {
    final prefs = await SharedPreferences.getInstance();
    int? exercise = prefs.getInt(SharedPreferencesKeys.exercise);
    if (exercise == null) return 0;
    return exercise;
  }

  //THEME

  Future<AppTheme> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString(SharedPreferencesKeys.theme);
    if (name == null) return appThemes.first;
    return appThemes.firstWhere((theme) => theme.name.name == name);
  }

  Future<bool> setTheme({required ThemeName name}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPreferencesKeys.theme, name.name);
  }

  Future<bool> removeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(SharedPreferencesKeys.theme);
  }
}

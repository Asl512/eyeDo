import 'package:eye_do/data/models/app_theme.dart';
import 'package:eye_do/domain/services/get_it_service.dart';
import 'package:eye_do/domain/services/local_notification_service.dart';
import 'package:eye_do/domain/services/navigator_service.dart';
import 'package:eye_do/domain/services/shared_preferences_service.dart';
import 'package:eye_do/domain/services/theme_service.dart';
import 'package:eye_do/ui/res/assets.dart';
import 'package:eye_do/ui/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final getItService = GetItService();
  late NavigatorService navigatorService;
  late DateTime dateTime;
  late LocalNotificationService localNotificationService;
  late SharedPreferencesService sharedPreferencesService;
  late ThemeService themeService;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    sharedPreferencesService = getItService.sharedPreferencesService;
    localNotificationService = getItService.localNotificationService;
    navigatorService = getItService.navigatorService;
    sharedPreferencesService.plusCount();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeService = Provider.of<ThemeService>(context);
  }

  void onChanged(DateTime time) {
    dateTime = time;
  }

  void onSave() {
    localNotificationService.createNotification(dateTime: dateTime);
    navigatorService.onMain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: navigatorService.onMain,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            if (themeService.appTheme.name == ThemeName.green) SvgPicture.asset(AppLikes.green),
            if (themeService.appTheme.name == ThemeName.blue) SvgPicture.asset(AppLikes.blue),
            if (themeService.appTheme.name == ThemeName.brown) SvgPicture.asset(AppLikes.brown),
            const SizedBox(height: 80),
            const Text(
              'Вы молодец!\nТеперь немного\nотдохните от гаджетов.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              'Через сколько вам\nнапомнить про разминку?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 90),
            SizedBox(
              height: 100,
              width: 300,
              child: CupertinoTheme(
                data: const CupertinoThemeData(brightness: Brightness.dark),
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  onDateTimeChanged: onChanged,
                ),
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: onSave,
              child: const Text(
                'Применить',
                style: TextStyle(color: AppColor.backgroundColor),
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: navigatorService.onMain,
              child: const Text(
                'Не напоминать',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

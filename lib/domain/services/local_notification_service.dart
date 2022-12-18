import 'package:eye_do/data/database/database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _localNotificationPlugin;
  final EyeDoDataBase _dataBase;

  LocalNotificationService({
    required FlutterLocalNotificationsPlugin localNotificationPlugin,
    required EyeDoDataBase dataBase,
  })  : _localNotificationPlugin = localNotificationPlugin,
        _dataBase = dataBase {
    _init();
  }

  Future<void> _init() async {
    tz.initializeTimeZones();
    const androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    final iosInitializationSettings = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification);

    final settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _localNotificationPlugin.initialize(
      settings,
      onSelectNotification: _onSelectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const androidNotificationDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    const iosNotificationDetails = IOSNotificationDetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> createNotification({required DateTime dateTime}) async {
    final idNotification = await _dataBase.createNotification(dateTime: dateTime);
    await _createLocalNotification(
      dateTime: dateTime,
      id: idNotification,
    );
  }

  Future<void> _createLocalNotification({
    required DateTime dateTime,
    required int id,
  }) async {
    final notificationDetails = await _notificationDetails();
    await _localNotificationPlugin.zonedSchedule(
      id,
      'Eye Do',
      'Пришло время отвлечься и сделать разминку для глаз!',
      tz.TZDateTime.from(
        dateTime,
        tz.local,
      ),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelAllNotification() {
    return _localNotificationPlugin.cancelAll();
  }

  Future<List<PendingNotificationRequest>> getListPendingNotificationRequest() async {
    return _localNotificationPlugin.pendingNotificationRequests();
  }

  void _onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    print('[onDidReceiveLocalNotification] => id');
  }

  void _onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print(payload);
    }
  }
}

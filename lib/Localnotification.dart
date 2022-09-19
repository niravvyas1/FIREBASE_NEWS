import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification extends StatefulWidget {
  const LocalNotification({Key? key}) : super(key: key);

  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('app_icon');
    IOSInitializationSettings iosinit = IOSInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInit,
      iOS: iosinit,
    );

    notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectnoti);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    showNotifiaction();
                  },
                  child: Text("NOTIFICATION")),
            )
          ],
        ),
      ),
    );
  }

  void onSelectnoti(String? payload) {}

  void showNotifiaction() {
    AndroidNotificationDetails android = AndroidNotificationDetails(
        "1", "Title",
        priority: Priority.high, importance: Importance.max);
    IOSNotificationDetails ios = IOSNotificationDetails();

    notificationsPlugin.show(1, "CHECK NOTIFICATION", "TESTING",
        NotificationDetails(iOS: ios, android: android));
  }
}

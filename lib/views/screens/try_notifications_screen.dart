import 'package:flutter/material.dart';

import '../../services/local_notification_service.dart';

class TryNotificationsScreen extends StatefulWidget {
  const TryNotificationsScreen({super.key});

  @override
  State<TryNotificationsScreen> createState() => _TryNotificationsScreenState();
}

class _TryNotificationsScreenState extends State<TryNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Try Notifications"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                LocalNotificationService.showNotification();
              },
              child: const Text("Oddiy Xabarnoma"),
            ),
            FilledButton(
              onPressed: () {
                LocalNotificationService.showMotivationNotification(
                  title: 'Motivation title',
                  body: 'Motivation body',
                  dateTime: DateTime.now(),
                );
              },
              child: const Text("Rejali Xabarnoma: MOTIVATION "),
            ),
            FilledButton(
              onPressed: () {
                LocalNotificationService.showTodoNotification(
                  title: 'Todo title',
                  body: 'Todo body',
                  dateTime: DateTime.now(),
                );
              },
              child: const Text("Rejali Xabarnoma: TODO"),
            ),
            FilledButton(
              onPressed: () {
                LocalNotificationService.showPomodoroNotification(
                  title: 'Pomodoro title',
                  body: 'Pomodoro body',
                  minutes: 25,
                );
              },
              child: const Text("Davomiy Xabarnoma: POMODORO"),
            ),
          ],
        ),
      ),
    );
  }
}

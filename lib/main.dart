import 'package:flutter/material.dart';
import 'package:flutter_day_49/views/screens/motivations_screen.dart';
import 'package:flutter_day_49/views/screens/pomodoro_screen.dart';
import 'package:flutter_day_49/views/screens/todos_screen.dart';
import 'package:flutter_day_49/views/screens/try_notifications_screen.dart';

import 'services/local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.start();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () async {
        if (!LocalNotificationService.notificationsEnabled) {
          await LocalNotificationService.requestPermission();
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            if (!LocalNotificationService.notificationsEnabled)
              const Text("Notification request denied"),
            Expanded(
              child: PageView(
                children: const [
                  TryNotificationsScreen(),
                  MotivationsScreen(),
                  TodosScreen(),
                  PomodoroScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import '../../services/local_notification_service.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  Timer? _timer;
  int _milliseconds = 0;
  bool _isRunning = false;

  void _startStopwatch() {
    LocalNotificationService.showPomodoroNotification(
      title: 'Pomodoro: Break time',
      body: 'Pomodoro: Have some rest',
      minutes: 1,
    );
    if (_isRunning) return;

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _milliseconds += 100;
      });
    });

    setState(() {
      _isRunning = true;
    });
  }

  void _stopStopwatch() {
    _timer?.cancel();

    setState(() {
      _isRunning = false;
    });
  }

  void _resetStopwatch() {
    _timer?.cancel();

    setState(() {
      _milliseconds = 0;
      _isRunning = false;
    });
  }

  String _formatTime(int milliseconds) {
    int hundredths = (milliseconds / 10).truncate();
    int seconds = (hundredths / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String formattedHundredths = (hundredths % 100).toString().padLeft(2, '0');
    String formattedSeconds = (seconds % 60).toString().padLeft(2, '0');
    String formattedMinutes = (minutes).toString().padLeft(2, '0');

    return "$formattedMinutes:$formattedSeconds.$formattedHundredths";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pomodoro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _formatTime(_milliseconds),
              style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isRunning ? _stopStopwatch : _startStopwatch,
                  child: Text(_isRunning ? 'Stop' : 'Start'),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

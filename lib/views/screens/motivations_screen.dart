import 'package:flutter/material.dart';

class MotivationsScreen extends StatefulWidget {
  const MotivationsScreen({super.key});

  @override
  State<MotivationsScreen> createState() => _MotivationsState();
}

class _MotivationsState extends State<MotivationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Motivations"),
      ),
    );
  }
}

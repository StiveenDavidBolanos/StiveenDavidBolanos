import 'package:flutter/material.dart';

class CompletedMisionsScreen extends StatelessWidget {
  const CompletedMisionsScreen({super.key});
  static String name = 'completedMisions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Misiones completadas'),
      ),
    );
  }
}

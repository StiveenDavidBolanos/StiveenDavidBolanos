import 'package:flutter/material.dart';

class UncompletedMisionsScreen extends StatelessWidget {
  const UncompletedMisionsScreen({super.key});
  static String name = 'uncompletedMisions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendientes'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  static String name = 'tutorial_screen';
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tutorial')),
    );
  }
}

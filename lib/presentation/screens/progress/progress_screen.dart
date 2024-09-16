import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progres indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular progress indicator'),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black38,
          ),
          SizedBox(
            height: 30,
          ),
          Text('Circular progress indicator controlado'),
          _ControlledCircularIndicator(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class _ControlledCircularIndicator extends StatelessWidget {
  const _ControlledCircularIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return value * 2 / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircularProgressIndicator(
              value: progressValue,
              strokeWidth: 2,
              backgroundColor: Colors.black38,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(child: LinearProgressIndicator(value: progressValue))
          ]),
        );
      },
    );
  }
}

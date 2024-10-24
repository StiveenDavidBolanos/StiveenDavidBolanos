import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});
  static String name = 'Counter_screen';
  final int valor = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int valor = ref.watch(counterProvider);
    final bool isDarkModeOn = ref.watch(isDarkModeOnProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeOnProvider.notifier).state = !isDarkModeOn;
              },
              icon: isDarkModeOn
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
      ),
      body: Center(
          child: Text(
        'Valor $valor',
        style: Theme.of(context).textTheme.titleLarge,
      )),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: const Icon(Icons.plus_one_rounded),
        ),
        const SizedBox(
          height: 15,
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state--;
          },
          child: const Icon(Icons.exposure_minus_1_rounded),
        ),
      ]),
    );
  }
}

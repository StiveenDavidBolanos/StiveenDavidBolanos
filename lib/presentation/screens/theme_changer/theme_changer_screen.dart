import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static String name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkModeOn = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: isDarkModeOn
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
        title: const Text('Theme Changer'),
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colorList = ref.watch(colorListProvider);
    final indexColor = ref.watch(themeNotifierProvider).selectedColor;
    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final Color color = colorList[index];

        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: indexColor,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColorTheme(index);
          },
        );
      },
    );
  }
}

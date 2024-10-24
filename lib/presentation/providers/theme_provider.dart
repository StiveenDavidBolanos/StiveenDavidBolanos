import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Bollean para el modo oscuro
final StateProvider<bool> isDarkModeOnProvider = StateProvider(
  (ref) => true,
);

//Lista de colores inmutable
final colorListProvider = Provider(
  (ref) {
    return colorList;
  },
);

//Color seleccionado para el tema

final StateProvider<int> selectedColorProvider = StateProvider(
  (ref) {
    return 0;
  },
);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorTheme(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}

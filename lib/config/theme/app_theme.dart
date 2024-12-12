import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.teal,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.black12
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = true, this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= colorList.length - 1,
            'Selected color must be between 0 and ${colorList.length - 1}');

  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor]);
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) {
    return AppTheme(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        selectedColor: selectedColor ?? this.selectedColor);
  }
}

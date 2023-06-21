import 'package:flutter/material.dart';
import 'package:tascd/src/utils/my_colors.dart';

List<Color> _colorThemes = [
  MyColors.primaryColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.red,
  Colors.white,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length - 1,
            'colors must be between 0 and ${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: _colorThemes[selectedColor]),
      //brightness: Brightness.dark
    );
  }
}

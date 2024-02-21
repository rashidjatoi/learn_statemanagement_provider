import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get theme => _themeData;

  void toggleTheme() {
    final isLight = _themeData == ThemeData.light();
    if (isLight) {
      _themeData = ThemeData.dark();
    } else {
      _themeData = ThemeData.light();
    }

    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {

  bool _isDark = false;

  //--------------------------------
  // GETTERS
  //--------------------------------
  bool get isDark => _isDark;

  ThemeMode get themeMode =>
      _isDark
          ? ThemeMode.dark
          : ThemeMode.light;

  //--------------------------------
  // TOGGLE
  //--------------------------------
  void toggleTheme() {

    _isDark = !_isDark;

    notifyListeners();
  }

  //--------------------------------
  // OPTIONAL DIRECT SET
  //--------------------------------
  void setTheme(bool value) {

    _isDark = value;

    notifyListeners();
  }
}
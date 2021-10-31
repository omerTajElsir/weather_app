import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  static const String THEME = 'theme';
}

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    _loadCurrentTheme();
  }

  bool _darkTheme = true;
  bool get darkTheme => _darkTheme;

  /// Setting the status between light and dark theme
  Future<void> toggleTheme() async {
    _darkTheme = !_darkTheme;

    // Saving the theme on session
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(AppConstants.THEME, _darkTheme);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    // Loading saved theme from session
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _darkTheme = sharedPreferences.getBool(AppConstants.THEME) ?? false;
    notifyListeners();
  }
}

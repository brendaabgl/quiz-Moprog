import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  final Map<String, Map<String, dynamic>> _themes = {
    'Ocean': {
      'themeData': ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: const Color(0xFFE3F2FD),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      'backgroundImage': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    },
    'Forest': {
      'themeData': ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFE8F5E9),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
      ),
      'backgroundImage': 'https://images.unsplash.com/photo-1586277526843-23a623285cd1',
    },
    'Sunset': {
      'themeData': ThemeData(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: const Color(0xFFFFF3E0),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
      ),
      'backgroundImage': 'https://images.unsplash.com/photo-1559583985-c80d8ad9b29f',
    },
  };

  final List<String> _fonts = ['Pacifico', 'Montserrat', 'Lobster', 'Roboto', 'Playfair Display'];

  String _currentTheme = 'Ocean';
  String _currentFont = 'Pacifico';

  Map<String, Map<String, dynamic>> get themes => _themes;

  String get currentTheme => _currentTheme;
  ThemeData get currentThemeData => _themes[_currentTheme]!['themeData'];
  String get currentBackgroundImage => _themes[_currentTheme]!['backgroundImage'];

  List<String> get fonts => _fonts;
  String get currentFont => _currentFont;

  void changeTheme(String themeName) {
    if (_themes.containsKey(themeName)) {
      _currentTheme = themeName;
      notifyListeners();
    }
  }

  void changeFont(String fontName) {
    if (_fonts.contains(fontName)) {
      _currentFont = fontName;
      notifyListeners();
    }
  }
}
  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_provider.dart';
import 'main_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Aesthetic Theme App',
          theme: themeProvider.currentThemeData.copyWith(
            textTheme: themeProvider.currentThemeData.textTheme.apply(
              fontFamily: GoogleFonts.getFont(themeProvider.currentFont).fontFamily,
            ),
          ),
          home: MainScreen(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: themeProvider.currentThemeData.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ExpansionTile(
              title: const Text(
                'Themes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              children: themeProvider.themes.keys.map((theme) {
                return ListTile(
                  leading: Icon(
                    Icons.color_lens,
                    color: themeProvider.currentTheme == theme
                        ? themeProvider.currentThemeData.primaryColor
                        : Colors.grey,
                  ),
                  title: Text(theme),
                  onTap: () => themeProvider.changeTheme(theme),
                );
              }).toList(),
            ),
            ExpansionTile(
              title: const Text(
                'Fonts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              children: themeProvider.fonts.map((font) {
                return ListTile(
                  leading: Icon(
                    Icons.font_download,
                    color: themeProvider.currentFont == font
                        ? themeProvider.currentThemeData.primaryColor
                        : Colors.grey,
                  ),
                  title: Text(
                    font,
                    style: TextStyle(fontFamily: font),
                  ),
                  onTap: () => themeProvider.changeFont(font),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

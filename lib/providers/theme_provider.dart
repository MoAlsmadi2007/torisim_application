import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier {
bool isDarkMode = false;
ThemeData? themeData;
void toggleTheme() {
isDarkMode = !isDarkMode;
themeData = isDarkMode ?
ThemeData.dark() :
ThemeData.light();
notifyListeners();
}
}   
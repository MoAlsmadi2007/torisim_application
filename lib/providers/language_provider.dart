import 'package:flutter/material.dart';
class LanguageProvider extends ChangeNotifier {
Locale locale = const Locale('en');
void toggleLanguage() {
locale = locale.languageCode == 'en'
? const Locale('ar')
: const Locale('en');
notifyListeners();
}
}
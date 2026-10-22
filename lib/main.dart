import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'providers/language_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ThemeProvider()),
        ChangeNotifierProvider(create: (_)=> LanguageProvider())
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        fallbackLocale: const Locale('en'),
        path: 'assets/langs',
        child: MyApp(),),
    )
    );
}
class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeProvider.isDarkMode ? 
      ThemeData.dark():
      ThemeData.light(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen(),);
  }
}
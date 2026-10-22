import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:torisim_applicatoin/screens/category_page.dart';
//import 'package:torisim_application/screens/category_page.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              themeProvider.toggleTheme();
            }, 
            icon: Icon(
              themeProvider.isDarkMode? 
              Icons.dark_mode:
              Icons.light_mode
              ),
              ),
          IconButton(
            onPressed: (){
             languageProvider.toggleLanguage();
             context.setLocale(languageProvider.locale);
            }, 
            icon: Text(
              languageProvider.locale.languageCode=="en"?"AR":"EN")
              ),
        ],
        title: Text("title".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("greeting".tr()),
            Divider(),
            SizedBox(
              height: 600,
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context)=> CategoryPage(category: "church")));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Image.asset(
                              "assets/images/church.png",width: 50,),
                            Text("Church",
                            style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold)),
                              
                    
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context)=> CategoryPage(category: "cemetery")));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Image.asset(
                              "assets/images/cemetery.png",width: 50,),
                            Text("Cemetery",
                            style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold)),
                              
                    
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context)=> CategoryPage(category: "wells")));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Image.asset(
                              "assets/images/water-well.png",width: 50,),
                            Text("Water Wells",style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold)),
                              
                    
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context)=> CategoryPage(category: "caves")));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Image.asset(
                              "assets/images/cave.png",width: 50,),
                            Text("Caves",
                            style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold)),
                              
                    
                        ],
                      ),
                    ),
                  ),
                ],),
            )
          ],
        ),
      ),
    );
  }
}
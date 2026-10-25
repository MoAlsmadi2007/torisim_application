import 'dart:async';
import 'package:flutter/material.dart';
import '../../screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 1),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=> HomeScreen()));
    });
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            Text("TOURISM IN RIHAB",style: TextStyle(
              fontSize: 24,color: Colors.white
            ),),
            Text("السياحة في رحاب",style: TextStyle(
              fontSize: 24,color: Colors.white
            ),),
            SizedBox(height: 30,),
            CircularProgressIndicator()
          
          ],
        ),
      ),
    );
  }
}
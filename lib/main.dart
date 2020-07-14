import 'package:flutter/material.dart';
import 'package:nike_app_ui/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike app UI',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
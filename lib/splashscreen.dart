import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nike_app_ui/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Size ds = Size(0.0, 0.0);

  TextStyle style = TextStyle(
    fontFamily: 'Jomhuria',
    fontWeight: FontWeight.w900,
    fontSize: 290,
    color: Colors.white10,
    letterSpacing: 10,
    height: .6,
  );

  @override
  void initState() { 
    super.initState();
    
    Timer(Duration(milliseconds: 4000), () {
      print("Going to home page");
      return Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 70),
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 167, 0, 1),
                  Color.fromRGBO(255, 110, 0, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'JUST',
                  style: style,
                ),
                Text(
                  'DO',
                  style: style,
                ),
                Text(
                  'IT',
                  style: style,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('images/nike_logo.png', fit: BoxFit.fill, height: 60),
          ),
          Container(
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 40),
            child: SpinKitCubeGrid(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

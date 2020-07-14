import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double radius = 30.0;
  Size ds = Size(0.0, 0.0);
  IconData icon = Icons.favorite_border;
  Color orange = Color.fromRGBO(251, 116, 11, 1);

  AnimationController topBarAC, imageAC, ratingAC;

  TextStyle style(Color color, double size) {
    return TextStyle(
      fontSize: size,
      fontFamily: 'Roboto_italic',
      color: color,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    );
  }

  @override
  void initState() {
    super.initState();

    topBarAC = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    imageAC = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    ratingAC = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1400));

    topBarAC.forward();
    imageAC.forward();
    ratingAC.forward();
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Bottom orange container
          Container(
            color: orange,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Size text
                Text(
                  'SIZE',
                  style: style(Colors.black, 22),
                ),
                SizedBox(height: 5),
                // Size number and add to card button
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Size number
                      Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: orange,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Text(
                            '7',
                            style: style(Colors.black, 24),
                          )),
                      // Add to card button
                      RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 14),
                          child: Text(
                            'Add to cart',
                            style: style(Colors.white, 22),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Black container
          Container(
            height: ds.height - 100.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
          ),
          // Grey semi circular layout
          Transform.scale(
            scale: 1.5,
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(30, 30, 30, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200.0),
                  bottomRight: Radius.circular(200.0),
                ),
              ),
            ),
          ),
          // Contents
          Container(
            height: ds.height - 100.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // Top bar
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            SlideTransition(
                              position: Tween<Offset>(
                                      begin: Offset(-1, 0), end: Offset(0, 0))
                                  .animate(
                                CurvedAnimation(
                                  curve: Curves.fastOutSlowIn,
                                  parent: topBarAC,
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text('RUNNING',
                                    style: style(Colors.white, 20)),
                              ),
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                      begin: Offset(-1, 0), end: Offset(0, 0))
                                  .animate(
                                CurvedAnimation(
                                  curve: Curves.fastOutSlowIn,
                                  parent: topBarAC,
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text('BASKETBALL',
                                    style: style(Colors.white, 20)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Favourite icon
                      SlideTransition(
                        position: Tween<Offset>(
                                begin: Offset(2, 0), end: Offset(0, 0))
                            .animate(
                          CurvedAnimation(
                            curve: Curves.fastOutSlowIn,
                            parent: topBarAC,
                          ),
                        ),
                        child: Container(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                icon = icon == Icons.favorite_border
                                    ? Icons.favorite
                                    : Icons.favorite_border;
                              });
                            },
                            icon: Icon(icon,
                                color: Color.fromRGBO(251, 116, 11, 1),
                                size: 34),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Shoe image
                ScaleTransition(
                  scale: Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(curve: Curves.bounceOut, parent: imageAC),
                  ),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 60, right: 40, bottom: 100),
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: (pi / 180.0) * 35,
                      child: Image.asset('images/shoe.png', fit: BoxFit.fill),
                    ),
                  ),
                ),
                // Rating
                SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(-2, 0), end: Offset(0, 0))
                          .animate(
                    CurvedAnimation(
                        curve: Curves.easeInOutBack, parent: ratingAC),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: Row(
                      children: <Widget>[
                        // Rating number
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                transform: Matrix4.skewX(-40 / 100),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(251, 116, 11, 1),
                                      Color.fromRGBO(247, 120, 6, 1),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '4.0',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Rating star
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          child: Stack(
                            children: <Widget>[
                              Transform.translate(
                                offset: Offset(-4, 0),
                                child: Container(
                                  margin: EdgeInsets.only(right: 0),
                                  transform: Matrix4.skewX(-40 / 100),
                                  width: ds.width - 80 - 80 - 40,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(38, 38, 38, 1),
                                  ),
                                ),
                              ),
                              Container(
                                width: ds.width - 80 - 80 - 80,
                                height: 60,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.star,
                                        color: Color.fromRGBO(251, 116, 11, 1),
                                        size: 30),
                                    Icon(Icons.star,
                                        color: Color.fromRGBO(251, 116, 11, 1),
                                        size: 30),
                                    Icon(Icons.star,
                                        color: Color.fromRGBO(251, 116, 11, 1),
                                        size: 30),
                                    Icon(Icons.star,
                                        color: Color.fromRGBO(251, 116, 11, 1),
                                        size: 30),
                                    Icon(Icons.star_border,
                                        color: Color.fromRGBO(251, 116, 11, 1),
                                        size: 30),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Color, Name and price
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Column(
                    children: <Widget>[
                      // Colors
                      SlideTransition(
                        position: Tween<Offset>(
                                begin: Offset(-2, 0), end: Offset(0, 0))
                            .animate(
                          CurvedAnimation(
                              curve: Curves.fastOutSlowIn, parent: topBarAC),
                        ),
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                'COLORS',
                                style: style(Colors.white, 20),
                              ),
                              SizedBox(width: 20),
                              CircleAvatar(backgroundColor: orange, radius: 10),
                              SizedBox(width: 10),
                              CircleAvatar(
                                  backgroundColor: Colors.blue, radius: 10),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Name and Price
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SlideTransition(
                              position: Tween<Offset>(
                                      begin: Offset(-1, 0), end: Offset(0, 0))
                                  .animate(
                                CurvedAnimation(
                                    curve: Curves.fastOutSlowIn,
                                    parent: topBarAC),
                              ),
                              child: Text('NIKE RUNNING SHOES',
                                  style: style(Colors.white, 20)),
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                      begin: Offset(1, 0), end: Offset(0, 0))
                                  .animate(
                                CurvedAnimation(
                                    curve: Curves.fastOutSlowIn,
                                    parent: topBarAC),
                              ),
                              child: Text('\$ 399', style: style(orange, 28)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

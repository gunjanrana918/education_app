import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'splash screen demo',
    theme: ThemeData(
      primaryColor: new Color(0xff622F74),
      accentColor: Colors.deepOrange,
    ),
    home: SplashScreentwo(),
  ));
}
class SplashScreentwo extends StatefulWidget {
  @override
  _SplashScreentwo createState() => _SplashScreentwo();
}

class _SplashScreentwo extends State<SplashScreentwo> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  startTimer()async{
    var duration= Duration(seconds: 5);
    return Timer(duration, route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>Slider()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'this is splash screen',
                style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.w900,color: Colors.black,
                    fontFamily: "cursive"),
              )
            ],
          )
        ],
      ),
    );
  }
}

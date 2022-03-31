import 'dart:async';
import 'package:education_app/slider_screen.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  startTimer()async{
    var duration= Duration(seconds: 10);
    return Timer(duration, route);
  }
  route()
  {
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=> Sliders()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage ('custom/bg1.jpg'),
                  fit: BoxFit.fill
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'custom/logo1.png',
                height: 180,width: 200,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20.0)),
              Text(
                'Brahmastra Classes',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 35.0,color: Colors.black,
                  fontWeight:FontWeight.bold,
                ),)
            ],
          )
        ],
      ),
    );
  }
}

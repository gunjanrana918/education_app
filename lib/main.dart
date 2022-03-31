import 'package:flutter/material.dart';
import 'package:education_app/login_screen.dart';
import 'package:education_app/signup_screen.dart';
import 'package:education_app/splash_scrreen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.deepOrange,
    ),
    home:SplashScreen(),
  ));
}
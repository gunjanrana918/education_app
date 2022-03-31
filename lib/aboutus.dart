import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 void main()
 {
   runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
     home: AboutUs(),
   ));
 }

 class AboutUs extends StatefulWidget {
   @override
   _AboutUsState createState() => _AboutUsState();
 }

 class _AboutUsState extends State<AboutUs> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('About Us',
         style: TextStyle(fontSize: 20.0),),
         centerTitle: true,
         backgroundColor: Colors.blueGrey,
       ),
       body: ListView(
         children: <Widget>[
         Container(
         height: 200,
         decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage('custom/S1.jpg'),fit: BoxFit.fill
             )),
       ),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Text("Dear Candidates,Welcome to the Brahmastra Classes mobile app. This online course created by "
                 "renowned experts is being provided to you for a affardable fee. If you want to prepare for "
                 "competitive exam or if you are a school students then believe that there is no better option.", textAlign: TextAlign.justify,
               style: TextStyle(fontSize: 18.0,),),
           ),
     ])
     );

   }
 }

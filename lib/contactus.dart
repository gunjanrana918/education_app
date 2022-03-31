import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 void main()
 {
   runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
     home: ContactUs(),
   ));
 }

 class ContactUs extends StatefulWidget {
   @override
   _ContactUsState createState() => _ContactUsState();
 }

 class _ContactUsState extends State<ContactUs> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Contact Us'),
         centerTitle: true,
         backgroundColor: Colors.blueGrey,
       ),
       body: ListView(
         children: <Widget>[
           Container(
             height: 200,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage ('custom/contactusbanner.jpg'), fit: BoxFit.cover,
               ),
             ),
             ),
           Padding(
             padding: const EdgeInsets.all(5.0),
             child: Text("Brahmastra Classes", textAlign: TextAlign.center,
               style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,),),
           ),
           Divider(height: 10.0,color: Colors.grey,),
           Padding(padding: EdgeInsets.only(top: 20)),
           Text('Email : brahamstraclassesdatia@gmail.com',
             style: TextStyle(
                 fontSize: 16.0,color: Colors.blueAccent),textAlign: TextAlign.center,),
           Padding(padding: EdgeInsets.only(top: 20)),
           Text('Call On : (+91) 8462021017, (+91) 9131348317',
             style: TextStyle(
                 fontSize: 16.0,color: Colors.blueAccent),textAlign: TextAlign.center,),
           Padding(padding: EdgeInsets.only(top: 20,)),
           Text('Address : Thandi Sadak Datia (M.P)',
             style: TextStyle(
                 fontSize: 16.0,color: Colors.blueAccent),textAlign: TextAlign.center,),
           Padding(padding: EdgeInsets.only(bottom: 10.0)),
           Divider(height: 10.0,color: Colors.grey,),
           Padding(padding: EdgeInsets.only(top:30.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("custom/facebook.png",),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Image.asset("custom/youtube.png",),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Image.asset("custom/gmail.png",),
                ],
              ),
           ] ),


     );








   }
 }

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:education_app/universaldata.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(universaldata.videtitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,),
      body: WebView(
        initialUrl: universaldata.topic_video_path,
        javascriptMode:JavascriptMode.unrestricted )
      ,
    );
  }
}


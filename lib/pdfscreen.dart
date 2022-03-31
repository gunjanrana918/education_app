import 'package:education_app/universaldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';


void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: pdfscreen(),
));
class pdfscreen extends StatefulWidget {
  @override
  _pdfscreenState createState() => _pdfscreenState();
}

class _pdfscreenState extends State<pdfscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(universaldata.topic_name,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,),
        body:  PDF(
          swipeHorizontal: false,
          pageFling: true,
          enableSwipe: true,
        ).cachedFromUrl("http://ankushapp.iotans.in/docs/"+universaldata.topic_pdf_path),

      ),
    );
  }
}


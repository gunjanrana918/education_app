import 'package:flutter/material.dart';
import 'package:education_app/universaldata.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: buynow(),
));
class buynow extends StatefulWidget {
  @override
  _buynowState createState() => _buynowState();
}

class _buynowState extends State<buynow> {
  @override
  Widget build(BuildContext context) {
    var url='http://ankushapp.iotans.in/payment/boardpayment/?studentid='+universaldata.sid.replaceAll(":", "").replaceAll(" ", "")+'&studentName='+universaldata.sname.replaceAll(":", "").replaceAll(" ", "")+'&mobileno='+universaldata.mobile.replaceAll(":", "").replaceAll(" ", "")+'&boardname='+universaldata.boardname+'&classname='+universaldata.SelectedClassname+'&subjectid='+universaldata.subjectid+'&subjectname='+universaldata.subjectname+'&amount='+universaldata.amount;
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Subject",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,),
      body: WebView(
          initialUrl: url,
          javascriptMode:JavascriptMode.unrestricted

      ),

    );
  }
}



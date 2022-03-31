import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:education_app/universaldata.dart';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: viewmorepdf(),
));
class viewmorepdf extends StatefulWidget {
  @override
  _viewmorepdfState createState() => _viewmorepdfState();
}

class _viewmorepdfState extends State<viewmorepdf> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Online Payment"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
        body: WebView(
            initialUrl: universaldata.payurl.toString(),
            javascriptMode:JavascriptMode.unrestricted
        )

    );
  }
}

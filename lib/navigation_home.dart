import 'package:education_app/universaldata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: profie(),
));

class profie extends StatefulWidget {
  @override
  _profieState createState() => _profieState();
}

class _profieState extends State<profie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('MY PROFILE'),
    centerTitle: true,
    backgroundColor: Colors.blueGrey,
    ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Image.asset(
                'custom/logo1.png',
                height: 200,width: 350,),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Card(
                margin: EdgeInsets.all(35.0),
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.brown,width: 2.0)
                ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Text('Student Name : '+universaldata.sname,
                          style: TextStyle(fontSize: 18.0,color: Colors.black),
                        ),
                        Divider(height: 10,),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Text('Email :'+universaldata.email,
                          style: TextStyle(fontSize: 18.0,color: Colors.black),
                        ),
                        Divider(height: 10,),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Text('Mobile :'+universaldata.mobile,
                          style: TextStyle(fontSize: 18.0,color: Colors.black),
                        ),
                        Divider(height: 10,),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Text('Password : XXXXXXXX',
                          style: TextStyle(fontSize: 18.0,color: Colors.black),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                      ],
                    ),
                  )
              )
            ],

          ) ,

        ),

      ],
    )

    );
  }
}

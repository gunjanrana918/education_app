
import 'package:flutter/material.dart';

import 'viewmorebutton.dart';


void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: buysubject(),
));

class buysubject extends StatefulWidget {
  @override
  _buysubjectState createState() => _buysubjectState();
}

class _buysubjectState extends State<buysubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUY SUBJECT'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage ('custom/bg1.jpg'),
                fit: BoxFit.fill
            ),
          ),
          child: ListView.builder(
              itemBuilder: (context, builder){
                return Card(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.brown[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15.0,left: 15.0,right: 15.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Subject Title',
                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                            ),
                            Text('Class Name',
                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                            ),
                            Text('Amount',
                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                            ),
                            Text('Duration',
                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => viewmorepdf()));
                                    },
                                    child: Text('View More', style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),)
                                ),
                                Padding(padding: EdgeInsets.only(right: 20)),
                                RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)
                                    ),
                                    onPressed: () {
                                      },

                                    child: Text('Buy Now', style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),)
                                ),
                              ],

                            ),
                          ]),
                    )

                );

              }
          )

      ),
    );
  }
}

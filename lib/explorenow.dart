import 'package:flutter/material.dart';


void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: explorebutton(),
));

class explorebutton extends StatefulWidget {
  @override
  _explorebuttonState createState() => _explorebuttonState();
}

class _explorebuttonState extends State<explorebutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXPLORE COURSES'),
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
                            Text('Course Title',
                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                            ),
                            Text('Description',
                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                            ),
                            Text('Uploaded On',
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
                                    onPressed: () {},

                                    child: Text('Read PDF', style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),)
                                ),
                                Padding(padding: EdgeInsets.only(right: 20)),
                                RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)
                                    ),
                                    onPressed: () {},

                                    child: Text('View Video', style: TextStyle(
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

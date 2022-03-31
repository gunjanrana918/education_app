
import 'package:education_app/board_library.dart';
import 'package:education_app/classbuylibrary.dart';
import 'package:education_app/mylibraryhomescreen.dart';
import 'package:education_app/universaldata.dart';
import 'package:flutter/material.dart';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: mylibrary_dashboard(),
));

class mylibrary_dashboard extends StatefulWidget {
  @override
  _mylibrary_dashboardState createState() => _mylibrary_dashboardState();
}

class _mylibrary_dashboardState extends State<mylibrary_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY LIBRARY'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage ('custom/bg1.jpg'),
                fit: BoxFit.fill
            ),
          ),
          child: GridView.count(
                crossAxisCount: 2,
              children: <Widget>[

               Card(
                   margin: EdgeInsets.all(18.0),
                 color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.brown),
                  ),
                  child:InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => mylibrary()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.local_library,size: 70,color:Colors.redAccent),
                          Text('COMPETITIVE EXAMS',textAlign: TextAlign.center, style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                    ),
                  )

               ),

                Card(
                    margin: EdgeInsets.all(18.0),
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.brown),
                    ),
                    child:InkWell(
                      onTap:(){
                        universaldata.boardname="CBSE";
                        Navigator.push(context, MaterialPageRoute(builder: (context) => boardlibrary()));
                      },
                      splashColor: Colors.green,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.local_library,size: 70,color:Colors.redAccent),
                            Text('CBSE Board', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                      ),
                    )

                ),

                Card(
                    margin: EdgeInsets.all(18.0),
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.brown),
                    ),
                    child:InkWell(
                      onTap:(){
                        universaldata.boardname="ICSE";
                        Navigator.push(context, MaterialPageRoute(builder: (context) => boardlibrary()));
                      },
                      splashColor: Colors.green,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.local_library,size: 70,color:Colors.redAccent),
                            Text('ICSE Board', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                      ),
                    )
                ),

                Card(
                    margin: EdgeInsets.all(18.0),
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.brown),
                    ),
                    child:InkWell(
                      onTap:(){
                        universaldata.boardname="MP";
                        Navigator.push(context, MaterialPageRoute(builder: (context) => boardlibrary()));
                      },
                      splashColor: Colors.green,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.local_library,size: 70,color:Colors.redAccent),
                            Text('MP Board', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              ]),


        ),
    );
  }
}

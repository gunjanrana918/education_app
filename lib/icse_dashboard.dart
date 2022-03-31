import 'package:education_app/icsesubjectclass6.dart';
import 'package:flutter/cupertino.dart';
import 'package:education_app/universaldata.dart';
import 'package:flutter/material.dart';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: IcseDashboard(),
));

class IcseDashboard extends StatefulWidget {
  @override
  _IcseDashboardState createState() => _IcseDashboardState();
}

class _IcseDashboardState extends State<IcseDashboard> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('SELECT CLASS'),
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
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(25.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.brown,width: 2.0)
              ),
              child: InkWell(
                onTap:(){
                 universaldata.SelectedClassname="6th";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => icsesubject()));
                  },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.library_books,size: 70,color: Colors.redAccent[200],),
                      Text('CLASS 6',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(25.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.brown,width: 2.0)
              ),
              child: InkWell(
                onTap:(){
                  universaldata.SelectedClassname="7th";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => icsesubject()));

                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.library_books,size: 70,color: Colors.redAccent[200],),

                      Text('CLASS 7',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(25.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.brown,width: 2.0)
              ),
              child: InkWell(
                onTap:(){
                  universaldata.SelectedClassname="8th";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => icsesubject()));

                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.library_books,size: 70,color: Colors.redAccent[200],),

                      Text('CLASS 8',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(25.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.brown,width: 2.0)
              ),
              child: InkWell(
                onTap:(){
                  universaldata.SelectedClassname="9th";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => icsesubject()));

                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.library_books,size: 70,color: Colors.redAccent[200],),

                      Text('CLASS 9',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(25.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.brown,width: 2.0)
              ),
              child: InkWell(
                onTap:(){
                  universaldata.SelectedClassname="10th";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => icsesubject()));

                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.library_books,size: 70,color: Colors.redAccent[200],),

                      Text('CLASS 10',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(25.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.brown,width: 2.0)
              ),
              child: InkWell(
                onTap:(){
                  universaldata.SelectedClassname="11th";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => icsesubject()));

                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.library_books,size: 70,color: Colors.redAccent[200],),

                      Text('CLASS 11',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(25.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.brown,width: 2.0)
              ),
              child: InkWell(
                onTap:(){
                  universaldata.SelectedClassname="12th";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => icsesubject()));
                  },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.library_books,size: 70,color: Colors.redAccent[200],),
                      Text('CLASS 12',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:carousel_pro/carousel_pro.dart';
import 'package:education_app/login_screen.dart';
import 'package:education_app/mylibrary.dart';
import 'package:education_app/universaldata.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:education_app/cbse_dashboard.dart';
import 'package:education_app/competition_dashboard.dart';
import 'package:education_app/icse_dashboard.dart';
import 'package:education_app/mp_dashboard.dart';
import 'package:flutter/services.dart';

import 'aboutus.dart';
import 'contactus.dart';
import 'navigation_home.dart';
import 'navigation_notification.dart';


void main(List<String> args){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    Widget imageSliderCarousel=Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(0.0), color: Colors.red
      ),
      height: 200,
      child: Carousel(
        boxFit: BoxFit.fill,
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 2000),
        dotSize: 5.0,
        dotBgColor: Colors.transparent,
        showIndicator: false,
        images: [
          AssetImage('custom/Slider1.jpg'),
          AssetImage('custom/S2.jpg'),
          AssetImage('custom/Slider7.png'),
          AssetImage('custom/S4.jpg'),
          AssetImage('custom/Slider5.jpg'),
          AssetImage('custom/S3.jpg'),
          AssetImage('custom/S5.jpg'),
          AssetImage('custom/S1.jpg'),
        ],
      ),
    );
    Widget gridview=Container(
      height: 450,
      child:  GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(18.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CompDashboard()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('custom/competation.png'),
                      Text('Competitive Exams',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MpDashboard()));
                },
                splashColor: Colors.green,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(7.0)),
                      Image.asset('custom/mpboard.png'),
                      Text('MP Board',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(18.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              color: Colors.white30,
              child: InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CbseDashboard()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('custom/cbse.png'),
                      //Icon(Icons.local_library,size: 70,color: Colors.redAccent[200],),
                      Text('CBSE Board', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(18.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => IcseDashboard()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('custom/icse.png'),
                      Text('ICSE Board',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(18.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => mylibrary_dashboard()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //Image.asset('custom/readingbook.png'),
                      Icon(Icons.local_library,size: 100,color:Colors.indigo),
                      Text('My Library',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(18.0),
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: InkWell(
                onTap:(){
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.share,size:95,color: Colors.blueGrey,),
                      Text('Share & Earn',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
          ]
      ),
    );
    int index=0;
    List<Widget> list=[

      profie(),
      Setting(),
      AboutUs(),
      ContactUs(),

    ];

    return new WillPopScope(
        onWillPop: _onWillPop,
   child: new Scaffold(
      appBar: AppBar(
        title: Text('Brahamastra Classes',
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications),
              onPressed: (){}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown[600]
              ),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("custom/logo1.png"),
              ),
                accountName: Text("Welcome : "+universaldata.sname.replaceAll(":", "")),
                accountEmail: Text(universaldata.email.replaceAll(":", ""))),
          InkWell(
            onTap: (){},
            child: ListTile(
              leading: Icon(Icons.person,size: 30.0,),
              title: Text('Profile',style: TextStyle(fontSize: 15.0),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => profie()));
              },
            ),
          ),
            ListTile(
              leading: Icon(Icons.notifications,size: 30.0,),
              title: Text('Notification',style: TextStyle(fontSize: 15.0),),
                onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
            }
            ),
            Divider(height: 10,),
            ListTile(
              leading: Icon(Icons.exit_to_app,size: 30.0,),
              title: Text('log Out',style: TextStyle(fontSize: 15.0),), onTap: () {
              SystemNavigator.pop();
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              // Navigator.of(context).pop(true);
            }
            ),
            ListTile(
              leading: Icon(Icons.question_answer,size: 30.0,),
              title: Text('About Us',style: TextStyle(fontSize: 15.0),), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
            }
            ),
            ListTile(
              leading: Icon(Icons.contact_phone,size: 30.0,),
              title: Text('Contact Us',style: TextStyle(fontSize: 15.0),), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
            }
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage ('custom/bg1.jpg'),
          fit: BoxFit.cover,
          ),
        ),
        // image slider
    child: ListView(
        children: <Widget>[
    imageSliderCarousel, gridview,
        ]
    )
      )
   ));

  }
}


import 'package:education_app/pdfscreen.dart';
import 'package:education_app/readtopic.dart';
import 'package:education_app/universaldata.dart';
import 'package:education_app/viewmorebutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Node.dart';
import 'dart:convert';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: CompDashboard(),
));

class CompDashboard extends StatefulWidget {
  @override
  _CompDashboardState createState() => _CompDashboardState();
}

var titlelist=[
  "General Studies"
];

var desclist=[
  "As we are aware that General Knowledge (GK) "

];
 var imglist=[
   "custom/unnamed (1).jpg"
 ];

class _CompDashboardState extends State<CompDashboard>
{

  List<Node> _nodes=List<Node>();
  Future <List<Node>> getdata() async {
    var req = await http.get('http://ankushapp.iotans.in/api/get_compeation_courses');
    // var nodes = {new Node("neeraj", "ok"),new Node("Radhe", "ok")};
   // print(universaldata.sname);
    List<Node> nodes=List<Node>();
    // if (req.statusCode == 200) {
    var nodesJson = json.decode(req.body);
    for (var nodeJson in nodesJson) {

      String CourseName = nodeJson["CourseName"].toString();
      String duration = nodeJson["duration"].toString();
      String coverphoto_path = nodeJson["coverphoto_path"].toString();
      String charges = nodeJson["charges"].toString();
      String Course_Description_Text = nodeJson["Course_Description_Text"]
          .toString();
      String Course_Description_Pdf_path = nodeJson["Course_Description_Pdf_path"]
          .toString();
      String Course_Description_Video = nodeJson["Course_Description_Video"]
          .toString();

      nodes.add(new Node(
          CourseName ,
          duration,
          coverphoto_path,
          charges,
          Course_Description_Text,
          Course_Description_Pdf_path,
          Course_Description_Video));
    }
    // }
    return nodes;
  }
  @override
  Widget build(BuildContext context)
  {
    getdata().then((value) {
      setState(()
      {
        _nodes.addAll(value);
      });
    });
    double width = MediaQuery.of(context).size.width *0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text('CHOOSE COURSE'),
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
    child:ListView.builder(
        itemCount: _nodes.length,
            itemBuilder: (context, index)
            {
    return GestureDetector(
    onTap: () {},
    child: Card(
    elevation: 3.0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0.0),
    side: BorderSide(width: 2, color: Colors.black26)
    ),
    child: Row(
    children: <Widget>[
       Expanded(
    child: Padding(
          padding: const EdgeInsets.all(15.0),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(imglist[0],   fit:BoxFit.fill,width: 322,height: 200, ),
            Divider(
                color: Colors.black12,thickness: 1.0,
            ),

          Text(
            _nodes[index].CourseName,
          style: TextStyle(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.bold
          ),
          ),
          Text('Price = '+ _nodes[index].charges+'/-', style: TextStyle(
          fontSize: 16.0,
          color: Colors.redAccent,
          fontWeight: FontWeight.bold
          ),
          ),
    Container(
    width: width,
    child: Text(
      _nodes[index].Course_Description_Text,
    style: TextStyle(
    fontSize: 15.0,
    color: Colors.grey,
    fontWeight: FontWeight.bold
    ),
    ),
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
                    MaterialPageRoute(builder: (context) => pdfscreen()));
              },

              child: Text('View More', style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),)
          ),
          Padding(padding: EdgeInsets.only(right: 10.0)),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0)
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyApp()));},
              child: Text('Video', style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),)
          ),
          Padding(padding: EdgeInsets.only(right: 10.0)),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0)
              ),
              onPressed: ()
              {
                 var url = 'http://ankushapp.iotans.in/payment/index?studentname='+universaldata.sname+"-"+universaldata.sid+'&mobileno='+universaldata.mobile+'&coursename='+_nodes[index].CourseName+'&amount='+_nodes[index].charges+'&pwds=na';
                universaldata.payurl=url;
                 print(url);
                 Navigator.push(context, MaterialPageRoute(builder: (context) => viewmorepdf()));
                 },
              child: Text('Buy Now', style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),)),
        ],),
          ])),)
    ]),
    ),);},),
      ));






          }


  }


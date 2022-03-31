import 'dart:convert';
import 'package:education_app/mpbuynow.dart';
import 'package:education_app/pdfscreen.dart';
import 'package:flutter/material.dart';
import 'package:education_app/universaldata.dart';
import 'package:http/http.dart' as http;
import 'Nodempsubject.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: mpsubject(),
));

class mpsubject extends StatefulWidget
{
  @override
  _mpsubjectState createState() => _mpsubjectState();
}

int rindex;
class _mpsubjectState extends State<mpsubject> {
  List<Nodempsubject> _nodes=List<Nodempsubject>();
  Future <List<Nodempsubject>> getdata() async {
    var req = await http.get('http://ankushapp.iotans.in/api/get_subject_by_class/?boardname=MP&classname='+  universaldata.SelectedClassname);
    // var nodes = {new Node("neeraj", "ok"),new Node("Radhe", "ok")};
    // print(universaldata.sname);
    List<Nodempsubject> nodes=List<Nodempsubject>();
    // if (req.statusCode == 200) {
    var nodesJson = json.decode(req.body);
    rindex=0;
    for (var nodeJson in nodesJson) {
      rindex++;
      String BoardName = nodeJson["BoardName"].toString();
      String classname = nodeJson["classname"].toString();
      String SubjectName = nodeJson["SubjectName"].toString();
      String Subjectid=nodeJson["id"].toString();
      String Description = nodeJson["Description"].toString();
      String Duration = nodeJson["Duration"]
          .toString();
      String Fees = nodeJson["Fees"]
          .toString();
      String Pdflink = nodeJson["Pdflink"]
          .toString();
      String Videolink = nodeJson["Videolink"]
          .toString();

      nodes.add(new Nodempsubject(Subjectid,
          BoardName,
          classname,
          SubjectName,
          Description,
          Duration,
          Fees,
          Pdflink,
          Videolink));
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
        if(!_nodes.contains(value))
          _nodes.addAll(value);
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('SELECT SUBJECT'),
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
          itemCount: rindex,
            itemBuilder: (context, index)
            {
              return Card(
                  margin: EdgeInsets.all(15.0),
                  color: Colors.brown[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10.0,left: 10.0,right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_nodes[index].sujectname,
                        style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text('Description  : '+_nodes[index].description,
                        style: TextStyle(fontSize: 14.0,),
                      ),
                      Text('Duration  : '+_nodes[index].duration,
                        style: TextStyle(fontSize: 14.0,),
                      ),
                      Text('Fee  : '+_nodes[index].fees,
                        style: TextStyle(fontSize: 14.0,),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
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
                                universaldata.topic_name=_nodes[index].sujectname;
                                universaldata.topic_pdf_path=_nodes[index].pdflink;
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => pdfscreen()));
                              },
                              child: Text('View More', style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),)
                          ),
                          Padding(padding: EdgeInsets.only(right: 20)),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0)
                              ),
                              onPressed: () {
                                universaldata.subjectname=_nodes[index].sujectname;
                                universaldata.subjectid=_nodes[index].Subjectid;
                                universaldata.amount=_nodes[index].fees;
                                universaldata.boardname="MP";

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => buynow()));
                              },
                              child: Text('Buy Now', style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),)
                          ),
                        ],

                      ),
                    ],
                  ),


                ) );




            },)
    ));





  }
}

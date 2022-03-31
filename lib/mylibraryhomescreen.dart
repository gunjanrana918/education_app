import 'package:education_app/compet_topic_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Nodelib.dart';
import 'dart:convert';
import 'package:education_app/universaldata.dart';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: mylibrary(),
));

class mylibrary extends StatefulWidget {
  @override
  _mylibraryState createState() => _mylibraryState();
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
var rindex=0;
List<Nodelib> _nodes=List<Nodelib>();

class _mylibraryState extends State<mylibrary> {

  Future <List<Nodelib>> getdata() async {
    print('http://ankushapp.iotans.in/api/get_purchased_item/?studentid='+universaldata.sid.replaceAll(" ", "").replaceAll(":", ""));
    var req = await http.get('http://ankushapp.iotans.in/api/get_purchased_item/?studentid='+universaldata.sid.replaceAll(" ", "").replaceAll(":", ""));
    // var nodes = {new Node("neeraj", "ok"),new Node("Radhe", "ok")};
    // print(universaldata.sname);

    List<Nodelib> nodes=List<Nodelib>();
    // if (req.statusCode == 200) {
    var nodesJson = json.decode(req.body);
    rindex=0;
    for (var nodeJson in nodesJson) {
      rindex++;
     // print(nodesJson);
      print(universaldata.sid);
      String CourseId = nodeJson["id"].toString();
      String CourseName = nodeJson["CourseName"].toString();
      String coverphoto_path = nodeJson["coverphoto_path"].toString();
      String Course_Description_Text = nodeJson["Course_Description_Text"]
          .toString();
      String date_ = nodeJson["date_"]
          .toString();
      nodes.add(new Nodelib(
          CourseId,
          CourseName ,
          coverphoto_path,
          Course_Description_Text,
          date_
          ));
    }
    print(_nodes.length);
    print(rindex);

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
    double width = MediaQuery.of(context).size.width *0.6;
    return Scaffold(
        appBar: AppBar(
          title: Text('MY STUDY MATERIAL'),
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
            itemCount: rindex,
            itemBuilder: (context, index)
            {
              return GestureDetector(
                onTap: () {

                },
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
                                    Text('Course Id :' + _nodes[index].CourseID,
                                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                    ),
                                    Text('Course Title :' + _nodes[index].CourseName,
                                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                    ),
                                    Text('Description :' +_nodes[index].Course_Description_Text,
                                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                    ),
                                    Text('Buy On : '+_nodes[index].BuyOnDate_,
                                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                      color: Colors.black12,thickness: 1.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10.0)
                                            ),
                                            onPressed: () {
                                              universaldata.selectedmycouseid= _nodes[index].CourseID;
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => competitiontopic()));
                                            },

                                            child: Text('Explore Now', style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),)
                                        ),
                                        Padding(padding: EdgeInsets.only(right: 10.0)),



                                      ],
                                    ),


                                  ])
                          ),
                        )


                      ]),
                ),
              );
            },
          ),
        ));






  }
}

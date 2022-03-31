import 'package:education_app/classbuylibrary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Node_board.dart';
import 'Nodelib.dart';
import 'dart:convert';
import 'package:education_app/universaldata.dart';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: boardlibrary(),
));
class boardlibrary extends StatefulWidget {
  @override
  _boardlibraryState createState() => _boardlibraryState();
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
List<Nodeboard> _nodes=List<Nodeboard>();

class _boardlibraryState extends State<boardlibrary> {
  Future <List<Nodeboard>> getdata() async {
    print('http://ankushapp.iotans.in/api/get_purchased_item/?studentid='+universaldata.sid.replaceAll(" ", "").replaceAll(":", ""));
    var req = await http.get('http://ankushapp.iotans.in/api/get_purchased_board_item_subject/?boardname='+universaldata.boardname.replaceAll(" ", "").replaceAll(":", "")+"&studentid="+universaldata.sid.replaceAll(" ", "").replaceAll(":", ""));

    List<Nodeboard> nodes=List<Nodeboard>();
    // if (req.statusCode == 200) {
    var nodesJson = json.decode(req.body);
    rindex=0;
    for (var nodeJson in nodesJson) {
      rindex++;

      String SubjectID = nodeJson["id"].toString();
      String BoardName = nodeJson["BoardName"].toString();
      String classname = nodeJson["classname"].toString();
      String SubjectName = nodeJson["SubjectName"].toString();
      String Description= nodeJson["Description"].toString();
      String date_ = nodeJson["date_"].toString();
      nodes.add(new Nodeboard(SubjectID,
          BoardName,
          classname ,
          SubjectName,
          Description,
          date_
      ));
    }
    print(_nodes.length);
    print(rindex);

    // }
    return nodes;
  }
  @override
  Widget build(BuildContext context) {
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

                                  Text('Subject Name:' + _nodes[index].SubjectName,
                                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                  ),
                                  Text('Board Name Title :' + _nodes[index].BoardName,
                                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                  ),
                                  Text('ClassName :' +_nodes[index].classname,
                                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                  ),
                                  Text('Description : '+_nodes[index].Description,
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
                                            universaldata.subjectid= _nodes[index].SubjectID;
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => classbuylibrary()));
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
      ),
    );
  }
}

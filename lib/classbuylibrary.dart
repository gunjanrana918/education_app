import 'package:education_app/pdfscreen.dart';
import 'package:education_app/readtopic.dart';
import 'package:flutter/material.dart';
import 'package:education_app/universaldata.dart';
import 'package:http/http.dart' as http;
import 'Nodeclassbuy.dart';
import 'Nodetopic.dart';
import 'dart:convert';

import 'compet_topic_list.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: classbuylibrary(),
));

class classbuylibrary extends StatefulWidget {
  @override
  _classbuylibraryState createState() => _classbuylibraryState();
}
var rindex=0;
List<Nodeclass> _nodes=List<Nodeclass>();
class _classbuylibraryState extends State<classbuylibrary> {
  Future <List<Nodeclass>> getdata() async {
    print('http://ankushapp.iotans.in/api/get_purchased_item/?studentid='+universaldata.sid.replaceAll(" ", "").replaceAll(":", ""));
    var req = await http.get('http://ankushapp.iotans.in/api/get_topics_by_subjectid/?subjectid='+universaldata.subjectid.replaceAll(" ", "").replaceAll(":", ""));
    // var nodes = {new Node("neeraj", "ok"),new Node("Radhe", "ok")};
    // print(universaldata.sname);

    List<Nodeclass> nodes=List<Nodeclass>();
    // if (req.statusCode == 200) {
    var nodesJson = json.decode(req.body);
    rindex=0;
    for (var nodeJson in nodesJson) {
      rindex++;
      String topicname = nodeJson["TopicName"].toString();
      String shortdescription = nodeJson["Description"].toString();
      String topicduration = nodeJson["Duration"].toString();
      String PDF_attechment_path = nodeJson["PdfAttachmentpath"].toString();
      String Video_attechment_path = nodeJson["VideoAttechment"].toString();
      nodes.add(new Nodeclass(
        topicname,
          shortdescription ,
          topicduration,
          PDF_attechment_path,
          Video_attechment_path,
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
    double width = MediaQuery.of(context).size.width *0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text('TOPIC LIST'),
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
                                  Text(
                                    _nodes[index].topicname,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black12,thickness: 1.0,
                                  ),
                                  Text('Duration : '+ _nodes[index].topicduration, style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Container(
                                    width: width,
                                    child: Text(
                                      _nodes[index].shortdescription,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,

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
                                            universaldata.whichscreen="pdf";
                                            universaldata.topic_name=_nodes[index].topicname;
                                            universaldata.topic_pdf_path=_nodes[index].PDF_attechment_path;

                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => pdfscreen()));
                                          },

                                          child: Text('PDF', style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),)
                                      ),
                                      Padding(padding: EdgeInsets.only(right: 10.0)),
                                      RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  10.0)
                                          ),
                                          onPressed: () {
                                            universaldata.whichscreen="video";
                                            universaldata.videtitle=_nodes[index].topicname;
                                            universaldata.topic_video_path=_nodes[index].Video_attechment_path;

                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => MyApp()));
                                          },

                                          child: Text('Video', style: TextStyle(
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



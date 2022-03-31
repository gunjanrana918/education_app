
import 'package:education_app/homescreen.dart';
import 'package:education_app/universaldata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/binding.dart';
import 'package:flutter/material.dart';
import 'package:education_app/signup_screen.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.deepOrange,
    ),
    home:LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final mobilecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 230,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('custom/unnamed.jpg'),fit: BoxFit.fill
              )),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),Text('Login',
          style: TextStyle(
            fontSize: 25.0,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.phone_android), onPressed: (){}),
              Expanded(child:
              Container(
                margin: EdgeInsets.only(left: 4,right: 20.0),
               child: TextFormField(
                 controller: mobilecontroller,
                 decoration: InputDecoration(
                   hintText: 'Mobile'
                 ),
               ),
              ))
            ],),
        Padding(
          padding: EdgeInsets.all(15.0),
        ),
        Row(
            children: <Widget>[
        IconButton(icon: Icon(Icons.lock), onPressed: (){}),
    Expanded(child:
    Container(
    margin: EdgeInsets.only(left: 4,right: 20.0),
    child: TextFormField(
      controller: passwordcontroller,
      decoration: InputDecoration(
    hintText: 'Password',
    ),
      obscureText: true,
    ),
        )),]
        ),
          SizedBox(
            height: 5.0,
          ),
          Padding(padding:
          const EdgeInsets.all(20),
          child: RaisedButton(
            color: Colors.brown[300],
              child: Text('Login',style: TextStyle(fontSize: 20.0,color:Colors.white,fontWeight: FontWeight.bold),),
              onPressed: (){
                Future<void> getdata() async{
                  print('http://ankushapp.iotans.in/api/checkuser?mobileno='+mobilecontroller.text+'&password='+passwordcontroller.text+'');
                  var req = await http.get('http://ankushapp.iotans.in/api/checkuser?mobileno='+mobilecontroller.text.replaceAll(" ", "")+'&password='+passwordcontroller.text.replaceAll(" ", "")+'');
                  if(req.body.contains("true"))
                  {
                    var logindata = req.body.split(",");
                    var sid = logindata[1].replaceAll("id", "").replaceAll("\"", "");
                    var sname = logindata[2].replaceAll("studentname", "").replaceAll("\"", "");
                    var mobile = logindata[3].replaceAll("mobile", "").replaceAll("\"", "");
                    var email = logindata[4].replaceAll("email", "").replaceAll("\"", "");
                    universaldata.sid=sid;
                    universaldata.sname=sname;
                    universaldata.email=email;
                    universaldata.mobile=mobile;
                    Navigator.of(context).pop(true);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                  }
                  else
                  {
                    Widget gotIt = FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.black,
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop('alert');
                      },
                    );
                    AlertDialog alert = AlertDialog(
                      title: Text("Registration Error"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      backgroundColor: Colors.brown[300],
                      content: Text("Try Again!"),
                      actions: [
                        gotIt,
                      ],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },);}}
                      getdata();
            }),
          ),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));},
                  child: RichText(text:
                        TextSpan(
                            text: 'Signup',style: TextStyle(color:Colors.lightBlueAccent,fontSize: 25.0,decoration: TextDecoration.underline
                        )
                        ))
              )]
              ),
        ],
      ),
    );



  }
}

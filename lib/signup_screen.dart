import 'package:education_app/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(SignUpForm());


class SignUpForm extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SignUp(),);
  }
}

class SignUp extends StatefulWidget{
  SignUpState createState()=>SignUpState();
}

class SignUpState extends State{
  bool checkBoxvalue= false;

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();

  Widget build(BuildContext context){


    final name = TextField(
      obscureText: false,
      cursorColor: Colors.red,
      controller: namecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );

    final emailField = TextField(
      controller: emailcontroller,
      cursorColor: Colors.red,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );


    final mobile = TextField(
      controller: mobilecontroller,
      cursorColor: Colors.red,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );


    final passwordField = TextField(
      obscureText: true,
      controller: passcontroller,
      cursorColor: Colors.red,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),

    );
    
    final loginButon = Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.brown[300],
      child: MaterialButton(
        onPressed: () {
          User user=User();
          user.name=namecontroller.text;
          user.email=emailcontroller.text;
          user.mobile=mobilecontroller.text;
          user.pass=passcontroller.text;

          showAlertDialog(context,user);

          },

        child: Text("Submit",textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,fontSize: 20.0),),

      ),
    );

    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
        Container(
          height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('custom/ddd.png'),fit: BoxFit.fill
            )),
      ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Text('Signup User',
            style: TextStyle(
                fontSize: 25.0,fontWeight: FontWeight.bold
            ),textAlign: TextAlign.center,),
          Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(height: 3.0,),
          name,
          Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(height: 5.0),
          Padding(padding: EdgeInsets.only(top: 15)),
          emailField,
          SizedBox(height:5.0),
          Padding(padding: EdgeInsets.only(top: 15)),
          mobile,
          SizedBox(height: 5.0),
          Padding(padding: EdgeInsets.only(top: 15)),
          passwordField,
          SizedBox(height: 5.0,),

          loginButon,
          SizedBox(height: 5.0,),

          Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(text:
              TextSpan(
                        text: 'Signin',style: TextStyle(color:Colors.lightBlueAccent,fontSize: 30.0,decoration: TextDecoration.underline)
                    )
              ) ]
              )]
      )
    );


  }
}
//Alert Dialog
showAlertDialog(BuildContext context,User user){

  Future<void> getdata() async{
    var req = await http.get('http://ankushapp.iotans.in/api/savestudent?id=22&studentname='+user.name+'&Mobile='+user.mobile+'&email='+user.email+'&state=na&city=na&address=na&password='+user.pass+'');
   if(req.body.contains("true"))
     {
       Widget gotIt = FlatButton(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10.0),
         ),
         color: Colors.black,
         child: Text("Ok"),
         onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
         //  Navigator.of(context, rootNavigator: true).pop('alert');
         },
       );
       AlertDialog alert = AlertDialog(
         title: Text("Success"),
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15.0)
         ),
         backgroundColor: Colors.brown[100],
         content: Text("Registered Successfully Done! Press ok to continue login"),
         actions: [
           gotIt,
         ],
       );


       showDialog(
         context: context,
         builder: (BuildContext context) {
           return alert;
         },
       );
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
         },
       );
     }
  }

  getdata();



}
//model class
class User{
  String name;
  String email;
  String mobile;
  String pass;
}



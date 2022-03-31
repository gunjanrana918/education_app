import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:education_app/login_screen.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Image Gallary',
  home: Sliders(),
));
class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  @override
  Widget build(BuildContext context) {
    Widget imageSliderCarousel=Container(
      height: 500,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('custom/aa.png'),
          AssetImage('custom/bbb.jpg'),
          AssetImage('custom/cc.jpg'),
        ],
        autoplay: true,
        showIndicator: false,
      ),
    );
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage ('custom/bg1.jpg'),
                  fit: BoxFit.fill
              ),
            ),
          child: ListView(
            children: <Widget>[
              imageSliderCarousel,
              Padding(padding: EdgeInsets.only(top: 40)),
              RaisedButton(
                child: Text('Get Started', style: TextStyle(fontSize: 30.0),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(5),
                autofocus: true,
                color: Colors.brown[300],
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              )
            ],
          ),

        )


    );


  }
}

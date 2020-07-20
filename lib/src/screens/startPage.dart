import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  void initState() {    
    super.initState();
    Timer(Duration(seconds: 4), ()=> Navigator.pushReplacementNamed(context, '/comida'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: ZoomIn(
        child: ZoomIn( 
          from: 20,        
          duration: Duration(seconds: 2),
          child: Center(
            child: Container(
            width: 10,
            child: Image(image: AssetImage('assets/images/logoInicio1.png')),                          
            ),
          )                        
        ),      
      )
    );
  }
}
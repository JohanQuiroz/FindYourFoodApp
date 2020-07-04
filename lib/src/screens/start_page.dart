import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: ZoomIn(
        child: ZoomIn( 
          from: 20,        
          duration: Duration(seconds: 2), 
          child: Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, '/home');
              },              
              child: Container(
                width: 10,
                child: Image(image: AssetImage('assets/images/logoInicio1.png')),
              )                
            )               
          ),
        ),      
      )
    );
  }
}
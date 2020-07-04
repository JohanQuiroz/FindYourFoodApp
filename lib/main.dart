import 'package:flutter/material.dart';
import 'package:fyf/src/screens/home_page.dart';
import 'package:fyf/src/screens/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/' : ( BuildContext context ) => StartPage(),
        '/home' : ( BuildContext context ) => HomePage(),
      },     
    );
  }
}

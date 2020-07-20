import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fyf/src/screens/comidaPage.dart';
import 'package:fyf/src/screens/startPage.dart';

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
        '/comida' : ( BuildContext context ) => ComidaPage(),        
      },           
    );
  }
}

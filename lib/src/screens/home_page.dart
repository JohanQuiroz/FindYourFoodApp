import 'package:flutter/material.dart';
import 'package:fyf/src/providers/recetas_provider.dart';
import 'package:fyf/src/screens/comida_page.dart';
import 'package:fyf/src/screens/recetas_pages.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  
  final tabs = [
    Container(
      child: ComidaPage(),
    ),
    Container(
      child: RecetasPage()
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: tabs[_currentIndex],
       bottomNavigationBar: _bottomMenu(),
    );
  }

  
  Widget _bottomMenu (){

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      iconSize: 30,
      selectedFontSize: 20.0,
      unselectedFontSize: 15.0,
      items: [
        BottomNavigationBarItem(
          title: Text('Food',),
          icon: Icon(Icons.fastfood),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          title: Text('Recipes'),
          icon: Icon(Icons.library_books),
          backgroundColor: Colors.green,
        ),
      ], 
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

}



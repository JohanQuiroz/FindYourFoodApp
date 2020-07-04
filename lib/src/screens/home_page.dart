import 'package:flutter/material.dart';
import 'package:fyf/src/providers/recetas_provider.dart';
import 'package:fyf/src/screens/comida_page.dart';
import 'package:fyf/src/screens/recetas_pages.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {

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
      child: RecetasPage(),
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
      unselectedLabelStyle: TextStyle(
        color: Colors.grey
      ),      
      items: [
        BottomNavigationBarItem(
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: <Color>[
                  Colors.green,
                  Colors.blue
                ],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: Icon(Icons.fastfood),
          ),
          icon: Icon(Icons.fastfood, color: Colors.grey),
          title: Text('')            
          
        ),
        BottomNavigationBarItem(
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: <Color>[
                  Colors.green,
                  Colors.blue
                ],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: Icon(Icons.library_books),
          ),
          icon: Icon(Icons.library_books, color: Colors.grey),
          title: Text(' ')                
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



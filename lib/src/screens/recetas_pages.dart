import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class RecetasPage extends StatelessWidget {
  const RecetasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: FadeInRight(child: Text('RECETAS')),    
         centerTitle: true,  
         flexibleSpace: Container(
           decoration: BoxDecoration(
             gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.green
              ]
            )
           ),
         ),
       ),
      body: FadeInUp(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: <Widget>[
            Text('Ceviche'),
            Text('Pollito a la brasa'),
            Text('Tallarines rojos'),
            Text('Papa a la huancaina'),
            Text('Tacu tacu'),
            Text('Lomo saltado'),
            Text('Arroz con huevito'),
            Text('Asado'),
            Text('Cabrito'),
          ],
        ),
      ),
    );
  }
}
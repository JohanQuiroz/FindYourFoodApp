import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fyf/src/providers/recetas_provider.dart';

class RecetasPage extends StatelessWidget {
  
  //String busqueda;
  //RecetasPage({@required this.busqueda});

  final recetasProvider = new RecetasProvider(); 



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
        child: ListView.builder(
          padding: EdgeInsets.all(30),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return Container();
          },
        ),
      ),
    );
  }


}
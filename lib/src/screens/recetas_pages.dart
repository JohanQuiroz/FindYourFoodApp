import 'package:flutter/material.dart';

class RecetasPage extends StatelessWidget {
  const RecetasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView(
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
    );
  }
}
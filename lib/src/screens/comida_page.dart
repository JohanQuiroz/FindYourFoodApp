
import 'package:flutter/material.dart';

class ComidaPage extends StatefulWidget {
  ComidaPage({Key key}) : super(key: key);

  @override
  _ComidaPageState createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Comida'),
       ),
       body: Container(
         padding: EdgeInsets.symmetric(horizontal: 20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             _imagenCapturada(),
             _descripcion(),
           ],
         ),
       ),
    );
  }

  Widget _imagenCapturada() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image(
        image: AssetImage('assets/images/noImage.jpg'),

      ),
    );
  }

  Widget _descripcion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Description',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'informacion del platillo',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }


}
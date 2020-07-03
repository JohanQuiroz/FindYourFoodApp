
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


class ComidaPage extends StatefulWidget {
  ComidaPage({Key key}) : super(key: key);

  @override
  _ComidaPageState createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  
  File _imagen;
  String _resultado;
  String _ruta;
  //bool _modeloCargado = false;

/*
  @override
  void initState() {    
    super.initState();
    _cargarModelo();
  }

  @override
  void dispose(){
    Tflite.close();
    super.dispose();
  }

  
  _cargarModelo() async{
    await Tflite.loadModel(
      model: 'assets/model/model_unquant.tflite',
      labels: 'assets/model/labels.txt',      
    );
  }
  */

  Future obtenerImagen(String opcion) async{
    var imagen;
    (opcion == 'Galeria') ? imagen = await ImagePicker.pickImage(source: ImageSource.gallery) 
                          : imagen = await ImagePicker.pickImage(source: ImageSource.camera);
    
    setState(() {
      _imagen = imagen;
      _ruta = imagen.path;
    });

  }

  Future clasificarImagen() async {
    await Tflite.loadModel(
      model: 'assets/model/model_unquant.tflite',
      labels: 'assets/model/labels.txt',      
    );
    var salida = await Tflite.runModelOnImage(path: _ruta);

    setState(() {
      _resultado = salida.toString();     
    });
  }

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
             _imagen == null
              ? Text('No image selected.')
              : Image.file(_imagen, width: 300, height: 200, fit: BoxFit.cover),
             Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: RaisedButton(
                onPressed: () => obtenerImagen('Camara'),
                child: Text('Abrir Cámara'),
                textColor: Colors.white,
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: RaisedButton(
                  onPressed: () => obtenerImagen('Galeria'),
                  child: Text('Abrir Galeria'),
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: RaisedButton(
                  onPressed: () => clasificarImagen(),
                  child: Text('Clasificar'),
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                )),
              _resultado == null
                ? Text('Resulta')
                : Text(_resultado)
           ],
         ),
       ),
    );
  }
  /*

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
          'Descripcion',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'informacion del platillo',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }*/
}
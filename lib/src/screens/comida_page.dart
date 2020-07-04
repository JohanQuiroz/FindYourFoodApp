
import 'dart:io';
import 'dart:ui';

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
              ? Image.asset('assets/images/noImage.jpg')
              : Image.file(_imagen, fit: BoxFit.cover),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: RaisedButton(
                    onPressed: () => obtenerImagen('Camara'),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Camera'),
                        Icon(Icons.camera_alt)
                      ],
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: RaisedButton(
                    onPressed: () => obtenerImagen('Galeria'),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Gallery'),
                        Icon(Icons.photo_library)
                      ],
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: RaisedButton(
                    onPressed: () => clasificarImagen(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Search'),
                        Icon(Icons.search)
                      ],
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )
                ),
               ],
             ),
            SizedBox(height: 15,),
            _resultado == null
              ? Text('Food description', style: TextStyle(fontSize: 20),)
              : Text(_resultado)
           ],
         ),
       ),
    );
  }







}
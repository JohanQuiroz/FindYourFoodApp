
import 'dart:io';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyf/src/blocs/recetaBloc/bloc.dart';
import 'package:fyf/src/providers/recetasProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../providers/recetasProvider.dart';
import 'recetaPage.dart';


class ComidaPage extends StatefulWidget {

  @override
  _ComidaPageState createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  Shader linearGradient = LinearGradient(
    colors: [
      Colors.blue,
      Colors.green
    ]          
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    
  File _imagen;
  String _resultado;
  String _ruta;    
  bool buscar = false;
  
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
      _resultado = salida[0]['label'].toString().substring(2); 
      buscar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: FadeInLeft(child: Text('FIND YOUR FOOD')),    
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
      body: ListView(
        children: <Widget>[           
          Container(             
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child :
            _imagen == null
              ? Image.asset('assets/images/noImage.jpg')
              : Image.file(_imagen, fit: BoxFit.cover),
          ),
          Row(               
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[                
              FadeInLeft(
                child: Container(                                               
                  child: RaisedButton(                                       
                    onPressed: () => obtenerImagen('Camara'),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ 
                        Icon(Icons.camera_alt)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    textColor: Colors.white,
                    color: Colors.green[300],
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )
                ),
              ),
              FadeInUp(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: RaisedButton(
                    onPressed: () => obtenerImagen('Galeria'),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[                        
                        Icon(Icons.photo_library)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    textColor: Colors.white,
                    color: Colors.green[300],
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )
                ),
              ),
              FadeInRight(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: RaisedButton(
                    onPressed: () => clasificarImagen(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[                        
                        Icon(Icons.search)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    textColor: Colors.white,
                    color: Colors.green[300],
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )
                ),
              ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              child: _resultado == null
                ? Text("")
                : Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 35,     
                    foreground: Paint()..shader = linearGradient,
                  ),     
                )
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'SIMILAR RECIPES',
                style:  TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0
                ),
              ),
            ),
            SizedBox(height: 20,),
            if(_resultado != null && buscar) 
              _mostrarRecetas(_resultado)

            
         ],
       )
    );
  }

  Widget _mostrarRecetas (comida){
    buscar = false;
    return BlocProvider(
      create : (context) => RecetaBloc(recetaProvider: RecetasProvider()),
      child: RecetaPage(comida : comida),
    );
  }
       
       /*
       Container(
         padding: EdgeInsets.symmetric(horizontal: 20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             SizedBox(height: 15,),
             _imagen == null
              ? Image.asset('assets/images/noImage.jpg')
              : Image.file(_imagen, fit: BoxFit.cover),
             SizedBox(height: 15,),
             Row(               
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[                
                FadeInLeft(
                  child: Container(                                               
                    child: RaisedButton(                                       
                      onPressed: () => obtenerImagen('Camara'),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[ 
                          Icon(Icons.camera_alt)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      textColor: Colors.white,
                      color: Colors.green[300],
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                    )
                  ),
                ),
                FadeInUp(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: RaisedButton(
                      onPressed: () => obtenerImagen('Galeria'),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[                        
                          Icon(Icons.photo_library)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      textColor: Colors.white,
                      color: Colors.green[300],
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                    )
                  ),
                ),
                FadeInRight(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: RaisedButton(
                      onPressed: () => clasificarImagen(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[                        
                          Icon(Icons.search)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      textColor: Colors.white,
                      color: Colors.green[300],
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                    )
                  ),
                ),
               ],
             ),
            SizedBox(height: 15,),
            Container(
              child: _resultado == null
                ? Text("")
                : Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 35,     
                    foreground: Paint()..shader = linearGradient,
                  ),     
                )
            ),
            SizedBox(height: 15,),
            Text("Description", 
              style: TextStyle(
                fontSize: 25,       
                color: Colors.black54,
              ),  
            ),
            /*
            BlocProvider(
            create : (context) => RecetaBloc(recetaProvider: RecetasProvider()),
            child: RecetaPage(),
          ),*/

*/                                                  


  String getResult(){
    return _resultado;
  }




}
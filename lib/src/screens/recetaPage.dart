import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyf/src/blocs/recetaBloc/bloc.dart';
import 'package:fyf/src/models/recetaModel.dart';
import 'package:fyf/src/screens/recetaDetalle.dart';

import '../models/recetaResponse.dart';

class RecetaPage extends StatefulWidget {
  String comida;
  RecetaPage({@required this.comida});
  @override
  _RecetaPageState createState() => _RecetaPageState();
}
class _RecetaPageState extends State<RecetaPage> {

  RecetaBloc recetaBloc;
  RecetaResponse recetaResponse;

  @override
  void initState() {    
    super.initState();
    recetaBloc = BlocProvider.of<RecetaBloc>(context);
    recetaBloc.add(FetchRecetaEvent(comida : widget.comida));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecetaBloc, RecetaState>(
      listener: (context, state) {                                                           
        if(state is RecetaErrorState){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(_renderError(state.message));                
        }            
      },  
      child: BlocBuilder<RecetaBloc, RecetaState>(            
        builder: (context, state){
          if(state is RecetaInitialState)
            return _renderLoading();
          else if(state is RecetaLoadingState)
            return _renderLoading();     
          else if (state is RecetaLoadedState)
            return _renderRecetas(state.recetas, context);
          else 
            return Container(width: 0.0, height: 0.0);                 
                    
        },
      ),
    );
  }


  Widget _renderItems(List<Hit> results){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: results.length,
      itemBuilder: (context, index){
        return Row(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 278.0,
                minWidth: MediaQuery.of(context).size.width * 0.40,
                maxHeight: 278.0,
                maxWidth: MediaQuery.of(context).size.width * 0.40,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>  RecetaDetalle(receta: results[index].receta),                    
                 ));                  
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(results[index].receta.image),
                    ),
                    SizedBox(height: 10,),
                    Text(results[index].receta.label),     
                    Divider(color: Colors.amber,),               
                    RichText(
                      text: TextSpan(
                        text: results[index].receta.ingredientLines.length.toString(),
                        style: TextStyle(
                          color: Colors.green
                        ),
                        children: [
                          TextSpan(
                            text: ' INGREDIENTS',
                            style: TextStyle(
                              color: Colors.blueGrey
                            ),
                          )
                        ]
                      ),                      
                    ),                                     
                  ],  
                ),
              ),                            
            ),
            SizedBox(width: 20,),
          ],
            
        );
      }      
    );
  }

 

  Widget _renderLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _renderError(String m){
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(m),
          Icon(Icons.error)
        ],
      ),
      backgroundColor: Colors.red,      
    );
  }

  Widget _renderRecetas(RecetaResponse response, BuildContext context){
    print(response.hits[0].receta.label);
    return Container(   
      padding: EdgeInsets.only(left: 15),   
      width: MediaQuery.of(context).size.width -20,
      height: 278,      
      child: _renderItems(response.hits),
    );
  }
}
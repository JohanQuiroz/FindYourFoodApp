import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyf/src/blocs/recetaBloc/bloc.dart';
import '../../models/recetaResponse.dart';
import '../../providers/recetasProvider.dart';



class RecetaBloc extends Bloc<RecetaEvent, RecetaState>
{

  RecetasProvider recetaProvider;

  RecetaBloc({@required this.recetaProvider}) : super(null);

  @override  
  RecetaState get initialState => RecetaInitialState();

  @override
  Stream<RecetaState> mapEventToState(RecetaEvent event) async*{    

    if(event is FetchRecetaEvent){
      yield RecetaLoadingState();
      try{
        RecetaResponse recetas =  await recetaProvider.getRecetas(event.comida);
        yield RecetaLoadedState(recetas: recetas);
      }
      catch(e){
        yield RecetaErrorState(message: e.toString());
      }            
    }    

  }

}
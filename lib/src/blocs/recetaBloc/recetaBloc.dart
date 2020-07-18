import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyf/src/blocs/recetaBloc/bloc.dart';
import '../../models/receta_response.dart';
import '../../providers/recetas_provider.dart';



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
        RecetaResponse recetas =  await recetaProvider.getRecetas('chicken');
        yield RecetaLoadedState(recetas: recetas);
      }
      catch(e){
        yield RecetaErrorState(message: e.toString());
      }            
    }    

  }

}
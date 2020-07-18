import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/receta_response.dart';

abstract class RecetaState extends Equatable{

}


class RecetaInitialState extends RecetaState{
  @override  
  List<Object> get props => [];

}

class RecetaLoadingState extends RecetaState{
  @override  
  List<Object> get props => [];
}

class RecetaLoadedState extends RecetaState{

  RecetaResponse recetas;

  RecetaLoadedState({@required this.recetas});

  @override  
  List<Object> get props => [];
}

class RecetaErrorState extends RecetaState{

  String message;
  
  RecetaErrorState({@required this.message});

  @override  
  List<Object> get props => [];
}
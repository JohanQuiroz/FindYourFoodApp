import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RecetaEvent extends Equatable{
  const RecetaEvent();
}

class FetchRecetaEvent extends RecetaEvent{
  final String comida;

  const FetchRecetaEvent({@required this.comida});
  @override  
  List<Object> get props => [comida];
}

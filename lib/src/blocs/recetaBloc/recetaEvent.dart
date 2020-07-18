import 'package:equatable/equatable.dart';

abstract class RecetaEvent extends Equatable{
  const RecetaEvent();
}

class FetchRecetaEvent extends RecetaEvent{
  @override  
  List<Object> get props => null;
}

import 'dart:async';
import 'dart:convert';

import 'package:fyf/src/models/receta_model.dart';
import 'package:fyf/src/models/receta_response.dart';
import 'package:http/http.dart' as http;

import '../models/receta_response.dart';
import '../models/receta_response.dart';



class RecetasProvider {
  String _apikey    = 'b4c23c95efd18a146a11038aa285e04d';
  String _appId     = 'ad1ef42c';
  String _url       = 'api.edamam.com';

  Future<RecetaResponse> getRecetas(String comida) async {
    /*
    final url = Uri.https(_url, 'search', {
      'q'       : 'chicken',
      'app_id'  : _appId,
      'app_key' : _apikey
    });*/

    final url = "https://${_url}/search?q=chicken&app_id=${_appId}&app_key=${_apikey}";
    print (url);
    final response = await http.get(url);
    if(response.statusCode == 200){
      return RecetaResponse.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }    
  }


}





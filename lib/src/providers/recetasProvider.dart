import 'dart:async';
import 'dart:convert';
import 'package:fyf/src/models/recetaResponse.dart';
import 'package:http/http.dart' as http;

import '../models/recetaResponse.dart';



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

    final url = "https://$_url/search?q=$comida&app_id=$_appId&app_key=$_apikey";
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





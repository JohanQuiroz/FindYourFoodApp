import 'dart:async';
import 'dart:convert';

import 'package:fyf/src/models/receta_model.dart';
import 'package:http/http.dart' as http;



class RecetasProvider {

  String _apikey    = 'b4c23c95efd18a146a11038aa285e04d';
  String _appId     = 'ad1ef42c';
  String _url       = 'api.edamam.com';

  Future<List<Receta>> getRecetas(String comida) async {
    /*
    final url = Uri.https(_url, 'search', {
      'q'       : 'chicken',
      'app_id'  : _appId,
      'app_key' : _apikey
    });*/

    final url = "https://${_url}/search?q=chicken&app_id=${_appId}&app_key=${_apikey}";

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final recetas = new Recetas.fromJsonList(decodedData['hits']);
    print (recetas.items);

    return recetas.items;


  }


}







class Recetas {
  List<Receta> items = new List();

  Recetas();

  Recetas.fromJsonList (List<dynamic> jsonList) {
    if ( jsonList == null) return;

    for ( var item in jsonList ){
      final receta = new Receta.fromJsonMap(item);
      items.add( receta );
    }

  }
}


class Receta {
  String uri;
  String label;
  String image;
  String source;
  String url;
  int yieldd;
  double calories;
  double totalWeight;
  List<dynamic> ingredients;
  List<dynamic> totalNutrients;
  List<dynamic> totalDaily;
  List<dynamic> dietLabels;
  List<dynamic> healthLabels;



  Receta({
    this.uri,
    this.label,
    this.image,
    this.source,
    this.url,
    this.yieldd,
    this.calories,
    this.totalWeight,
    this.ingredients,
    this.totalNutrients,
    this.totalDaily,
    this.dietLabels,
    this.healthLabels
  });


  Receta.fromJsonMap( Map<String, dynamic> json){
    
    uri               = json['uri'];
    label             = json['label'];
    image             = json['image'];
    source            = json['source'];
    url               = json['url'];
    yieldd            = json['yield'];
    calories          = json['calories'];
    totalWeight       = json['totalWeight'];
    ingredients       = json['ingredients'];
    totalNutrients    = json['totalNutrients'];
    totalDaily        = json['totalDaily'];
    dietLabels        = json['dietLabels'];
    healthLabels      = json['healthLabels'];
  }


}





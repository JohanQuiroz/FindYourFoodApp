

class Receta {
  String uri;
  String label;
  String image;
  String source;
  String url;
  String shareAs;
  double yieldd;
  double calories;
  double totalWeight;
  double totalTime;
  bool bookmarked;
  bool bought;
  /*
  List<dynamic> totalNutrients;
  List<dynamic> totalDaily;
  List<dynamic> dietLabels;
  List<dynamic> healthLabels;
  List<dynamic> cautions;
  List<dynamic> ingredientLines;
  List<dynamic> ingredients;
  List<dynamic> digest;
*/


  Receta({
    this.uri,
    this.label,
    this.image,
    this.source,
    this.url,
    this.shareAs,
    this.yieldd,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.bookmarked,
    this.bought,/*
    this.totalNutrients,
    this.totalDaily,
    this.dietLabels,
    this.healthLabels,
    this.ingredients,
    this.cautions,
    this.ingredientLines,
    this.digest,*/
  });


  Receta.fromJsonMap( Map<String, dynamic> json){
    
    uri               = json['uri'];
    label             = json['label'];
    image             = json['image'];
    source            = json['source'];
    url               = json['url'];
    shareAs           = json['shareAs'];
    yieldd            = json['yield'];
    calories          = json['calories'];
    totalWeight       = json['totalWeight'];
    totalTime         = json['totalTime'];
    bookmarked        = json['bookmarked'];
    bought            = json['bought'];/*
    totalNutrients    = json['totalNutrients'];
    totalDaily        = json['totalDaily'];
    dietLabels        = json['dietLabels'];
    healthLabels      = json['healthLabels'];
    ingredients       = json['ingredients'];
    cautions          = json['cautions'];
    ingredientLines   = json['ingredientLines'];
    digest            = json['digest'];*/
  }


}





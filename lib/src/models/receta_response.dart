
import 'package:fyf/src/models/receta_model.dart';

class RecetaResponse {
    RecetaResponse({
        this.q,
        this.from,
        this.to,
        this.more,
        this.count,
        this.hits,
    });

    String q;
    int from;
    int to;
    bool more;
    int count;
    List<Hit> hits;

    factory RecetaResponse.fromJson(Map<String, dynamic> json) => RecetaResponse(
        q: json["q"],
        from: json["from"],
        to: json["to"],
        more: json["more"],
        count: json["count"],
        hits: (json["hits"] as List ).map((item) => new Hit.fromJson(item)).toList(),
        //hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x)).toList()),
    );
}

class Hit {
    Hit({
        this.receta,
        this.bookmarked,
        this.bought,
    });

    Receta receta;
    bool bookmarked;
    bool bought;

    factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        receta: Receta.fromJsonMap(json["recipe"]),
        bookmarked: json["bookmarked"],
        bought: json["bought"],
    );
}
import 'dart:convert';
 

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    int? count;
    String? next;
    dynamic previous;
    List<ResultModel>? result;

    HomeModel({
        this.count,
        this.next,
        this.previous,
        this.result,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        result: json["results"] == null ? [] : List<ResultModel>.from(json["results"]!.map((x) => ResultModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}


class ResultModel {
    String? name;
    String? url;

    ResultModel({
        this.name,
        this.url,
    });

    factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

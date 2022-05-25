import 'dart:convert';

class StationList {
    StationList({
      required  this.data,
    });

    final List<Station> data;

    factory StationList.fromRawJson(String str) => StationList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StationList.fromJson(Map<String, dynamic> json) => StationList(
        data: List<Station>.from(json["data"].map((x) => Station.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Station {
    Station({
        this.fixtureId,
        this.tvstation,
    });

    final int? fixtureId;
    final String? tvstation;

    factory Station.fromRawJson(String str) => Station.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Station.fromJson(Map<String, dynamic> json) => Station(
        fixtureId: json["fixture_id"],
        tvstation: json["tvstation"],
    );

    Map<String, dynamic> toJson() => {
        "fixture_id": fixtureId,
        "tvstation": tvstation,
    };
}
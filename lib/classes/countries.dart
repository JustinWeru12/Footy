// ignore_for_file: constant_identifier_names

import 'dart:convert';

class CountryList {
  CountryList({
    required this.data,
  });

  final List<Country> data;

  factory CountryList.fromRawJson(String str) =>
      CountryList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryList.fromJson(Map<String, dynamic> json) => CountryList(
        data: List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.id,
    this.name,
    this.imagePath,
    this.extra,
  });

  final int? id;
  final String? name;
  final String? imagePath;
  final Extra? extra;

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        imagePath: json["image_path"],
        extra: json["extra"] == null ? null : Extra.fromJson(json["extra"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_path": imagePath,
        "extra": extra == null ? null : extra!.toJson(),
      };
}

class Extra {
  Extra({
    this.continent,
    this.subRegion,
    this.worldRegion,
    this.fifa,
    this.iso,
    this.iso2,
    this.longitude,
    this.latitude,
    this.flag,
  });

  final Continent? continent;
  final String? subRegion;
  final WorldRegion? worldRegion;
  final String? fifa;
  final String? iso;
  final String? iso2;
  final String? longitude;
  final String? latitude;
  final String? flag;

  factory Extra.fromRawJson(String str) => Extra.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        continent: continentValues.map[json["continent"]],
        subRegion: json["sub_region"],
        worldRegion: json["world_region"] == null
            ? null
            : worldRegionValues.map[json["world_region"]],
        fifa: json["fifa"],
        iso: json["iso"],
        iso2: json["iso2"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "continent": continentValues.reverse[continent],
        "sub_region": subRegion,
        "world_region":
            worldRegion == null ? null : worldRegionValues.reverse[worldRegion],
        "fifa": fifa,
        "iso": iso,
        "iso2": iso2,
        "longitude": longitude,
        "latitude": latitude,
        "flag": flag,
      };
}

enum Continent { EUROPE, AMERICAS, AFRICA, OCEANIA, ASIA }

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Americas": Continent.AMERICAS,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "Oceania": Continent.OCEANIA
});

enum WorldRegion { EMEA, AMER, APAC }

final worldRegionValues = EnumValues({
  "AMER": WorldRegion.AMER,
  "APAC": WorldRegion.APAC,
  "EMEA": WorldRegion.EMEA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

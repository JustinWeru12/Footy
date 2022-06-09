import 'dart:convert';

class LeagueList {
  LeagueList({
    required this.data,
  });

  final List<League> data;

  factory LeagueList.fromRawJson(String str) =>
      LeagueList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LeagueList.fromJson(Map<String, dynamic> json) => LeagueList(
        data: List<League>.from(json["data"].map((x) => League.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class League {
  League({
    this.id,
    this.active,
    this.type,
    this.legacyId,
    this.countryId,
    this.logoPath,
    this.name,
    this.isCup,
    this.currentSeasonId,
    this.currentRoundId,
    this.currentStageId,
    this.liveStandings,
    required this.coverage,
    this.season,
    this.country,
  });

  final int? id;
  final bool? active;
  final String? type;
  final int? legacyId;
  final int? countryId;
  final String? logoPath;
  final String? name;
  final bool? isCup;
  final int? currentSeasonId;
  final int? currentRoundId;
  final int? currentStageId;
  final bool? liveStandings;
  final Coverage coverage;
  final Season? season;
  final Country? country;

  factory League.fromRawJson(String str) => League.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory League.fromJson(Map<String?, dynamic> json) => League(
        id: json["id"],
        active: json["active"],
        type: json["type"],
        legacyId: json["legacy_id"],
        countryId: json["country_id"],
        logoPath: json["logo_path"],
        name: json["name"],
        isCup: json["is_cup"],
        currentSeasonId: json["current_season_id"],
        currentRoundId: json["current_round_id"],
        currentStageId: json["current_stage_id"],
        liveStandings: json["live_standings"],
        coverage: Coverage.fromJson(json["coverage"]),
        season: Season.fromJson(json["season"]),
        country: Country.fromJson(json["country"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "active": active,
        "type": type,
        "legacy_id": legacyId,
        "country_id": countryId,
        "logo_path": logoPath,
        "name": name,
        "is_cup": isCup,
        "current_season_id": currentSeasonId,
        "current_round_id": currentRoundId,
        "current_stage_id": currentStageId,
        "live_standings": liveStandings,
        "coverage": coverage.toJson(),
        "season": season!.toJson(),
        "country": country!.toJson(),
      };
}

class Coverage {
  Coverage({
    this.predictions,
    this.topscorerGoals,
    this.topscorerAssists,
    this.topscorerCards,
  });

  final bool? predictions;
  final bool? topscorerGoals;
  final bool? topscorerAssists;
  final bool? topscorerCards;

  factory Coverage.fromRawJson(String str) =>
      Coverage.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory Coverage.fromJson(Map<String?, dynamic> json) => Coverage(
        predictions: json["predictions"],
        topscorerGoals: json["topscorer_goals"],
        topscorerAssists: json["topscorer_assists"],
        topscorerCards: json["topscorer_cards"],
      );

  Map<String?, dynamic> toJson() => {
        "predictions": predictions,
        "topscorer_goals": topscorerGoals,
        "topscorer_assists": topscorerAssists,
        "topscorer_cards": topscorerCards,
      };
}

class Country {
  Country({
    this.data,
  });

  final CountryData? data;

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        data: CountryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class CountryData {
  CountryData({
    this.id,
    this.name,
    this.imagePath,
    this.extra,
  });

  final int? id;
  final String? name;
  final String? imagePath;
  final Extra? extra;

  factory CountryData.fromRawJson(String str) =>
      CountryData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["id"],
        name: json["name"],
        imagePath: json["image_path"],
        extra: Extra.fromJson(json["extra"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_path": imagePath,
        "extra": extra!.toJson(),
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

  final String? continent;
  final String? subRegion;
  final String? worldRegion;
  final String? fifa;
  final String? iso;
  final String? iso2;
  final String? longitude;
  final String? latitude;
  final String? flag;

  factory Extra.fromRawJson(String str) => Extra.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        continent: json["continent"],
        subRegion: json["sub_region"],
        worldRegion: json["world_region"],
        fifa: json["fifa"],
        iso: json["iso"],
        iso2: json["iso2"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "continent": continent,
        "sub_region": subRegion,
        "world_region": worldRegion,
        "fifa": fifa,
        "iso": iso,
        "iso2": iso2,
        "longitude": longitude,
        "latitude": latitude,
        "flag": flag,
      };
}

class Season {
  Season({
    this.data,
  });

  final SeasonData? data;

  factory Season.fromRawJson(String str) => Season.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        data: SeasonData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class SeasonData {
  SeasonData({
    this.id,
    this.name,
    this.leagueId,
    this.isCurrentSeason,
    this.currentRoundId,
    this.currentStageId,
  });

  final int? id;
  final String? name;
  final int? leagueId;
  final bool? isCurrentSeason;
  final int? currentRoundId;
  final int? currentStageId;

  factory SeasonData.fromRawJson(String str) =>
      SeasonData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeasonData.fromJson(Map<String, dynamic> json) => SeasonData(
        id: json["id"],
        name: json["name"],
        leagueId: json["league_id"],
        isCurrentSeason: json["is_current_season"],
        currentRoundId:
            json["current_round_id"] == null ? null : json["current_round_id"],
        currentStageId:
            json["current_stage_id"] == null ? null : json["current_stage_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "league_id": leagueId,
        "is_current_season": isCurrentSeason,
        "current_round_id": currentRoundId == null ? null : currentRoundId,
        "current_stage_id": currentStageId == null ? null : currentStageId,
      };
}

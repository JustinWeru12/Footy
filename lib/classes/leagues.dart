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

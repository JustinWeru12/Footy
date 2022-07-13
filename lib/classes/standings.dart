// To parse this JSON data, do
//
//     final standings = standingsFromJson(jsonString);

import 'dart:convert';

class Standings {
  Standings({
    this.data,
  });

  final List<StandingsDatum>? data;

  factory Standings.fromRawJson(String str) =>
      Standings.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory Standings.fromJson(Map<String?, dynamic> json) => Standings(
        data: List<StandingsDatum>.from(
            json["data"].map((x) => StandingsDatum.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StandingsDatum {
  StandingsDatum({
    this.id,
    this.name,
    this.leagueId,
    this.seasonId,
    this.roundId,
    this.roundName,
    this.type,
    this.stageId,
    this.stageName,
    this.resource,
    this.standings,
  });

  final int? id;
  final String? name;
  final int? leagueId;
  final int? seasonId;
  final int? roundId;
  final int? roundName;
  final String? type;
  final int? stageId;
  final String? stageName;
  final String? resource;
  final StandingsClass? standings;

  factory StandingsDatum.fromRawJson(String str) =>
      StandingsDatum.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory StandingsDatum.fromJson(Map<String?, dynamic> json) => StandingsDatum(
        id: json["id"],
        name: json["name"],
        leagueId: json["league_id"],
        seasonId: json["season_id"],
        roundId: json["round_id"],
        roundName: json["round_name"],
        type: json["type"],
        stageId: json["stage_id"],
        stageName: json["stage_name"],
        resource: json["resource"],
        standings: StandingsClass.fromJson(json["standings"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "league_id": leagueId,
        "season_id": seasonId,
        "round_id": roundId,
        "round_name": roundName,
        "type": type,
        "stage_id": stageId,
        "stage_name": stageName,
        "resource": resource,
        "standings": standings!.toJson(),
      };
}

class StandingsClass {
  StandingsClass({
    this.data,
  });

  final List<StandingsDatumClass>? data;

  factory StandingsClass.fromRawJson(String str) =>
      StandingsClass.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory StandingsClass.fromJson(Map<String?, dynamic> json) => StandingsClass(
        data: List<StandingsDatumClass>.from(
            json["data"].map((x) => StandingsDatumClass.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StandingsDatumClass {
  StandingsDatumClass({
    this.position,
    this.teamId,
    this.teamName,
    this.roundId,
    this.roundName,
    this.groupId,
    this.groupName,
    this.overall,
    this.home,
    this.away,
    this.total,
    this.points,
    this.recentForm,
    this.status,
  });

  final int? position;
  final int? teamId;
  final String? teamName;
  final int? roundId;
  final int? roundName;
  final dynamic groupId;
  final dynamic groupName;
  final PointResult? overall;
  final PointResult? home;
  final PointResult? away;
  final Total? total;
  final int? points;
  final String? recentForm;
  final dynamic status;

  factory StandingsDatumClass.fromRawJson(String str) =>
      StandingsDatumClass.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory StandingsDatumClass.fromJson(Map<String?, dynamic> json) =>
      StandingsDatumClass(
        position: json["position"],
        teamId: json["team_id"],
        teamName: json["team_name"],
        roundId: json["round_id"],
        roundName: json["round_name"],
        groupId: json["group_id"],
        groupName: json["group_name"],
        overall: PointResult.fromJson(json["overall"]),
        home: PointResult.fromJson(json["home"]),
        away: PointResult.fromJson(json["away"]),
        total: Total.fromJson(json["total"]),
        points: json["points"],
        recentForm: json["recent_form"],
        status: json["status"],
      );

  Map<String?, dynamic> toJson() => {
        "position": position,
        "team_id": teamId,
        "team_name": teamName,
        "round_id": roundId,
        "round_name": roundName,
        "group_id": groupId,
        "group_name": groupName,
        "overall": overall!.toJson(),
        "home": home!.toJson(),
        "away": away!.toJson(),
        "total": total!.toJson(),
        "points": points,
        "recent_form": recentForm,
        "status": status,
      };
}

class Total {
  Total({
    this.goalDifference,
    this.points,
  });

  final String? goalDifference;
  final int? points;

  factory Total.fromRawJson(String str) => Total.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory Total.fromJson(Map<String?, dynamic> json) => Total(
        goalDifference: json["goal_difference"],
        points: json["points"],
      );

  Map<String?, dynamic> toJson() => {
        "goal_difference": goalDifference,
        "points": points,
      };
}

class PointResult {
  PointResult({
    this.gamesPlayed,
    this.won,
    this.draw,
    this.lost,
    this.goalsScored,
    this.goalsAgainst,
    this.points,
  });

  final int? gamesPlayed;
  final int? won;
  final int? draw;
  final int? lost;
  final int? goalsScored;
  final int? goalsAgainst;
  final int? points;

  factory PointResult.fromRawJson(String str) =>
      PointResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PointResult.fromJson(Map<String, dynamic> json) => PointResult(
        gamesPlayed: json["games_played"],
        won: json["won"],
        draw: json["draw"],
        lost: json["lost"],
        goalsScored: json["goals_scored"],
        goalsAgainst: json["goals_against"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "games_played": gamesPlayed,
        "won": won,
        "draw": draw,
        "lost": lost,
        "goals_scored": goalsScored,
        "goals_against": goalsAgainst,
        "points": points,
      };
}

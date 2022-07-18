import 'dart:convert';

class Head2Head {
  Head2Head({
    this.data,
  });

  final List<Datum>? data;

  factory Head2Head.fromRawJson(String str) =>
      Head2Head.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Head2Head.fromJson(Map<String, dynamic> json) => Head2Head(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.leagueId,
    this.seasonId,
    this.stageId,
    this.roundId,
    this.groupId,
    this.aggregateId,
    this.venueId,
    this.refereeId,
    this.localteamId,
    this.visitorteamId,
    this.winnerTeamId,
    this.commentaries,
    this.attendance,
    this.pitch,
    this.details,
    this.neutralVenue,
    this.winningOddsCalculated,
    this.formations,
    this.scores,
    this.time,
    this.coaches,
    this.standings,
    this.assistants,
    this.leg,
    this.deleted,
    this.isPlaceholder,
  });

  final int? id;
  final int? leagueId;
  final int? seasonId;
  final int? stageId;
  final int? roundId;
  final dynamic groupId;
  final dynamic aggregateId;
  final int? venueId;
  final int? refereeId;
  final int? localteamId;
  final int? visitorteamId;
  final int? winnerTeamId;
  final bool? commentaries;
  final int? attendance;
  final dynamic pitch;
  final dynamic details;
  final bool? neutralVenue;
  final bool? winningOddsCalculated;
  final Formations? formations;
  final Scores? scores;
  final Time? time;
  final Coaches? coaches;
  final Standings? standings;
  final Assistants? assistants;
  final Leg? leg;
  final bool? deleted;
  final bool? isPlaceholder;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        leagueId: json["league_id"],
        seasonId: json["season_id"],
        stageId: json["stage_id"],
        roundId: json["round_id"],
        groupId: json["group_id"],
        aggregateId: json["aggregate_id"],
        venueId: json["venue_id"],
        refereeId: json["referee_id"],
        localteamId: json["localteam_id"],
        visitorteamId: json["visitorteam_id"],
        winnerTeamId: json["winner_team_id"],
        commentaries: json["commentaries"],
        attendance: json["attendance"],
        pitch: json["pitch"],
        details: json["details"],
        neutralVenue: json["neutral_venue"],
        winningOddsCalculated: json["winning_odds_calculated"],
        formations: json["formations"] == null
            ? null
            : Formations.fromJson(json["formations"]),
        scores: json["scores"] == null ? null : Scores.fromJson(json["scores"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        coaches:
            json["coaches"] == null ? null : Coaches.fromJson(json["coaches"]),
        standings: json["standings"] == null
            ? null
            : Standings.fromJson(json["standings"]),
        assistants: json["assistants"] == null
            ? null
            : Assistants.fromJson(json["assistants"]),
        leg: json["leg"] == null ? null : legValues.map![json["leg"]],
        deleted: json["deleted"],
        isPlaceholder: json["is_placeholder"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "league_id": leagueId,
        "season_id": seasonId,
        "stage_id": stageId,
        "round_id": roundId,
        "group_id": groupId,
        "aggregate_id": aggregateId,
        "venue_id": venueId,
        "referee_id": refereeId,
        "localteam_id": localteamId,
        "visitorteam_id": visitorteamId,
        "winner_team_id": winnerTeamId,
        "commentaries": commentaries,
        "attendance": attendance,
        "pitch": pitch,
        "details": details,
        "neutral_venue": neutralVenue,
        "winning_odds_calculated": winningOddsCalculated,
        "formations": formations == null ? null : formations!.toJson(),
        "scores": scores == null ? null : scores!.toJson(),
        "time": time == null ? null : time!.toJson(),
        "coaches": coaches == null ? null : coaches!.toJson(),
        "standings": standings == null ? null : standings!.toJson(),
        "assistants": assistants == null ? null : assistants!.toJson(),
        "leg": leg == null ? null : legValues.reverse![leg],
        "deleted": deleted,
        "is_placeholder": isPlaceholder,
      };
}

class Assistants {
  Assistants({
    this.firstAssistantId,
    this.secondAssistantId,
    this.fourthOfficialId,
  });

  final int? firstAssistantId;
  final int? secondAssistantId;
  final int? fourthOfficialId;

  factory Assistants.fromRawJson(String str) =>
      Assistants.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Assistants.fromJson(Map<String, dynamic> json) => Assistants(
        firstAssistantId: json["first_assistant_id"],
        secondAssistantId: json["second_assistant_id"],
        fourthOfficialId: json["fourth_official_id"],
      );

  Map<String, dynamic> toJson() => {
        "first_assistant_id": firstAssistantId,
        "second_assistant_id": secondAssistantId,
        "fourth_official_id": fourthOfficialId,
      };
}

class Coaches {
  Coaches({
    this.localteamCoachId,
    this.visitorteamCoachId,
  });

  final int? localteamCoachId;
  final int? visitorteamCoachId;

  factory Coaches.fromRawJson(String str) => Coaches.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coaches.fromJson(Map<String, dynamic> json) => Coaches(
        localteamCoachId: json["localteam_coach_id"],
        visitorteamCoachId: json["visitorteam_coach_id"],
      );

  Map<String, dynamic> toJson() => {
        "localteam_coach_id": localteamCoachId,
        "visitorteam_coach_id": visitorteamCoachId,
      };
}

class Team {
  Team({
    this.color,
    this.kitColors,
  });

  final String? color;
  final String? kitColors;

  factory Team.fromRawJson(String str) => Team.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        color: json["color"],
        kitColors: json["kit_colors"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "kit_colors": kitColors,
      };
}

class Formations {
  Formations({
    this.localteamFormation,
    this.visitorteamFormation,
  });

  final String? localteamFormation;
  final String? visitorteamFormation;

  factory Formations.fromRawJson(String str) =>
      Formations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Formations.fromJson(Map<String, dynamic> json) => Formations(
        localteamFormation: json["localteam_formation"],
        visitorteamFormation: json["visitorteam_formation"],
      );

  Map<String, dynamic> toJson() => {
        "localteam_formation": localteamFormation,
        "visitorteam_formation": visitorteamFormation,
      };
}

// ignore: constant_identifier_names
enum Leg { THE_11 }

final legValues = EnumValues({"1/1": Leg.THE_11});

class Scores {
  Scores({
    this.localteamScore,
    this.visitorteamScore,
    this.localteamPenScore,
    this.visitorteamPenScore,
    this.htScore,
    this.ftScore,
    this.etScore,
    this.psScore,
  });

  final int? localteamScore;
  final int? visitorteamScore;
  final dynamic localteamPenScore;
  final int? visitorteamPenScore;
  final String? htScore;
  final String? ftScore;
  final dynamic etScore;
  final dynamic psScore;

  factory Scores.fromRawJson(String str) => Scores.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
        localteamScore: json["localteam_score"],
        visitorteamScore: json["visitorteam_score"],
        localteamPenScore: json["localteam_pen_score"],
        visitorteamPenScore: json["visitorteam_pen_score"],
        htScore: json["ht_score"],
        ftScore: json["ft_score"],
        etScore: json["et_score"],
        psScore: json["ps_score"],
      );

  Map<String, dynamic> toJson() => {
        "localteam_score": localteamScore,
        "visitorteam_score": visitorteamScore,
        "localteam_pen_score": localteamPenScore,
        "visitorteam_pen_score": visitorteamPenScore,
        "ht_score": htScore,
        "ft_score": ftScore,
        "et_score": etScore,
        "ps_score": psScore,
      };
}

class Standings {
  Standings({
    this.localteamPosition,
    this.visitorteamPosition,
  });

  final int? localteamPosition;
  final int? visitorteamPosition;

  factory Standings.fromRawJson(String str) =>
      Standings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Standings.fromJson(Map<String, dynamic> json) => Standings(
        localteamPosition: json["localteam_position"],
        visitorteamPosition: json["visitorteam_position"],
      );

  Map<String, dynamic> toJson() => {
        "localteam_position": localteamPosition,
        "visitorteam_position": visitorteamPosition,
      };
}

class Time {
  Time({
    this.status,
    this.startingAt,
    this.minute,
    this.second,
    this.addedTime,
    this.extraMinute,
    this.injuryTime,
  });

  final Status? status;
  final StartingAt? startingAt;
  final int? minute;
  final int? second;
  final int? addedTime;
  final dynamic extraMinute;
  final dynamic injuryTime;

  factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        startingAt: json["starting_at"] == null
            ? null
            : StartingAt.fromJson(json["starting_at"]),
        minute: json["minute"],
        second: json["second"],
        addedTime: json["added_time"],
        extraMinute: json["extra_minute"],
        injuryTime: json["injury_time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : statusValues.reverse![status],
        "starting_at": startingAt == null ? null : startingAt!.toJson(),
        "minute": minute,
        "second": second,
        "added_time": addedTime,
        "extra_minute": extraMinute,
        "injury_time": injuryTime,
      };
}

class StartingAt {
  StartingAt({
    this.dateTime,
    this.date,
    this.time,
    this.timestamp,
    this.timezone,
  });

  final DateTime? dateTime;
  final DateTime? date;
  final String? time;
  final int? timestamp;
  final Timezone? timezone;

  factory StartingAt.fromRawJson(String str) =>
      StartingAt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StartingAt.fromJson(Map<String, dynamic> json) => StartingAt(
        dateTime: json["date_time"] == null
            ? null
            : DateTime.parse(json["date_time"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        timestamp: json["timestamp"],
        timezone: json["timezone"] == null
            ? null
            : timezoneValues.map![json["timezone"]],
      );

  Map<String, dynamic> toJson() => {
        "date_time": dateTime == null ? null : dateTime!.toIso8601String(),
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "timestamp": timestamp,
        "timezone": timezone == null ? null : timezoneValues.reverse![timezone],
      };
}

// ignore: constant_identifier_names
enum Timezone { UTC }

final timezoneValues = EnumValues({"UTC": Timezone.UTC});

// ignore: constant_identifier_names
enum Status { FT }

final statusValues = EnumValues({"FT": Status.FT});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

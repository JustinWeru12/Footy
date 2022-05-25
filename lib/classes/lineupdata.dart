// ignore_for_file: constant_identifier_names

import 'dart:convert';

class LineUp {
  LineUp({
    this.data,
  });

  final LineUpData? data;

  factory LineUp.fromRawJson(String str) => LineUp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineUp.fromJson(Map<String, dynamic> json) => LineUp(
        data: LineUpData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class LineUpData {
  LineUpData({
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
    this.weatherReport,
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
    this.colors,
    this.deleted,
    this.lineup,
    this.bench,
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
  final WeatherReport? weatherReport;
  final bool? commentaries;
  final dynamic attendance;
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
  final String? leg;
  final Colors? colors;
  final bool? deleted;
  final Lineup? lineup;
  final Bench? bench;

  factory LineUpData.fromRawJson(String str) =>
      LineUpData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineUpData.fromJson(Map<String, dynamic> json) => LineUpData(
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
        weatherReport: WeatherReport.fromJson(json["weather_report"]),
        commentaries: json["commentaries"],
        attendance: json["attendance"],
        pitch: json["pitch"],
        details: json["details"],
        neutralVenue: json["neutral_venue"],
        winningOddsCalculated: json["winning_odds_calculated"],
        formations: Formations.fromJson(json["formations"]),
        scores: Scores.fromJson(json["scores"]),
        time: Time.fromJson(json["time"]),
        coaches: Coaches.fromJson(json["coaches"]),
        standings: Standings.fromJson(json["standings"]),
        assistants: Assistants.fromJson(json["assistants"]),
        leg: json["leg"],
        colors: Colors.fromJson(json["colors"]),
        deleted: json["deleted"],
        lineup: Lineup.fromJson(json["lineup"]),
        bench: Bench.fromJson(json["bench"]),
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
        "weather_report": weatherReport!.toJson(),
        "commentaries": commentaries,
        "attendance": attendance,
        "pitch": pitch,
        "details": details,
        "neutral_venue": neutralVenue,
        "winning_odds_calculated": winningOddsCalculated,
        "formations": formations!.toJson(),
        "scores": scores!.toJson(),
        "time": time!.toJson(),
        "coaches": coaches!.toJson(),
        "standings": standings!.toJson(),
        "assistants": assistants!.toJson(),
        "leg": leg,
        "colors": colors!.toJson(),
        "deleted": deleted,
        "lineup": lineup!.toJson(),
        "bench": bench!.toJson(),
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

class Bench {
  Bench({
    this.data,
  });

  final List<BenchDatum>? data;

  factory Bench.fromRawJson(String str) => Bench.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bench.fromJson(Map<String, dynamic> json) => Bench(
        data: List<BenchDatum>.from(
            json["data"].map((x) => BenchDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BenchDatum {
  BenchDatum({
    this.teamId,
    this.fixtureId,
    this.playerId,
    this.playerName,
    this.number,
    this.position,
    this.additionalPosition,
    this.formationPosition,
    this.posx,
    this.posy,
    this.captain,
    this.type,
    this.stats,
    this.player,
  });

  final int? teamId;
  final int? fixtureId;
  final int? playerId;
  final String? playerName;
  final int? number;
  final Position? additionalPosition;
  final Position? position;
  final dynamic formationPosition;
  final dynamic posx;
  final dynamic posy;
  final bool? captain;
  final PurpleType? type;
  final Stats? stats;
  final Player? player;

  factory BenchDatum.fromRawJson(String str) =>
      BenchDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BenchDatum.fromJson(Map<String, dynamic> json) => BenchDatum(
        teamId: json["team_id"],
        fixtureId: json["fixture_id"],
        playerId: json["player_id"],
        playerName: json["player_name"],
        number: json["number"],
        position: positionValues.map[json["position"]],
        additionalPosition: json["additional_position"],
        formationPosition: json["formation_position"],
        posx: json["posx"],
        posy: json["posy"],
        captain: json["captain"],
        type: purpleTypeValues.map[json["type"]],
        stats: Stats.fromJson(json["stats"]),
        player: Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "fixture_id": fixtureId,
        "player_id": playerId,
        "player_name": playerName,
        "number": number,
        "position": positionValues.reverse[position],
        "additional_position": additionalPosition,
        "formation_position": formationPosition,
        "posx": posx,
        "posy": posy,
        "captain": captain,
        "type": purpleTypeValues.reverse[type],
        "stats": stats!.toJson(),
        "player": player!.toJson(),
      };
}

class Player {
  Player({
    this.data,
  });

  final PlayerData? data;

  factory Player.fromRawJson(String str) => Player.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        data: PlayerData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class PlayerData {
  PlayerData({
    this.playerId,
    this.teamId,
    this.countryId,
    this.positionId,
    this.commonName,
    this.displayName,
    this.fullname,
    this.firstname,
    this.lastname,
    this.nationality,
    this.birthdate,
    this.birthcountry,
    this.birthplace,
    this.height,
    this.weight,
    this.imagePath,
  });

  final int? playerId;
  final int? teamId;
  final int? countryId;
  final int? positionId;
  final String? commonName;
  final String? displayName;
  final String? fullname;
  final String? firstname;
  final String? lastname;
  final String? nationality;
  final String? birthdate;
  final String? birthcountry;
  final String? birthplace;
  final String? height;
  final String? weight;
  final String? imagePath;

  factory PlayerData.fromRawJson(String str) =>
      PlayerData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerData.fromJson(Map<String, dynamic> json) => PlayerData(
        playerId: json["player_id"],
        teamId: json["team_id"],
        countryId: json["country_id"],
        positionId: json["position_id"],
        commonName: json["common_name"],
        displayName: json["display_name"],
        fullname: json["fullname"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        nationality: json["nationality"],
        birthdate: json["birthdate"],
        birthcountry: json["birthcountry"],
        birthplace: json["birthplace"],
        height: json["height"],
        weight: json["weight"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "team_id": teamId,
        "country_id": countryId,
        "position_id": positionId,
        "common_name": commonName,
        "display_name": displayName,
        "fullname": fullname,
        "firstname": firstname,
        "lastname": lastname,
        "nationality": nationality,
        "birthdate": birthdate,
        "birthcountry": birthcountry,
        "birthplace": birthplace,
        "height": height,
        "weight": weight,
        "image_path": imagePath,
      };
}

enum Position { G, D, A, M }

final positionValues = EnumValues(
    {"A": Position.A, "D": Position.D, "G": Position.G, "M": Position.M});

class Stats {
  Stats({
    this.shots,
    this.goals,
    this.fouls,
    this.cards,
    this.passing,
    this.dribbles,
    this.duels,
    this.other,
    this.rating,
  });

  final Shots? shots;
  final Goals? goals;
  final Fouls? fouls;
  final Cards? cards;
  final Passing? passing;
  final Dribbles? dribbles;
  final Duels? duels;
  final Map<String, int>? other;
  final String? rating;

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        shots: Shots.fromJson(json["shots"]),
        goals: Goals.fromJson(json["goals"]),
        fouls: Fouls.fromJson(json["fouls"]),
        cards: Cards.fromJson(json["cards"]),
        passing: Passing.fromJson(json["passing"]),
        dribbles: Dribbles.fromJson(json["dribbles"]),
        duels: Duels.fromJson(json["duels"]),
        other:
            Map.from(json["other"]).map((k, v) => MapEntry<String, int>(k, v)),
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "shots": shots!.toJson(),
        "goals": goals!.toJson(),
        "fouls": fouls!.toJson(),
        "cards": cards!.toJson(),
        "passing": passing!.toJson(),
        "dribbles": dribbles!.toJson(),
        "duels": duels!.toJson(),
        "other":
            Map.from(other!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "rating": rating,
      };
}

class Cards {
  Cards({
    this.yellowcards,
    this.redcards,
    this.yellowredcards,
  });

  final int? yellowcards;
  final int? redcards;
  final int? yellowredcards;

  factory Cards.fromRawJson(String str) => Cards.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        yellowcards: json["yellowcards"],
        redcards: json["redcards"],
        yellowredcards: json["yellowredcards"],
      );

  Map<String, dynamic> toJson() => {
        "yellowcards": yellowcards,
        "redcards": redcards,
        "yellowredcards": yellowredcards,
      };
}

class Dribbles {
  Dribbles({
    this.attempts,
    this.success,
    this.dribbledPast,
  });

  final int? attempts;
  final int? success;
  final int? dribbledPast;

  factory Dribbles.fromRawJson(String str) =>
      Dribbles.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dribbles.fromJson(Map<String, dynamic> json) => Dribbles(
        attempts: json["attempts"],
        success: json["success"],
        dribbledPast: json["dribbled_past"],
      );

  Map<String, dynamic> toJson() => {
        "attempts": attempts,
        "success": success,
        "dribbled_past": dribbledPast,
      };
}

class Duels {
  Duels({
    this.total,
    this.won,
  });

  final int? total;
  final int? won;

  factory Duels.fromRawJson(String str) => Duels.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Duels.fromJson(Map<String, dynamic> json) => Duels(
        total: json["total"],
        won: json["won"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "won": won,
      };
}

class Fouls {
  Fouls({
    this.drawn,
    this.committed,
  });

  final int? drawn;
  final int? committed;

  factory Fouls.fromRawJson(String str) => Fouls.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fouls.fromJson(Map<String, dynamic> json) => Fouls(
        drawn: json["drawn"],
        committed: json["committed"],
      );

  Map<String, dynamic> toJson() => {
        "drawn": drawn,
        "committed": committed,
      };
}

class Goals {
  Goals({
    this.scored,
    this.assists,
    this.conceded,
    this.owngoals,
  });

  final int? scored;
  final int? assists;
  final int? conceded;
  final int? owngoals;

  factory Goals.fromRawJson(String str) => Goals.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        scored: json["scored"],
        assists: json["assists"],
        conceded: json["conceded"],
        owngoals: json["owngoals"],
      );

  Map<String, dynamic> toJson() => {
        "scored": scored,
        "assists": assists,
        "conceded": conceded,
        "owngoals": owngoals,
      };
}

class Passing {
  Passing({
    this.totalCrosses,
    this.crossesAccuracy,
    this.passes,
    this.accuratePasses,
    this.passesAccuracy,
    this.keyPasses,
  });

  final int? totalCrosses;
  final int? crossesAccuracy;
  final int? passes;
  final int? accuratePasses;
  final int? passesAccuracy;
  final int? keyPasses;

  factory Passing.fromRawJson(String str) => Passing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Passing.fromJson(Map<String, dynamic> json) => Passing(
        totalCrosses: json["total_crosses"],
        crossesAccuracy: json["crosses_accuracy"],
        passes: json["passes"],
        accuratePasses: json["accurate_passes"],
        passesAccuracy: json["passes_accuracy"],
        keyPasses: json["key_passes"],
      );

  Map<String, dynamic> toJson() => {
        "total_crosses": totalCrosses,
        "crosses_accuracy": crossesAccuracy,
        "passes": passes,
        "accurate_passes": accuratePasses,
        "passes_accuracy": passesAccuracy,
        "key_passes": keyPasses,
      };
}

class Shots {
  Shots({
    this.shotsTotal,
    this.shotsOnGoal,
  });

  final int? shotsTotal;
  final int? shotsOnGoal;

  factory Shots.fromRawJson(String str) => Shots.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
        shotsTotal: json["shots_total"],
        shotsOnGoal: json["shots_on_goal"],
      );

  Map<String, dynamic> toJson() => {
        "shots_total": shotsTotal,
        "shots_on_goal": shotsOnGoal,
      };
}

enum PurpleType { BENCH }

final purpleTypeValues = EnumValues({"bench": PurpleType.BENCH});

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

class Colors {
  Colors({
    this.localteam,
    this.visitorteam,
  });

  final Team? localteam;
  final Team? visitorteam;

  factory Colors.fromRawJson(String str) => Colors.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        localteam: Team.fromJson(json["localteam"]),
        visitorteam: Team.fromJson(json["visitorteam"]),
      );

  Map<String, dynamic> toJson() => {
        "localteam": localteam!.toJson(),
        "visitorteam": visitorteam!.toJson(),
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

class Lineup {
  Lineup({
    this.data,
  });

  final List<LineupDatum>? data;

  factory Lineup.fromRawJson(String str) => Lineup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lineup.fromJson(Map<String, dynamic> json) => Lineup(
        data: List<LineupDatum>.from(
            json["data"].map((x) => LineupDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LineupDatum {
  LineupDatum({
    this.teamId,
    this.fixtureId,
    this.playerId,
    this.playerName,
    this.number,
    this.position,
    this.additionalPosition,
    this.formationPosition,
    this.posx,
    this.posy,
    this.captain,
    this.type,
    this.stats,
    this.player,
  });

  final int? teamId;
  final int? fixtureId;
  final int? playerId;
  final String? playerName;
  final int? number;
  final Position? position;
  final dynamic additionalPosition;
  final int? formationPosition;
  final dynamic posx;
  final dynamic posy;
  final bool? captain;
  final FluffyType? type;
  final Stats? stats;
  final Player? player;

  factory LineupDatum.fromRawJson(String str) =>
      LineupDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineupDatum.fromJson(Map<String, dynamic> json) => LineupDatum(
        teamId: json["team_id"],
        fixtureId: json["fixture_id"],
        playerId: json["player_id"],
        playerName: json["player_name"],
        number: json["number"],
        position: positionValues.map[json["position"]],
        additionalPosition: json["additional_position"],
        formationPosition: json["formation_position"],
        posx: json["posx"],
        posy: json["posy"],
        captain: json["captain"],
        type: fluffyTypeValues.map[json["type"]],
        stats: Stats.fromJson(json["stats"]),
        player: Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "fixture_id": fixtureId,
        "player_id": playerId,
        "player_name": playerName,
        "number": number,
        "position": positionValues.reverse[position],
        "additional_position": additionalPosition,
        "formation_position": formationPosition,
        "posx": posx,
        "posy": posy,
        "captain": captain,
        "type": fluffyTypeValues.reverse[type],
        "stats": stats!.toJson(),
        "player": player!.toJson(),
      };
}

enum FluffyType { LINEUP }

final fluffyTypeValues = EnumValues({"lineup": FluffyType.LINEUP});

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
  final dynamic visitorteamPenScore;
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

  final String? status;
  final StartingAt? startingAt;
  final int? minute;
  final dynamic second;
  final dynamic addedTime;
  final dynamic extraMinute;
  final dynamic injuryTime;

  factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        status: json["status"],
        startingAt: StartingAt.fromJson(json["starting_at"]),
        minute: json["minute"],
        second: json["second"],
        addedTime: json["added_time"],
        extraMinute: json["extra_minute"],
        injuryTime: json["injury_time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "starting_at": startingAt!.toJson(),
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
  final String? timezone;

  factory StartingAt.fromRawJson(String str) =>
      StartingAt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StartingAt.fromJson(Map<String, dynamic> json) => StartingAt(
        dateTime: DateTime.parse(json["date_time"]),
        date: DateTime.parse(json["date"]),
        time: json["time"],
        timestamp: json["timestamp"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date_time": dateTime!.toIso8601String(),
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "timestamp": timestamp,
        "timezone": timezone,
      };
}

class WeatherReport {
  WeatherReport({
    this.code,
    this.type,
    this.icon,
    this.temperature,
    this.temperatureCelcius,
    this.clouds,
    this.humidity,
    this.pressure,
    this.wind,
    this.coordinates,
    this.updatedAt,
  });

  final String? code;
  final String? type;
  final String? icon;
  final Temperature? temperature;
  final Temperature? temperatureCelcius;
  final String? clouds;
  final String? humidity;
  final int? pressure;
  final Wind? wind;
  final Coordinates? coordinates;
  final DateTime? updatedAt;

  factory WeatherReport.fromRawJson(String str) =>
      WeatherReport.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherReport.fromJson(Map<String, dynamic> json) => WeatherReport(
        code: json["code"],
        type: json["type"],
        icon: json["icon"],
        temperature: Temperature.fromJson(json["temperature"]),
        temperatureCelcius: Temperature.fromJson(json["temperature_celcius"]),
        clouds: json["clouds"],
        humidity: json["humidity"],
        pressure: json["pressure"],
        wind: Wind.fromJson(json["wind"]),
        coordinates: Coordinates.fromJson(json["coordinates"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "type": type,
        "icon": icon,
        "temperature": temperature!.toJson(),
        "temperature_celcius": temperatureCelcius!.toJson(),
        "clouds": clouds,
        "humidity": humidity,
        "pressure": pressure,
        "wind": wind!.toJson(),
        "coordinates": coordinates!.toJson(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Coordinates {
  Coordinates({
    this.lat,
    this.lon,
  });

  final double? lat;
  final double? lon;

  factory Coordinates.fromRawJson(String str) =>
      Coordinates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class Temperature {
  Temperature({
    this.temp,
    this.unit,
  });

  final double? temp;
  final String? unit;

  factory Temperature.fromRawJson(String str) =>
      Temperature.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        temp: json["temp"].toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "unit": unit,
      };
}

class Wind {
  Wind({
    this.speed,
    this.degree,
  });

  final String? speed;
  final int? degree;

  factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        degree: json["degree"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "degree": degree,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

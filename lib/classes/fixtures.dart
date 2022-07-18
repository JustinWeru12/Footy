// ignore_for_file: constant_identifier_names

import 'dart:convert';

class FixtureList {
  FixtureList({
    required this.data,
  });

  final List<Fixture> data;

  factory FixtureList.fromRawJson(String str) =>
      FixtureList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FixtureList.fromJson(Map<String, dynamic> json) => FixtureList(
        data: List<Fixture>.from(json["data"].map((x) => Fixture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SingleFixture {
  SingleFixture({
    this.fixture,
  });

  final Fixture? fixture;

  factory SingleFixture.fromRawJson(String str) =>
      SingleFixture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SingleFixture.fromJson(Map<String, dynamic> json) => SingleFixture(
        fixture: Fixture.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "fixture": fixture?.toJson(),
      };
}

class Fixture {
  Fixture({
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
    // this.weatherReport,
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
    this.isPlaceholder,
    this.localTeam,
    this.visitorTeam,
    this.tvstations,
    this.league,
    this.referee,
    this.venue,
    this.lineup,
    this.events,
    this.stats,
  });

  final int? id;
  final int? leagueId;
  final int? seasonId;
  final int? stageId;
  final dynamic roundId;
  final dynamic groupId;
  final int? aggregateId;
  final int? venueId;
  final int? refereeId;
  final int? localteamId;
  final int? visitorteamId;
  final int? winnerTeamId;
  // final WeatherReport weatherReport;
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
  final APIColors? colors;
  final bool? deleted;
  final bool? isPlaceholder;
  final TeamClass? localTeam;
  final TeamClass? visitorTeam;
  final Tvstations? tvstations;
  final League? league;
  final Referee? referee;
  final Venue? venue;
  final Lineup? lineup;
  final Events? events;
  final FixtureStats? stats;

  factory Fixture.fromRawJson(String str) => Fixture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
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
        // weatherReport: WeatherReport.fromJson(json["weather_report"]),
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
        colors: json.containsKey("colors") && json["colors"] != null
            ? APIColors.fromJson(json["colors"])
            : null,
        deleted: json["deleted"],
        isPlaceholder: json["is_placeholder"],
        localTeam: TeamClass.fromJson(json["localTeam"]),
        visitorTeam: TeamClass.fromJson(json["visitorTeam"]),
        tvstations: Tvstations.fromJson(json["tvstations"]),
        league: League.fromJson(json["league"]),
        referee: json.containsKey("referee")
            ? Referee.fromJson(json["referee"])
            : null,
        events: json.containsKey("events") && json["events"] != null
            ? Events.fromJson(json["events"])
            : null,
        lineup: json.containsKey("lineup") && json["lineup"] != null
            ? Lineup.fromJson(json["lineup"])
            : null,
        stats: json.containsKey("stats") && json["stats"] != null
            ? FixtureStats.fromJson(json["stats"])
            : null,
        venue: Venue.fromJson(json["venue"]),
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
        // "weather_report": weatherReport.toJson(),
        "commentaries": commentaries,
        "attendance": attendance,
        "pitch": pitch,
        "details": details,
        "neutral_venue": neutralVenue,
        "winning_odds_calculated": winningOddsCalculated,
        "formations": formations?.toJson(),
        "scores": scores?.toJson(),
        "time": time?.toJson(),
        "coaches": coaches?.toJson(),
        "standings": standings?.toJson(),
        "assistants": assistants?.toJson(),
        "leg": leg,
        "colors": colors?.toJson(),
        "deleted": deleted,
        "is_placeholder": isPlaceholder,
        "localTeam": localTeam?.toJson(),
        "visitorTeam": visitorTeam?.toJson(),
        "tvstations": tvstations?.toJson(),
        "league": league?.toJson(),
        "referee": referee?.toJson(),
        "venue": venue?.toJson(),
        "lineup": lineup?.toJson(),
        "events": events?.toJson(),
        "stats": stats?.toJson(),
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

class APIColors {
  APIColors({
    this.localteam,
    this.visitorteam,
  });

  final Team? localteam;
  final Team? visitorteam;

  factory APIColors.fromRawJson(String str) =>
      APIColors.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory APIColors.fromJson(Map<String, dynamic> json) => APIColors(
        localteam: Team.fromJson(json["localteam"]),
        visitorteam: Team.fromJson(json["visitorteam"]),
      );

  Map<String, dynamic> toJson() => {
        "localteam": localteam?.toJson(),
        "visitorteam": visitorteam?.toJson(),
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

class League {
  League({
    this.data,
  });

  final LeagueData? data;

  factory League.fromRawJson(String str) => League.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory League.fromJson(Map<String, dynamic> json) => League(
        data: LeagueData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class LeagueData {
  LeagueData({
    this.id,
    this.active,
    this.type,
    this.legacyId,
    this.countryId,
    this.logoPath,
    this.name,
    this.isCup,
    this.isFriendly,
    this.currentSeasonId,
    this.currentRoundId,
    this.currentStageId,
    this.liveStandings,
    this.coverage,
  });

  final int? id;
  final bool? active;
  final String? type;
  final dynamic legacyId;
  final int? countryId;
  final String? logoPath;
  final String? name;
  final bool? isCup;
  final bool? isFriendly;
  final int? currentSeasonId;
  final dynamic currentRoundId;
  final int? currentStageId;
  final bool? liveStandings;
  final Coverage? coverage;

  factory LeagueData.fromRawJson(String str) =>
      LeagueData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LeagueData.fromJson(Map<String, dynamic> json) => LeagueData(
        id: json["id"],
        active: json["active"],
        type: json["type"],
        legacyId: json["legacy_id"],
        countryId: json["country_id"],
        logoPath: json["logo_path"],
        name: json["name"],
        isCup: json["is_cup"],
        isFriendly: json["is_friendly"],
        currentSeasonId: json["current_season_id"],
        currentRoundId: json["current_round_id"],
        currentStageId: json["current_stage_id"],
        liveStandings: json["live_standings"],
        coverage: Coverage.fromJson(json["coverage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "type": type,
        "legacy_id": legacyId,
        "country_id": countryId,
        "logo_path": logoPath,
        "name": name,
        "is_cup": isCup,
        "is_friendly": isFriendly,
        "current_season_id": currentSeasonId,
        "current_round_id": currentRoundId,
        "current_stage_id": currentStageId,
        "live_standings": liveStandings,
        "coverage": coverage?.toJson(),
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

  String toRawJson() => json.encode(toJson());

  factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
        predictions: json["predictions"],
        topscorerGoals: json["topscorer_goals"],
        topscorerAssists: json["topscorer_assists"],
        topscorerCards: json["topscorer_cards"],
      );

  Map<String, dynamic> toJson() => {
        "predictions": predictions,
        "topscorer_goals": topscorerGoals,
        "topscorer_assists": topscorerAssists,
        "topscorer_cards": topscorerCards,
      };
}

class TeamClass {
  TeamClass({
    this.data,
  });

  final TeamData? data;

  factory TeamClass.fromRawJson(String str) =>
      TeamClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamClass.fromJson(Map<String, dynamic> json) => TeamClass(
        data: TeamData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class TeamData {
  TeamData({
    this.id,
    this.legacyId,
    this.name,
    this.shortCode,
    this.twitter,
    this.countryId,
    this.nationalTeam,
    this.founded,
    this.logoPath,
    this.venueId,
    this.currentSeasonId,
    this.isPlaceholder,
  });

  final int? id;
  final int? legacyId;
  final String? name;
  final String? shortCode;
  final dynamic twitter;
  final int? countryId;
  final bool? nationalTeam;
  final int? founded;
  final String? logoPath;
  final int? venueId;
  final int? currentSeasonId;
  final bool? isPlaceholder;

  factory TeamData.fromRawJson(String str) =>
      TeamData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamData.fromJson(Map<String, dynamic> json) => TeamData(
        id: json["id"],
        legacyId: json["legacy_id"],
        name: json["name"],
        shortCode: json["short_code"],
        twitter: json["twitter"],
        countryId: json["country_id"],
        nationalTeam: json["national_team"],
        founded: json["founded"],
        logoPath: json["logo_path"],
        venueId: json["venue_id"],
        currentSeasonId: json["current_season_id"],
        isPlaceholder: json["is_placeholder"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "legacy_id": legacyId,
        "name": name,
        "short_code": shortCode,
        "twitter": twitter,
        "country_id": countryId,
        "national_team": nationalTeam,
        "founded": founded,
        "logo_path": logoPath,
        "venue_id": venueId,
        "current_season_id": currentSeasonId,
        "is_placeholder": isPlaceholder,
      };
}

class Referee {
  Referee({
    this.data,
  });

  final RefereeData? data;

  factory Referee.fromRawJson(String str) => Referee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Referee.fromJson(Map<String, dynamic> json) => Referee(
        data: RefereeData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class RefereeData {
  RefereeData({
    this.id,
    this.commonName,
    this.fullname,
    this.firstname,
    this.lastname,
  });

  final int? id;
  final String? commonName;
  final String? fullname;
  final String? firstname;
  final String? lastname;

  factory RefereeData.fromRawJson(String str) =>
      RefereeData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RefereeData.fromJson(Map<String, dynamic> json) => RefereeData(
        id: json["id"],
        commonName: json["common_name"],
        fullname: json["fullname"],
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "common_name": commonName,
        "fullname": fullname,
        "firstname": firstname,
        "lastname": lastname,
      };
}

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
        "starting_at": startingAt?.toJson(),
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

class Tvstations {
  Tvstations({
    this.data,
  });

  final List<TvstationsDatum>? data;

  factory Tvstations.fromRawJson(String str) =>
      Tvstations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tvstations.fromJson(Map<String, dynamic> json) => Tvstations(
        data: List<TvstationsDatum>.from(
            json["data"].map((x) => TvstationsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TvstationsDatum {
  TvstationsDatum({
    this.fixtureId,
    this.tvstation,
  });

  final int? fixtureId;
  final String? tvstation;

  factory TvstationsDatum.fromRawJson(String str) =>
      TvstationsDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TvstationsDatum.fromJson(Map<String, dynamic> json) =>
      TvstationsDatum(
        fixtureId: json["fixture_id"],
        tvstation: json["tvstation"],
      );

  Map<String, dynamic> toJson() => {
        "fixture_id": fixtureId,
        "tvstation": tvstation,
      };
}

class Venue {
  Venue({
    this.data,
  });

  final VenueData? data;

  factory Venue.fromRawJson(String str) => Venue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        data: VenueData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class VenueData {
  VenueData({
    this.id,
    this.name,
    this.surface,
    this.address,
    this.city,
    this.capacity,
    this.imagePath,
    this.coordinates,
  });

  final int? id;
  final String? name;
  final String? surface;
  final String? address;
  final String? city;
  final int? capacity;
  final String? imagePath;
  final String? coordinates;

  factory VenueData.fromRawJson(String str) =>
      VenueData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VenueData.fromJson(Map<String, dynamic> json) => VenueData(
        id: json["id"],
        name: json["name"],
        surface: json["surface"],
        address: json["address"],
        city: json["city"],
        capacity: json["capacity"],
        imagePath: json["image_path"],
        coordinates: json["coordinates"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surface": surface,
        "address": address,
        "city": city,
        "capacity": capacity,
        "image_path": imagePath,
        "coordinates": coordinates,
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
        data: json["data"] == null
            ? null
            : List<LineupDatum>.from(
                json["data"].map((x) => LineupDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
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
    this.stats,
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
  final Stats? stats;

  factory LineupDatum.fromRawJson(String str) =>
      LineupDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineupDatum.fromJson(Map<String, dynamic> json) => LineupDatum(
        teamId: json["team_id"],
        fixtureId: json["fixture_id"],
        playerId: json["player_id"],
        playerName: json["player_name"],
        number: json["number"],
        position: json["position"] == null
            ? null
            : positionValues.map[json["position"]],
        additionalPosition: json["additional_position"],
        formationPosition: json["formation_position"],
        posx: json["posx"],
        posy: json["posy"],
        captain: json["captain"],
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "fixture_id": fixtureId,
        "player_id": playerId,
        "player_name": playerName,
        "number": number,
        "position": position == null ? null : positionValues.reverse[position],
        "additional_position": additionalPosition,
        "formation_position": formationPosition,
        "posx": posx,
        "posy": posy,
        "captain": captain,
        "stats": stats == null ? null : stats?.toJson(),
      };
}

enum Position { G, D, M, A }

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
        shots: json["shots"] == null ? null : Shots.fromJson(json["shots"]),
        goals: json["goals"] == null ? null : Goals.fromJson(json["goals"]),
        fouls: json["fouls"] == null ? null : Fouls.fromJson(json["fouls"]),
        cards: json["cards"] == null ? null : Cards.fromJson(json["cards"]),
        passing:
            json["passing"] == null ? null : Passing.fromJson(json["passing"]),
        dribbles: json["dribbles"] == null
            ? null
            : Dribbles.fromJson(json["dribbles"]),
        duels: json["duels"] == null ? null : Duels.fromJson(json["duels"]),
        other: json["other"] == null
            ? null
            : Map.from(json["other"])
                .map((k, v) => MapEntry<String, int>(k, v)),
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "shots": shots?.toJson(),
        "goals": goals?.toJson(),
        "fouls": fouls?.toJson(),
        "cards": cards?.toJson(),
        "passing": passing?.toJson(),
        "dribbles": dribbles?.toJson(),
        "duels": duels?.toJson(),
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
    this.teamConceded,
  });

  final int? scored;
  final int? assists;
  final int? conceded;
  final int? owngoals;
  final int? teamConceded;

  factory Goals.fromRawJson(String str) => Goals.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        scored: json["scored"],
        assists: json["assists"],
        conceded: json["conceded"],
        owngoals: json["owngoals"],
        teamConceded: json["team_conceded"],
      );

  Map<String, dynamic> toJson() => {
        "scored": scored,
        "assists": assists,
        "conceded": conceded,
        "owngoals": owngoals,
        "team_conceded": teamConceded,
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

class Events {
  Events({
    this.data,
  });

  final List<EventsDatum>? data;

  factory Events.fromRawJson(String str) => Events.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        data: json["data"] == null
            ? null
            : List<EventsDatum>.from(
                json["data"].map((x) => EventsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EventsDatum {
  EventsDatum({
    this.id,
    this.teamId,
    this.type,
    this.varResult,
    this.fixtureId,
    this.playerId,
    this.playerName,
    this.relatedPlayerId,
    this.relatedPlayerName,
    this.minute,
    this.extraMinute,
    this.reason,
    this.injuried,
    this.result,
    this.onPitch,
  });

  final int? id;
  final String? teamId;
  final PurpleType? type;
  final String? varResult;
  final int? fixtureId;
  final int? playerId;
  final String? playerName;
  final int? relatedPlayerId;
  final String? relatedPlayerName;
  final int? minute;
  final int? extraMinute;
  final String? reason;
  final bool? injuried;
  final String? result;
  final bool? onPitch;

  factory EventsDatum.fromRawJson(String str) =>
      EventsDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventsDatum.fromJson(Map<String, dynamic> json) => EventsDatum(
        id: json["id"],
        teamId: json["team_id"],
        type: json["type"] == null ? null : purpleTypeValues.map[json["type"]],
        varResult: json["var_result"],
        fixtureId: json["fixture_id"],
        playerId: json["player_id"],
        playerName: json["player_name"],
        relatedPlayerId: json["related_player_id"],
        relatedPlayerName: json["related_player_name"],
        minute: json["minute"],
        extraMinute: json["extra_minute"],
        reason: json["reason"],
        injuried: json["injuried"],
        result: json["result"],
        onPitch: json["on_pitch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_id": teamId,
        "type": type == null ? null : purpleTypeValues.reverse[type],
        "var_result": varResult,
        "fixture_id": fixtureId,
        "player_id": playerId,
        "player_name": playerName,
        "related_player_id": relatedPlayerId,
        "related_player_name": relatedPlayerName,
        "minute": minute,
        "extra_minute": extraMinute,
        "reason": reason,
        "injuried": injuried,
        "result": result,
        "on_pitch": onPitch,
      };
}

enum PurpleType {
  SUBSTITUTION,
  YELLOWCARD,
  VAR,
  GOAL,
  REDCARD,
  PENALTY,
  OWN_GOAL,
  YELLOWRED
}

final purpleTypeValues = EnumValues({
  "goal": PurpleType.GOAL,
  "own-goal": PurpleType.OWN_GOAL,
  "penalty": PurpleType.PENALTY,
  "redcard": PurpleType.REDCARD,
  "substitution": PurpleType.SUBSTITUTION,
  "var": PurpleType.VAR,
  "yellowcard": PurpleType.YELLOWCARD,
  "yellowred": PurpleType.YELLOWRED
});

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
        "temperature": temperature?.toJson(),
        "temperature_celcius": temperatureCelcius?.toJson(),
        "clouds": clouds,
        "humidity": humidity,
        "pressure": pressure,
        "wind": wind?.toJson(),
        "coordinates": coordinates?.toJson(),
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
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

class FixtureStats {
  FixtureStats({
    this.data,
  });

  final List<StatsDatum>? data;

  factory FixtureStats.fromRawJson(String str) =>
      FixtureStats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FixtureStats.fromJson(Map<String, dynamic> json) => FixtureStats(
        data: json["data"] == null
            ? null
            : List<StatsDatum>.from(
                json["data"].map((x) => StatsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StatsDatum {
  StatsDatum({
    this.teamId,
    this.fixtureId,
    this.shots,
    this.passes,
    this.attacks,
    this.fouls,
    this.corners,
    this.offsides,
    this.possessiontime,
    this.yellowcards,
    this.redcards,
    this.yellowredcards,
    this.saves,
    this.substitutions,
    this.goalKick,
    this.goalAttempts,
    this.freeKick,
    this.throwIn,
    this.ballSafe,
    this.goals,
    this.penalties,
    this.injuries,
    this.tackles,
  });

  final int? teamId;
  final int? fixtureId;
  final DatumShots? shots;
  final Passes? passes;
  final Attacks? attacks;
  final int? fouls;
  final int? corners;
  final int? offsides;
  final int? possessiontime;
  final int? yellowcards;
  final int? redcards;
  final int? yellowredcards;
  final int? saves;
  final int? substitutions;
  final dynamic? goalKick;
  final int? goalAttempts;
  final dynamic? freeKick;
  final dynamic? throwIn;
  final int? ballSafe;
  final int? goals;
  final int? penalties;
  final int? injuries;
  final int? tackles;

  factory StatsDatum.fromRawJson(String str) =>
      StatsDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatsDatum.fromJson(Map<String, dynamic> json) => StatsDatum(
        teamId: json["team_id"],
        fixtureId: json["fixture_id"],
        shots:
            json["shots"] == null ? null : DatumShots.fromJson(json["shots"]),
        passes: json["passes"] == null ? null : Passes.fromJson(json["passes"]),
        attacks:
            json["attacks"] == null ? null : Attacks.fromJson(json["attacks"]),
        fouls: json["fouls"],
        corners: json["corners"],
        offsides: json["offsides"],
        possessiontime: json["possessiontime"],
        yellowcards: json["yellowcards"],
        redcards: json["redcards"],
        yellowredcards: json["yellowredcards"],
        saves: json["saves"],
        substitutions: json["substitutions"],
        goalKick: json["goal_kick"],
        goalAttempts: json["goal_attempts"],
        freeKick: json["free_kick"],
        throwIn: json["throw_in"],
        ballSafe: json["ball_safe"],
        goals: json["goals"],
        penalties: json["penalties"],
        injuries: json["injuries"],
        tackles: json["tackles"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "fixture_id": fixtureId,
        "shots": shots == null ? null : shots?.toJson(),
        "passes": passes == null ? null : passes?.toJson(),
        "attacks": attacks == null ? null : attacks?.toJson(),
        "fouls": fouls,
        "corners": corners,
        "offsides": offsides,
        "possessiontime": possessiontime,
        "yellowcards": yellowcards,
        "redcards": redcards,
        "yellowredcards": yellowredcards,
        "saves": saves,
        "substitutions": substitutions,
        "goal_kick": goalKick,
        "goal_attempts": goalAttempts,
        "free_kick": freeKick,
        "throw_in": throwIn,
        "ball_safe": ballSafe,
        "goals": goals,
        "penalties": penalties,
        "injuries": injuries,
        "tackles": tackles,
      };
}

class Attacks {
  Attacks({
    this.attacks,
    this.dangerousAttacks,
  });

  final int? attacks;
  final int? dangerousAttacks;

  factory Attacks.fromRawJson(String str) => Attacks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attacks.fromJson(Map<String, dynamic> json) => Attacks(
        attacks: json["attacks"],
        dangerousAttacks: json["dangerous_attacks"],
      );

  Map<String, dynamic> toJson() => {
        "attacks": attacks,
        "dangerous_attacks": dangerousAttacks,
      };
}

class Passes {
  Passes({
    this.total,
    this.accurate,
    this.percentage,
  });

  final int? total;
  final int? accurate;
  final double? percentage;

  factory Passes.fromRawJson(String str) => Passes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
        total: json["total"],
        accurate: json["accurate"],
        percentage: json["percentage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "accurate": accurate,
        "percentage": percentage,
      };
}

class DatumShots {
  DatumShots({
    this.total,
    this.ongoal,
    this.blocked,
    this.offgoal,
    this.insidebox,
    this.outsidebox,
  });

  final int? total;
  final int? ongoal;
  final int? blocked;
  final int? offgoal;
  final int? insidebox;
  final int? outsidebox;

  factory DatumShots.fromRawJson(String str) =>
      DatumShots.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumShots.fromJson(Map<String, dynamic> json) => DatumShots(
        total: json["total"],
        ongoal: json["ongoal"],
        blocked: json["blocked"],
        offgoal: json["offgoal"],
        insidebox: json["insidebox"],
        outsidebox: json["outsidebox"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "ongoal": ongoal,
        "blocked": blocked,
        "offgoal": offgoal,
        "insidebox": insidebox,
        "outsidebox": outsidebox,
      };
}

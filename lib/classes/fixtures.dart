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
        "fixture": fixture!.toJson(),
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
        // colors: APIColors.fromJson(json["colors"]),
        deleted: json["deleted"],
        isPlaceholder: json["is_placeholder"],
        localTeam: TeamClass.fromJson(json["localTeam"]),
        visitorTeam: TeamClass.fromJson(json["visitorTeam"]),
        tvstations: Tvstations.fromJson(json["tvstations"]),
        league: League.fromJson(json["league"]),
        // referee: Referee.fromJson(json["referee"]) ,
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
        "formations": formations!.toJson(),
        "scores": scores!.toJson(),
        "time": time!.toJson(),
        "coaches": coaches!.toJson(),
        "standings": standings!.toJson(),
        "assistants": assistants!.toJson(),
        "leg": leg,
        "colors": colors!.toJson(),
        "deleted": deleted,
        "is_placeholder": isPlaceholder,
        "localTeam": localTeam!.toJson(),
        "visitorTeam": visitorTeam!.toJson(),
        "tvstations": tvstations!.toJson(),
        "league": league!.toJson(),
        "referee": referee!.toJson(),
        "venue": venue!.toJson(),
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
        "data": data!.toJson(),
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
        "coverage": coverage!.toJson(),
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
        "data": data!.toJson(),
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
        "data": data!.toJson(),
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
        "data": data!.toJson(),
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

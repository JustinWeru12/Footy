import 'dart:convert';

class Team {
  Team({
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

  factory Team.fromRawJson(String str) => Team.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Team.fromJson(Map<String, dynamic> json) => Team(
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
      };
}

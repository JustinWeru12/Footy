class UserData {
  final String? userId;
  final String? fullNames;
  final String? email;
  final String? phone;
  final String? picture;
  final String? region;
  final DateTime? lastseen, created;
  final bool? notify, liveOnly, regionOnly;
  final List<dynamic>? savedFixture,
      favTeams,
      favLeagues,
      favTeamIds,
      favLeagueIds;

  UserData({
    this.userId,
    this.fullNames,
    this.email,
    this.phone,
    this.picture,
    this.region,
    this.lastseen,
    this.created,
    this.notify,
    this.liveOnly,
    this.regionOnly,
    this.savedFixture,
    this.favTeams,
    this.favLeagues,
    this.favTeamIds,
    this.favLeagueIds,
  });

  Map<String, dynamic> getDataMap() {
    return {
      "userId": userId,
      "fullNames": fullNames,
      "email": email,
      "phone": phone,
      "picture": picture,
      "region": region ?? "Not Specified",
      "lastseen": lastseen,
      "created": created,
      "notify": notify ?? false,
      "liveOnly": liveOnly ?? false,
      "regionOnly": regionOnly ?? false,
      "savedFixture": savedFixture ?? [],
      "favTeams": favTeams ?? [],
      "favLeagues": favLeagues ?? [],
      "favTeamIds": favTeamIds ?? [],
      "favLeagueIds": favLeagueIds ?? [],
    };
  }
}

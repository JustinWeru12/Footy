import 'dart:convert';

import 'package:football/classes/fixtures.dart';
import 'package:football/classes/leagues.dart';
import 'package:football/classes/stations.dart';
import 'package:http/http.dart' as http;

class CrudMethods {
  final queryParameters = {
    'api_token': 'V2zPBA4K0u0WTgA9cho3wcXO33cQoLzj1PfF6pC2PaoXqyMkl9bxacZOB0Sd',
  };
  Future<LeagueList> getLeagues() async {
    http.Response response = await http.get(
      Uri.https('soccer.sportmonks.com', '/api/v2.0/leagues', queryParameters),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return LeagueList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }

  Future<Fixture> getFixturebyID(String id) async {
    final queryParam = {
      'api_token':
          'V2zPBA4K0u0WTgA9cho3wcXO33cQoLzj1PfF6pC2PaoXqyMkl9bxacZOB0Sd',
      'include': 'localTeam,visitorTeam,tvstations,referee,venue,league,news'
    };
    http.Response response = await http.get(
      Uri.https('soccer.sportmonks.com', '/api/v2.0/fixtures/$id', queryParam),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return Fixture.fromJson(parsedJson["data"]);
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }

  Future<FixtureList> getFixturebyDate(String date) async {
    final queryParam = {
      'api_token':
          'V2zPBA4K0u0WTgA9cho3wcXO33cQoLzj1PfF6pC2PaoXqyMkl9bxacZOB0Sd',
      'include': 'localTeam,visitorTeam,tvstations,referee,venue,league,news'
    };
    http.Response response = await http.get(
      Uri.https(
          'soccer.sportmonks.com', '/api/v2.0/fixtures/date/$date', queryParam),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return FixtureList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }

  Future<FixtureList> getFixturebyDateRange(String sDate, String eDate) async {
    final queryParam = {
      'api_token':
          'V2zPBA4K0u0WTgA9cho3wcXO33cQoLzj1PfF6pC2PaoXqyMkl9bxacZOB0Sd',
      'include': 'localTeam,visitorTeam,tvstations,referee,venue,league,news'
    };
    http.Response response = await http.get(
      Uri.https('soccer.sportmonks.com',
          '/api/v2.0/fixtures/between/$sDate/$eDate', queryParam),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return FixtureList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }

  Future<StationList> getTVbyFixtureID(String id) async {
    http.Response response = await http.get(
      Uri.https('soccer.sportmonks.com', '/api/v2.0/tvstations/fixture/$id',
          queryParameters),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return StationList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }
}

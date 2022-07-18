import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:football/classes/fixtures.dart';
import 'package:football/classes/head2head.dart';
import 'package:football/classes/leagues.dart';
import 'package:football/classes/standings.dart' as st;
import 'package:http/http.dart' as http;

class CrudMethods {
  Future<LeagueList> getLeagues() async {
    final queryParameters = {
      'api_token':
          'uleeXmO0GlcNf2Q00H1thSxW3ecN48ne5wwnfkVJOrutzK7t1gsRkiICkg2A',
      'include': 'country,season'
    };
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
          'uleeXmO0GlcNf2Q00H1thSxW3ecN48ne5wwnfkVJOrutzK7t1gsRkiICkg2A',
      'include':
          'localTeam,visitorTeam,tvstations,referee,venue,league,lineup,events,stats'
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
          'uleeXmO0GlcNf2Q00H1thSxW3ecN48ne5wwnfkVJOrutzK7t1gsRkiICkg2A',
      'include':
          'localTeam,visitorTeam,tvstations,referee,venue,league,lineup,events,stats'
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
      return FixtureList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }

  Future<st.Standings> getStandingsbySeasonID(String id) async {
    final queryParam = {
      'api_token':
          'uleeXmO0GlcNf2Q00H1thSxW3ecN48ne5wwnfkVJOrutzK7t1gsRkiICkg2A',
    };
    http.Response response = await http.get(
      Uri.https('soccer.sportmonks.com', '/api/v2.0/standings/season/$id',
          queryParam),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return st.Standings.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }

  Future<FixtureList> getFixturebyDateRange(String sDate, String eDate) async {
    final queryParam = {
      'api_token':
          'uleeXmO0GlcNf2Q00H1thSxW3ecN48ne5wwnfkVJOrutzK7t1gsRkiICkg2A',
      'include':
          'localTeam,visitorTeam,tvstations,referee,venue,league,lineup,events,stats'
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
      return FixtureList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }

  Future<Head2Head> getHead2Head(String team1, String team2) async {
    final queryParam = {
      'api_token':
          'uleeXmO0GlcNf2Q00H1thSxW3ecN48ne5wwnfkVJOrutzK7t1gsRkiICkg2A',
    };
    http.Response response = await http.get(
      Uri.https('soccer.sportmonks.com', '/api/v2.0/head2head/$team1/$team2',
          queryParam),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Head2Head.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error while fetching data: ${response.body}");
    }
  }

  //FIRESTORE CRUD OPERATIONS//

  createOrUpdateUserData(Map<String, dynamic> userDataMap) async {
    User user = FirebaseAuth.instance.currentUser!;
    DocumentReference ref =
        FirebaseFirestore.instance.collection('user').doc(user.uid);
    return ref.set(userDataMap, SetOptions(merge: true));
  }

  createOrUpdateUserDataWithID(
      String id, Map<String, dynamic> userDataMap) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection('user').doc(id);
    return ref.set(userDataMap, SetOptions(merge: true));
  }

  Future<bool> checkExist(String docID) async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(docID)
          .get()
          .then((doc) {
        if (doc.exists) {
          exists = true;
        } else {
          exists = false;
        }
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  getDataFromUserFromDocument() async {
    User user = FirebaseAuth.instance.currentUser!;
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .get();
  }
}

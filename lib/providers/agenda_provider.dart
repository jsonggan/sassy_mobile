import 'package:flutter/material.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/sevices/api.dart';

class AgendaProvider with ChangeNotifier {
  Map<String, dynamic> mapAgenda = {};
  bool error = false;
  bool getAgendaIsDone = false;
  String date = '';
  String track = '';
  int itemCount = 0;
  List listOfCategory = [];
  List listOfSessionName = [];
  List listOfSessionLocation = [];
  List listOfSessionDescription = [];
  List listOfTimeStart = [];
  List listOfIsPackageBookable = [];
  List listOfSessionId = [];
  List listOfFirstLastSessionId = [];
  List listOfPackageId = [];
  List listOfTimeStartForBody = [];
  List listOfTimeEndForBody = [];

  List listOfSesisonSpeaker = [];
  List listOfSpeakerDescription = [];

  late ApiService apiService;
  late AuthProvider authProvider;

  AgendaProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    // this.apiService = ApiService(authProvider.token);
    this.apiService = ApiService(
        authProvider.token, authProvider.id.toString(), authProvider.eventCode);
  }

  Future<void> fetchAgendaData(String date, int trackNumber) async {
    print('go into agenda provider fetchAgendaData');
    mapAgenda = await apiService.fetchAgendaData(date, trackNumber);
    listOfCategory.clear();
    listOfSessionName.clear();
    listOfSessionLocation.clear();
    listOfSessionDescription.clear();
    listOfTimeStart.clear();
    listOfIsPackageBookable.clear();
    listOfSessionId.clear();
    listOfPackageId.clear();
    listOfTimeEndForBody.clear();
    listOfTimeStartForBody.clear();

    listOfSesisonSpeaker.clear();
    listOfSpeakerDescription.clear();
    itemCount = 0;
    print('COME BACK TO LOOP');
    if (mapAgenda['message'].toString() ==
        'Successfully retrieved list of agenda!') {
      //get category
      //correct
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfCategory.add(mapAgenda['results'][i]['category']);
      }
      print(listOfCategory);

      //get session name
      //correct
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfSessionName.add(mapAgenda['results'][i]['description']);
      }

      //get session location
      //correct
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfSessionLocation
            .add(mapAgenda['results'][i]['session_items'][0]['location']);
      }

      //get session description
      //correct
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfSessionDescription.add([]);
        for (var m = 0;
            m < mapAgenda['results'][i]['session_items'].length;
            m++) {
          listOfSessionDescription[i]
              .add(mapAgenda['results'][i]['session_items'][m]['description']);
        }
      }
      //time start for header
      //correct
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfTimeStart
            .add(mapAgenda['results'][i]['session_items'][0]['time_start']);
      }

      //time start for body
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfTimeStartForBody.add([]);
        for (var m = 0;
            m < mapAgenda['results'][i]['session_items'].length;
            m++) {
          listOfTimeStartForBody[i]
              .add(mapAgenda['results'][i]['session_items'][m]['time_start']);
        }
      }

      //time end for body
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfTimeEndForBody.add([]);
        for (var m = 0;
            m < mapAgenda['results'][i]['session_items'].length;
            m++) {
          listOfTimeEndForBody[i]
              .add(mapAgenda['results'][i]['session_items'][m]['time_end']);
        }
      }

      //get session speaker
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        for (var m = 0;
            m < mapAgenda['results'][i]['session_items'].length;
            m++) {
          listOfSesisonSpeaker
              .add(mapAgenda['results'][i]['session_items'][m]['speaker_name']);
        }
      }

      //get Speaker description
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        for (var m = 0;
            m < mapAgenda['results'][i]['session_items'].length;
            m++) {
          print('FIRST');
          listOfSpeakerDescription.add(mapAgenda['results'][i]['session_items']
              [m]['speaker_description']);
        }
      }

      //get isBookable
      //correct
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfIsPackageBookable
            .add(mapAgenda['results'][i]['is_package_bookable']);
      }

      //get sessions id
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        listOfSessionId.add([]);
        for (var m = 0;
            m < mapAgenda['results'][i]['session_items'].length;
            m++) {
          listOfSessionId[i].add(mapAgenda['results'][i]['sessions_id'][m]);
        }
      }

      //get package id
      for (var i = 0; i < mapAgenda['results'].length; i++) {
        for (var m = 0;
            m < mapAgenda['results'][i]['session_items'].length;
            m++) {
          listOfPackageId.add(mapAgenda['results'][i]['package_id']);
        }
      }
      // print(listOfCategory);
      // print(listOfSesisonSpeaker);
      // print(listOfSessionDescription);
      // print(listOfSessionLocation);
      // print(listOfSpeakerDescription);

      //get item count
      // for (var i = 0; i < mapAgenda['results'].length; i++) {
      //   itemCount += mapAgenda['results'][i]['session_items'].length as int;
      // }
      // print(itemCount);
    }

    notifyListeners();
  }

  void firstLastSessionId(int sessionId) {
    listOfFirstLastSessionId.clear();
    for (var i = 0; i < mapAgenda['results'].length; i++) {
      for (var m = 0;
          m < mapAgenda['results'][i]['session_items'].length;
          m++) {
        if (sessionId == mapAgenda['results'][i]['sessions_id'][m]) {
          listOfFirstLastSessionId = [
            mapAgenda['results'][i]['sessions_id'][0],
            mapAgenda['results'][i]['sessions_id']
                [mapAgenda['results'][i]['sessions_id'].length - 1]
          ];
          print(listOfFirstLastSessionId);
          print('CHECK THIS SESSION ID');
        }
      }
      ;
    }
  }

  Future<void> dateSelector(String date) async {
    this.date = date;
    print(this.date);
    notifyListeners();
  }

  Future<void> trackSelector(String track) async {
    this.track = track;
    print(this.track);
    notifyListeners();
  }

  void initial() {
    getAgendaIsDone = false;
  }
}

import 'package:flutter/material.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/sevices/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpeakersProvider with ChangeNotifier {
  Map<String, dynamic> mapSpeakers = {};
  Map<String, dynamic> mapSpeaker = {};
  List listOfSpeakerDescription = [];
  List listOfSpeakerLocation = [];
  bool error = false;
  bool getSpeakerIsDone = false;
  bool getSpeakersIsDone = false;
  bool getSpeakersIsDoneForFirstTime = false;
  bool speakersToActualPage = false;
  bool getSpeakerDescriptionIsDone = false;

  late ApiService apiService;
  late AuthProvider authProvider;

  SpeakersProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    print('here is token');
    print(authProvider.token);
    // this.apiService = ApiService(authProvider.token);
    this.apiService = ApiService(
        authProvider.token, authProvider.id.toString(), authProvider.eventCode);
  }

  Future<void> getSpeakers() async {
    print('go into get Speakers provider getSpeakers');

    mapSpeakers = await apiService.getSpeakers();

    if (mapSpeakers['message'] != "Unauthenticated.") {
      if (speakersToActualPage) {
        if (listOfSpeakerDescription.isEmpty) {
          for (var i = 0; i < mapSpeakers['result'].length; i++) {
            // Map<String, dynamic> tempSpeaker =
            //     await getSpeaker(mapSpeakers['result'][i]['id'].toString());
            getSpeakerDescriptionIsDone = true;
            // listOfSpeakerDescription.add(tempSpeaker['result']['description']);
            // listOfSpeakerLocation
            //     .add(tempSpeaker['result']['session_locations'][0]);
          }
        } else {
          for (var i = 0; i < mapSpeakers['result'].length; i++) {
            // Map<String, dynamic> tempSpeaker =
            //     await getSpeaker(mapSpeakers['result'][i]['id'].toString());

            // listOfSpeakerDescription.removeAt(0);
            // listOfSpeakerLocation.removeAt(0);
            getSpeakerDescriptionIsDone = true;
            // listOfSpeakerDescription.add(tempSpeaker['result']['description']);
            // listOfSpeakerLocation
            //     .add(tempSpeaker['result']['session_locations'][0]);
          }
        }
      }
    }

    print('THIS IS AFTER FOR LOOP');
    print(listOfSpeakerDescription);
    print(getSpeakersIsDone);
    getSpeakersIsDoneForFirstTime = true;
    getSpeakersIsDone = true;
    print('PLEASE CHECK THIS GETSPEAKERSISDONE');
    print(getSpeakersIsDone);
    notifyListeners();
  }

  Future<Map<String, dynamic>> getSpeaker(String speakerId) async {
    print('go into get Speakers provider getSpeaker');
    mapSpeaker = await apiService.getSpeaker(speakerId);
    getSpeakerIsDone = true;
    notifyListeners();
    return mapSpeaker;
  }

  void setSpeakersToActualPage() {
    speakersToActualPage = true;
    notifyListeners();
  }

  void initialForSpeaker() {
    getSpeakerIsDone = false;
    notifyListeners();
  }

  void initial() {
    // getSpeakerIsDone = false;
    getSpeakersIsDone = false;
    getSpeakerDescriptionIsDone = false;
  }
}

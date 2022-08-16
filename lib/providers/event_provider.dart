import 'package:flutter/material.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/sevices/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventProvider with ChangeNotifier {
  Map<String, dynamic> mapEvent = {};
  Map<String, dynamic> mapUserRegisteredEvents = {};
  List listOfEventName = [];
  bool error = false;
  bool getEventIsDone = false;
  String errorMsg = '';

  late String eventCode;
  late ApiService apiService;
  late AuthProvider authProvider;
  // String get eventCode => _eventCode;

  EventProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    print('here is token');
    print(authProvider.token);
    this.apiService = ApiService(
        authProvider.token, authProvider.id.toString(), authProvider.eventCode);

    init();
  }

  Future<void> init() async {
    notifyListeners();
  }

  Future<Map<String, dynamic>> getEvent(
      String? eventName, String? eventCode) async {
    print('go into get event provider get Event');
    mapEvent = await apiService.getEvent(eventName, eventCode);

    errorMsg = mapEvent['message'];
    print('check this');
    print(errorMsg);
    getEventIsDone = true;
    notifyListeners();
    return mapEvent;
  }

  Future<Map<String, dynamic>> getUserRegisteredEvents() async {
    print('go into event provider getUserRegisteredEvents');
    mapUserRegisteredEvents = await apiService.getUserRegisteredEvents();
    listOfEventName.clear();
    for (var i = 0; i < mapUserRegisteredEvents['result'].length; i++) {
      listOfEventName.add(mapUserRegisteredEvents['result'][i]['event_name']);
    }
    notifyListeners();
    return mapEvent;
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/sevices/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapProvider with ChangeNotifier {
  Map<String, dynamic> mapMap = {};
  bool error = false;
  bool getMapIsDone = false;

  late ApiService apiService;
  late AuthProvider authProvider;

  MapProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    print('here is token');
    print(authProvider.token);
    // this.apiService = ApiService(authProvider.token);
    this.apiService = ApiService(
        authProvider.token, authProvider.id.toString(), authProvider.eventCode);
  }

  Future<void> getMap() async {
    print('go into get Map provider get Map');
    mapMap = await apiService.getMap();
    print('your mapMap here');
    print(mapMap);
    getMapIsDone = true;
    notifyListeners();
  }
}

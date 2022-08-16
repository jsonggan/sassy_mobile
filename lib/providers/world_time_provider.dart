import 'package:flutter/material.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/sevices/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorldTimeProvider with ChangeNotifier {
  Map<String, dynamic> mapWorldTimeAPI = {};
  bool error = false;

  late ApiService apiService;
  late AuthProvider authProvider;

  WorldTimeProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    print('here is token');
    print(authProvider.token);
    // this.apiService = ApiService(authProvider.token);
    this.apiService = ApiService(
        authProvider.token, authProvider.id.toString(), authProvider.eventCode);
  }

  Future<void> getWorldTimeAPI() async {
    print('go into get WorldTime provider get WorldTime');
    mapWorldTimeAPI = await apiService.worldTimeApi();
    notifyListeners();
  }
}

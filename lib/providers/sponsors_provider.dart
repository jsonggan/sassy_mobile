import 'package:flutter/material.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/sevices/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SponsorsProvider with ChangeNotifier {
  Map<String, dynamic> mapSponsors = {};
  bool error = false;

  late ApiService apiService;
  late AuthProvider authProvider;

  SponsorsProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    print('here is token');
    print(authProvider.token);
    // this.apiService = ApiService(authProvider.token);
    print('CHECK THIS CODE');
    print(authProvider.eventCode);
    this.apiService = ApiService(
        authProvider.token, authProvider.id.toString(), authProvider.eventCode);
  }

  Future<void> getSponsors() async {
    print('go into get Sponsors provider get sponsors');
    mapSponsors = await apiService.getSponsors();
    notifyListeners();
  }
}

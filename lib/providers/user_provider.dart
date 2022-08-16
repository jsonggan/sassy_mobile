import 'package:flutter/material.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/sevices/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  Map<String, dynamic> mapShowParticulars = {};
  bool error = false;
  bool showParticularsIsDone = false;
  bool showParticularsIsDoneForFirstTime = false;
  Map<String, dynamic> mapUpdateParticulars = {};
  Map<String, dynamic> mapRegister = {};
  String emailErrorMsg = '';

  late ApiService apiService;
  late AuthProvider authProvider;
  void emailError(email) async {
    emailErrorMsg = email;
    notifyListeners();
  }

  Future<void> register(
    String title,
    String first_name,
    String last_name,
    String email,
    String hospital_institution,
    String mcr_snb_number,
    String country,
    String profession,
    String dietary_restrictions,
  ) async {
    print('pass through user provider register');
    mapRegister = await apiService.register(
      title,
      first_name,
      last_name,
      email,
      hospital_institution,
      mcr_snb_number,
      country,
      profession,
      dietary_restrictions,
    );
    print('pass through auth provider register 2');

    notifyListeners();
  }

  UserProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    print('here is token');
    print(authProvider.token);
    // this.apiService = ApiService(authProvider.token);
    this.apiService = ApiService(
        authProvider.token, authProvider.id.toString(), authProvider.eventCode);
  }

  Future<void> showParticulars() async {
    print('go into userProvider provider showParticulars');
    mapShowParticulars = await apiService.showParticulars();
    showParticularsIsDone = true;
    showParticularsIsDoneForFirstTime = true;
    notifyListeners();
  }

  Future<void> updateParticulars(
    String title,
    String first_name,
    String last_name,
    String hospital_institution,
    String mcr_snb_number,
    String country,
    String profession,
    String dietary_restrictions,
  ) async {
    print('pass through user provider updateParticulars');
    mapUpdateParticulars = await apiService.updateParticulars(
      title,
      first_name,
      last_name,
      hospital_institution,
      mcr_snb_number,
      country,
      profession,
      dietary_restrictions,
    );
    print('pass through user provider updateParticulars');

    notifyListeners();
  }

  void initial() {
    showParticularsIsDone = false;
  }
}

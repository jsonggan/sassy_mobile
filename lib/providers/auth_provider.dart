import 'package:flutter/material.dart';
import 'package:sassy_mobile/sevices/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;

  Map<String, dynamic> mapSignin1 = {};

  String msgLogin1 = '';

  String email = 'email';

  Map<String, dynamic> mapUserDetail = {};

  Map<String, dynamic> mapResendMFA = {};

  String token = '';
  String id = '';
  String eventCode = '';

  AuthProvider() {
    init();
  }

  Future<void> init() async {
    token = await getToken();
    id = await getId();
    eventCode = await getEventCode();

    if (token.isNotEmpty && eventCode.isNotEmpty && id.isNotEmpty) {
      print('CHECK ME PLS');
      print(token);
      print(eventCode);
      print(id);
      isAuthenticated = true;
    }
    apiService = ApiService(token, id.toString(), eventCode);
    notifyListeners();
  }

  ApiService apiService = ApiService('', '', '');

  Future<void> loginStep1(String email) async {
    mapSignin1 = await apiService.loginStep1(email);
    this.email = email;
    print(this.email);
    msgLogin1 = mapSignin1['message'];
    notifyListeners();
  }

  Future<void> loginStep2(String email, String mfa_code) async {
    print('go into auth provider login step 2');
    mapUserDetail = await apiService.loginStep2(email, mfa_code);

    if (mapUserDetail['message'] == 'Successfully logged in!') {
      token = mapUserDetail['data']['personal_access_token'];
      id = mapUserDetail['data']['id'].toString();
      print('PLEASE CHECK IF GO THROUGH');
      setToken(mapUserDetail['data']['personal_access_token']);
      setId(
        mapUserDetail['data']['id'].toString(),
      );
      print(token);
      print(id);
    }

    notifyListeners();
  }

  Future<void> loginResendMFA(String email) async {
    print('go into auth provider loginResendMFA');
    mapResendMFA = await apiService.loginResendMFA(email);

    notifyListeners();
  }

  Future<void> logOut() async {
    token = '';
    isAuthenticated = false;
    setToken(token);

    notifyListeners();
  }

  Future<void> setToken(token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
  }

  Future<void> setId(id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('id', id);
  }

  Future<String> getId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('id') ?? '';
  }

  Future<void> setEventCode(eventCode) async {
    this.eventCode = eventCode;
    final pref = await SharedPreferences.getInstance();

    pref.setString('EventCode', eventCode);
    print(this.eventCode);
    notifyListeners();
  }

  Future<String> getEventCode() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('EventCode') ?? '';
  }
}

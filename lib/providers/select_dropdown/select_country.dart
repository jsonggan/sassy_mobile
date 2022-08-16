import 'package:flutter/material.dart';

class SelectCountry extends ChangeNotifier {
  String _country = '';
  bool _isSelect = false;
  String errorMsg = 'Please select a country';
  bool boolShowErrorMsg = true;
  bool boolInitialState = true;
  String get country => _country;
  bool get isSelect => _isSelect;

  Future<void> updateCountry(newCountry) async {
    _country = newCountry;
    _isSelect = true;
    boolShowErrorMsg = false;
    notifyListeners();
  }

  Future<void> updateState() async {
    boolInitialState = false;
    notifyListeners();
  }
}

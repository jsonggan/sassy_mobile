import 'package:flutter/material.dart';

class SelectProfession extends ChangeNotifier {
  String _profession = '';
  bool _isSelect = false;
  String errorMsg = 'Please select a profession';
  bool boolShowErrorMsg = true;
  bool boolInitialState = true;
  String get profession => _profession;
  bool get isSelect => _isSelect;

  Future<void> updateprofession(newProfession) async {
    _profession = newProfession;
    _isSelect = true;
    boolShowErrorMsg = false;
    notifyListeners();
  }

  Future<void> updateState() async {
    boolInitialState = false;
    notifyListeners();
  }
}

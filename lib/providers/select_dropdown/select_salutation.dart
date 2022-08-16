import 'package:flutter/material.dart';

class SelectSalutation extends ChangeNotifier {
  String _salutation = 'Mr';
  bool _isSelect = false;
  String errorMsg = 'Please select a salutation';
  bool boolShowErrorMsg = true;
  bool boolInitialState = true;
  String get salutation => _salutation;
  bool get isSelect => _isSelect;

  Future<void> updateSalutation(newSalutation) async {
    _salutation = newSalutation;
    _isSelect = true;
    boolShowErrorMsg = false;
    notifyListeners();
  }

  Future<void> updateState() async {
    boolInitialState = false;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class SelectEventName extends ChangeNotifier {
  String _eventName = '';
  bool _isSelect = false;
  String? get eventName => _eventName;
  bool get isSelect => _isSelect;

  Future<void> updateEventName(eventName) async {
    _eventName = eventName;
    _isSelect = true;
    notifyListeners();
  }
}

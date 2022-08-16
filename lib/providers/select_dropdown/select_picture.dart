import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectPicture extends ChangeNotifier {
  PickedFile? _pickedFile;
  PickedFile? get pickedFile => _pickedFile;

  final _picker = ImagePicker();

  Future<void> pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    notifyListeners();
  }
}

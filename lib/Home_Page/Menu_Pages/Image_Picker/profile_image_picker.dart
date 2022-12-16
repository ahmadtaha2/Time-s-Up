import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

File? _image;
Future _imgPicker(ImageSource src) async {
  try {
    final image = await ImagePicker().pickImage(source: src);
    if (image == null) {
      return;
    }
    File? img = File(image.path);
    _image = img;
  } on PlatformException catch (e) {
    print(e);
  }
}

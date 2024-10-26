import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

 pickImage(ImageSource source) async { // Mark as async, return Future<File?>
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) { // Corrected null check syntax
    return await _file.readAsBytes(); // Convert XFile to File and return
  } else {
    print('No image selected');
    return null; // Return null if no image is selected
  }
}

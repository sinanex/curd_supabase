import 'dart:io';
import 'dart:developer';

import 'package:curd_supabase/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Imageprovider extends ChangeNotifier {
  SupabaseServices services = SupabaseServices();
  File? imageFile;
  List<String> imageList = [];
  ImagePicker _imagePicker = ImagePicker();
  Future<void> pickImage() async {
    final pickFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      imageFile = File(pickFile.path);
      notifyListeners();
    }
  }

  void addImage() async {
    await services.uploadImage(imageFile!);
    log("img added!");
  }

  void getImage() async {
    imageList = await services.getBucketSupabse();
    notifyListeners();
  }
  void delteImage({required String path})async{
    await services.deleteFile(path);
    notifyListeners();
  }
}

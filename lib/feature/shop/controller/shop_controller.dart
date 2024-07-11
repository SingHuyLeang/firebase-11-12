import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ShopController extends GetxController {
  final storage = FirebaseStorage.instance;
  Future<void> uploadImage(File image) async {
    log("image path = ${image.path}");
    try {
      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      log("file name = $fileName");
      await storage.ref(fileName).putFile(image);
      String downloadURL = await storage.ref(fileName).getDownloadURL();
      log('File uploaded. Download URL: $downloadURL');
    } on FirebaseException catch (e) {
      log('Error occurred while uploading the file: $e');
    }
  }
}

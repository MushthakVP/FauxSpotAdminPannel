import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary/cloudinary.dart';

class ImagePickController extends GetxController {
  final cloudinary = Cloudinary.signedConfig(
    apiKey: "656869722812167",
    apiSecret: "o66FBGGMfwYUj4vQRW7wC0DKoiw",
    cloudName: "fouvtycloud",
  );

  String? cloudinary1;
  late Uint8List uImage1;
  bool cimage = false;

  uploadImage1() async {
    cimage = true;
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      log(image.path.toString());
      uImage1 = await image.readAsBytes();
      final response = await cloudinary.upload(
          file: image.path,
          fileBytes: uImage1,
          resourceType: CloudinaryResourceType.image,
          folder: "FauxSpotServer",
          fileName: 'some-name',
          progressCallback: (count, total) {
            log('Uploading image from file with progress: $count/$total');
          });
      if (response.isSuccessful) {
        cloudinary1 = response.secureUrl;
        cimage = false;
      } else {
        cimage = false;
      }
    } else {
      log("No file selected");
    }
    update();
  }

  String? cloudinary2;
  late Uint8List uImage2;
  bool cimage2 = false;

  uploadImage2() async {
    cimage2 = true;
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      log(image.path.toString());
      uImage2 = await image.readAsBytes();
      final response = await cloudinary.upload(
          file: image.path,
          fileBytes: uImage2,
          resourceType: CloudinaryResourceType.image,
          folder: "FauxSpotServer",
          fileName: 'some-name',
          progressCallback: (count, total) {
            log('Uploading image from file with progress: $count/$total');
          });
      if (response.isSuccessful) {
        cloudinary2 = response.secureUrl;
        cimage2 = false;
      } else {
        cimage2 = false;
      }
    } else {
      log("No file selected");
    }
    update();
  }

  String? cloudinary3;
  late Uint8List uImage3;
  bool cimage3 = false;

  uploadImage3() async {
    cimage3 = true;
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      log(image.path.toString());
      uImage3 = await image.readAsBytes();
      final response = await cloudinary.upload(
          file: image.path,
          fileBytes: uImage3,
          resourceType: CloudinaryResourceType.image,
          folder: "FauxSpotServer",
          fileName: 'some-name',
          progressCallback: (count, total) {
            log('Uploading image from file with progress: $count/$total');
          });
      if (response.isSuccessful) {
        cloudinary3 = response.secureUrl;
        cimage3 = false;
      } else {
        cimage3 = false;
      }
    } else {
      log("No file selected");
    }
    update();
  }
}

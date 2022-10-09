import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  RxString image1 = "".obs;
  RxBool isLoading = true.obs;

  RxBool isAvailable = false.obs;

  RxBool parkingUp = false.obs;
  RxBool galleryUp = false.obs;
  RxBool waterUp = false.obs;
  RxBool dressingUp = false.obs;
  RxBool showerUp = false.obs;
  RxBool cafeteriaUp = false.obs;

  RxBool cricket = false.obs;
  RxBool football = false.obs;
  RxBool yoga = false.obs;
  RxBool badminton = false.obs;
  RxBool sevence = false.obs;
  RxBool fives = false.obs;

  TextEditingController turfName = TextEditingController();
  TextEditingController turfLink = TextEditingController();
  TextEditingController morningPrice = TextEditingController();
  TextEditingController eveningPrice = TextEditingController();
  TextEditingController afternoonPrice = TextEditingController();
  TextEditingController turfPlace = TextEditingController();
}

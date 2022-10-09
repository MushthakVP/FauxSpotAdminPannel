import 'package:faux_admin/app/module/desktop/home_view/api/vendor_api.dart';
import 'package:faux_admin/app/module/spalsh_view/view/slashview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../util/colors.dart';
import '../model/vendor_model.dart';

class DesktopController extends GetxController {
  @override
  void onInit() {
    fetchTurf();
    super.onInit();
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("login");
    Get.offAll(SplashView());
  }

  RxList<DataList> turfList = <DataList>[].obs;
  RxBool isLoading = false.obs;
  void fetchTurf() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString("userid");
    Future.delayed(const Duration(seconds: 2));
    VendorModelResp respones =
        await VendorApiService().getTurf(user: user.toString());
    if (respones.error == false) {
      turfList.value = respones.data!;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        respones.message.toString(),
        backgroundColor: darkGreen,
        colorText: white,
        margin: const EdgeInsets.only(
          top: 30,
          left: 50,
          right: 50,
        ),
      );
    }
  }
}

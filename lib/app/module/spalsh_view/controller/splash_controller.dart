import 'dart:async';
import 'dart:developer';
import 'package:faux_admin/app/layout/layoutbuilder.dart';
import 'package:faux_admin/app/module/desktop/home_view/view/home_screen.dart';
import 'package:faux_admin/app/module/login/view/login_view.dart';
import 'package:faux_admin/app/module/mobile/home_screen/view/home_screen.dart';
import 'package:faux_admin/app/module/tablet/home_view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    log("===============");
    changeScreen();
    super.onInit();
  }

  changeScreen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool data = pref.getBool("login") ?? false;
    Timer(const Duration(seconds: 2), () {
      data
          ? Get.off(
              ResponisiveLayout(
                mobileView: HomeScreenMobile(),
                tabView: const HomeScreenTablet(),
                desktopView: HomeScreenDesktop(),
              ),
            )
          : Get.offAll(LoginView());
    });
  }
}

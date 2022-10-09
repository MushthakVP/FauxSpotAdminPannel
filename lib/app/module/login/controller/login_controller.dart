import 'package:faux_admin/app/layout/layoutbuilder.dart';
import 'package:faux_admin/app/module/desktop/home_view/view/home_screen.dart';
import 'package:faux_admin/app/module/mobile/home_screen/view/home_screen.dart';
import 'package:faux_admin/app/module/tablet/home_view/home_screen.dart';
import 'package:faux_admin/app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_service.dart';
import '../model/usermodel_resp.dart';

class LoginController extends GetxController {
  final validatorKey = GlobalKey<FormState>();

  TextEditingController o1 = TextEditingController();
  TextEditingController o2 = TextEditingController();
  TextEditingController o3 = TextEditingController();
  TextEditingController o4 = TextEditingController();
  TextEditingController o5 = TextEditingController();
  TextEditingController o6 = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<UserModelResponse> userInfo = [];

  bool otpChange = true;
  changeOtpPage({required bool index}) {
    otpChange = index;
    update();
  }

  //login vendor

  RxBool loginProgress = false.obs;

  loginUser() async {
    loginProgress.value = true;
    if (validatorKey.currentState!.validate()) {
      String number = numberController.text.trim();

      if (number.length == 10) {
        UserModelResponse? respones =
            await LoginApiService().postMethod(number: number);
        if (respones!.error == false) {
          if (respones.status == true) {
            loginProgress.value = false;
            userInfo.add(respones);
            Get.snackbar(
              "Success",
              "Otp Sent",
              backgroundColor: darkGreen,
              margin: const EdgeInsets.only(
                top: 30,
                left: 50,
                right: 50,
              ),
              colorText: white,
            );
            changeOtpPage(index: false);
          } else {
            loginProgress.value = false;
            Get.snackbar(
              "Error",
              respones.id.toString(),
              backgroundColor: darkGreen,
              margin: const EdgeInsets.only(
                top: 30,
                left: 50,
                right: 50,
              ),
              colorText: white,
            );
          }
        } else {
          loginProgress.value = false;
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
      } else {
        loginProgress.value = false;
        Get.snackbar(
          "Error",
          "Check number",
          backgroundColor: darkGreen,
          margin: const EdgeInsets.only(
            top: 30,
            left: 50,
            right: 50,
          ),
          colorText: white,
        );
      }
    }
  }

  //verify mobile otp

  RxBool otpProgress = false.obs;

  verifyOtp() async {
    otpProgress.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String number = numberController.text.trim();
    final phone = int.tryParse(number);
    final otp = {o1.text + o2.text + o3.text + o4.text + o5.text + o6.text};
    final userOtp = otp.join().toString();

    if (userOtp.length != 6) {
      Get.snackbar(
        "Error",
        "Enter correct otp",
        backgroundColor: darkGreen,
        margin: const EdgeInsets.only(
          top: 30,
          left: 50,
          right: 50,
        ),
        colorText: white,
      );
      otpProgress.value = false;
      return;
    }

    UserOtpVerify data = UserOtpVerify(
        id: userInfo.first.id, userNumber: phone, userOtp: userOtp);

    UserOtpVerifyResp respones =
        await LoginApiService().accountVerify(data: data);

    if (respones.error == false) {
      if (respones.status == true) {
        pref.setBool("login", true);
        pref.setString("userid", userInfo.first.id.toString());
        Get.offAll(
          ResponisiveLayout(
            mobileView: HomeScreenMobile(),
            tabView: const HomeScreenTablet(),
            desktopView: HomeScreenDesktop(),
          ),
        );
        otpChange = true;
        otpProgress.value = false;
      } else {
        Get.snackbar(
          "Error",
          respones.jwt.toString(),
          backgroundColor: darkGreen,
          margin: const EdgeInsets.only(
            top: 30,
            left: 50,
            right: 50,
          ),
          colorText: white,
        );
        otpProgress.value = false;
        customDispose();
      }
    } else {
      otpProgress.value = false;
      Get.snackbar(
        "Error",
        respones.message.toString(),
        backgroundColor: darkGreen,
        margin: const EdgeInsets.only(
          top: 30,
          left: 50,
          right: 50,
        ),
        colorText: white,
      );
    }
  }

  void customDispose() {
    o1.clear();
    o2.clear();
    o3.clear();
    o4.clear();
    o5.clear();
    o6.clear();
    numberController.clear();
  }
}

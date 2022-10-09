import 'package:faux_admin/app/module/login/controller/login_controller.dart';
import 'package:faux_admin/app/util/colors.dart';
import 'package:faux_admin/app/util/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/otpverify_widget.dart';
import 'widgets/privacy_widget.dart';
import 'widgets/textfield_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Row(
        children: [
          Visibility(
            visible: size.width <= 800 ? false : true,
            child: const Expanded(
              child: SizedBox(),
            ),
          ),
          Expanded(
            flex: 2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              child: Container(
                margin: size.width <= 800
                    ? const EdgeInsets.symmetric(vertical: 60, horizontal: 100)
                    : const EdgeInsets.symmetric(vertical: 60),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30.0,
                      offset: const Offset(28, 28),
                      color: grey.withOpacity(.7),
                    ),
                    BoxShadow(
                      blurRadius: 30.0,
                      offset: const Offset(-28, -28),
                      color: grey.withOpacity(.2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (obj) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 4,
                                width: 20,
                                child: Material(
                                  color: obj.otpChange
                                      ? darkGreen
                                      : darkGreen.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              space(),
                              SizedBox(
                                height: 4,
                                width: 20,
                                child: Material(
                                  color: obj.otpChange
                                      ? darkGreen.withOpacity(.4)
                                      : darkGreen,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ],
                          );
                        }),
                    GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (obj) {
                          return Column(
                            children: [
                              Visibility(
                                visible: obj.otpChange ? true : false,
                                child: TextFielWidget(controller: controller),
                              ),
                              Visibility(
                                visible: obj.otpChange ? false : true,
                                child: OtpVerifyWidget(
                                  controller: controller,
                                  size: size,
                                ),
                              ),
                            ],
                          );
                        }),
                    const PrivacyWidget()
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: size.width <= 800 ? false : true,
            child: const Expanded(
              child: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

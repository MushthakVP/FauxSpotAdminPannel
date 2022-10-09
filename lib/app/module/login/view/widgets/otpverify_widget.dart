import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/colors.dart';
import '../../../../util/widgets.dart';
import '../../controller/login_controller.dart';
import 'otpfield_widget.dart';

class OtpVerifyWidget extends StatelessWidget {
  const OtpVerifyWidget({
    Key? key,
    required this.controller,
    required this.size,
  }) : super(key: key);

  final LoginController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: OtpFieldWid(
                controller: controller.o1,
                data: false,
              ),
            ),
            space(width: 20),
            Expanded(
              flex: 1,
              child: OtpFieldWid(
                controller: controller.o2,
                data: false,
              ),
            ),
            space(width: 20),
            Expanded(
              flex: 1,
              child: OtpFieldWid(
                controller: controller.o3,
                data: false,
              ),
            ),
            space(width: 20),
            Expanded(
              flex: 1,
              child: OtpFieldWid(
                controller: controller.o4,
                data: false,
              ),
            ),
            space(width: 20),
            Expanded(
              flex: 1,
              child: OtpFieldWid(
                controller: controller.o5,
                data: false,
              ),
            ),
            space(width: 20),
            Expanded(
              flex: 1,
              child: OtpFieldWid(
                controller: controller.o6,
                data: true,
              ),
            ),
          ],
        ),
        space(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                controller.changeOtpPage(index: true);
              },
              child: Text(
                "Change number?",
                style: gSans(),
              ),
            ),
          ],
        ),
        space(height: 20),
        Obx(
          () => Column(
            children: [
              Visibility(
                visible: controller.otpProgress.value ? false : true,
                child: SizedBox(
                  height: 50,
                  width: size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
                    onPressed: () {
                      controller.verifyOtp();
                    },
                    child: const Text("VERIFY OTP"),
                  ),
                ),
              ),
              Visibility(
                visible: controller.otpProgress.value ? true : false,
                child: SizedBox(
                  height: 50,
                  width: size.width,
                  child: Material(
                    color: grey.withOpacity(.3),
                    child: const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

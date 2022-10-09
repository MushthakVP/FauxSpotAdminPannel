import 'package:faux_admin/app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../../../../util/widgets.dart';
import '../../controller/login_controller.dart';

class TextFielWidget extends StatelessWidget {
  final LoginController controller;
  const TextFielWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What’s your mobile number? ",
          style: gSans(
            size: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        space(height: 30),
        Form(
          key: controller.validatorKey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Phone Number';
              } else if (value.length <= 9) {
                return 'Enter 10 digit number';
              }
              return null;
            },
            controller: controller.numberController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
        space(height: 30),
        Obx(
          () => Column(
            children: [
              Visibility(
                visible: controller.loginProgress.value ? false : true,
                child: SizedBox(
                  height: 50,
                  width: size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
                    onPressed: () {
                      controller.loginUser();
                    },
                    child: const Text("SEND OTP"),
                  ),
                ),
              ),
              Visibility(
                visible: controller.loginProgress.value ? true : false,
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

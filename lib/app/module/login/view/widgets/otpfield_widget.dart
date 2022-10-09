import 'package:flutter/material.dart';
import '../../../../util/colors.dart';
import '../../../../util/widgets.dart';

class OtpFieldWid extends StatelessWidget {
  final bool data;
  final TextEditingController controller;
  const OtpFieldWid({Key? key, required this.controller, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.length == 1 && data == false) {
          FocusScope.of(context).nextFocus();
        } else {
          FocusScope.of(context).previousFocus();
        }
      },
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      maxLength: 1,
      style: gSans(color: balck, fontWeight: FontWeight.w500, size: 30),
      decoration: InputDecoration(
        counterText: "",
        hintText: '*',
        hintStyle: gSans(
            color: balck.withOpacity(.3),
            fontWeight: FontWeight.w500,
            size: 30),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: darkGreen),
        ),
      ),
    );
  }
}

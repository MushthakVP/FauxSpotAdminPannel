import 'package:flutter/material.dart';
import '../../../../util/colors.dart';
import '../../../../util/widgets.dart';

class PrivacyWidget extends StatelessWidget {
  const PrivacyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'By clicking  I agree to ',
                    style: TextStyle(
                      color: darkGreen,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        space(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Privacy Policy, ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkGreen,
                        ),
                      ),
                      TextSpan(
                        text: ' and',
                        style: TextStyle(
                          color: darkGreen,
                        ),
                      ),
                      TextSpan(
                        text: ' Service Agreement',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

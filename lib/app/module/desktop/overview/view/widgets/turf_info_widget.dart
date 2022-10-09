import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../util/colors.dart';
import '../../../../../util/widgets.dart';
import '../../controller/desktop_controller_overview.dart';
import '../../controller/radio_controller.dart';

class TurfInfoWidget extends StatelessWidget {
  const TurfInfoWidget({
    Key? key,
    required this.controller,
    required this.radio,
  }) : super(key: key);

  final DesktopOverviewController controller;
  final RadioController radio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              readOnly: true,
              controller: controller.mapController,
              decoration: const InputDecoration(
                labelText: "Map Link",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 5.0,
                  ),
                ),
              ),
            ),
          ),
          space(width: 20),
          Flexible(
            child: TextField(
              readOnly: true,
              controller: controller.ratingController,
              decoration: const InputDecoration(
                labelText: "Rating",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 5.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => CheckboxListTile(
                activeColor: greenColor,
                title: const Text("Available"),
                value: radio.available.value,
                onChanged: (newValue) {
                  radio.available.value = newValue!;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

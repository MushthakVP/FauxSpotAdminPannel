import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../util/colors.dart';
import '../../../../../util/widgets.dart';
import '../../controller/radio_controller.dart';

class ItemLargeScreenRight extends StatelessWidget {
  const ItemLargeScreenRight({
    Key? key,
    required this.size,
    required this.radio,
  }) : super(key: key);

  final Size size;
  final RadioController radio;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: size.width >= 1000 ? true : false,
      child: Expanded(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(height: 40),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Cricket"),
                  value: radio.cricket.value,
                  onChanged: (newValue) {
                    radio.cricket.value = newValue!;
                  },
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Badminton"),
                  value: radio.badminton.value,
                  onChanged: (newValue) {
                    radio.badminton.value = newValue!;
                  },
                ),
              ),
              space(height: 35),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Sixes"),
                  value: radio.sixse.value,
                  onChanged: (newValue) {
                    radio.sixse.value = newValue!;
                  },
                ),
              ),
              space(height: 40),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Dressing"),
                  value: radio.dressing.value,
                  onChanged: (newValue) {
                    radio.dressing.value = newValue!;
                  },
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Wasroom"),
                  value: radio.washroom.value,
                  onChanged: (newValue) {
                    radio.washroom.value = newValue!;
                  },
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Water"),
                  value: radio.water.value,
                  onChanged: (newValue) {
                    radio.water.value = newValue!;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

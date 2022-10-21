import 'package:faux_admin/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../util/widgets.dart';
import '../../controller/radio_controller.dart';

class ItemsSmallScreen extends StatelessWidget {
  const ItemsSmallScreen({
    Key? key,
    required this.size,
    required this.radio,
  }) : super(key: key);

  final Size size;
  final RadioController radio;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: size.width >= 780 && size.width <= 1000 ? true : false,
      child: Expanded(
        flex: 2,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Text(
                  "Turf Category",
                  style: popins(),
                ),
              ),
              CheckboxListTile(
                activeColor: greenColor,
                title: const Text("Football"),
                value: radio.football.value,
                onChanged: (newValue) {
                  radio.football.value = newValue!;
                },
              ),
              CheckboxListTile(
                activeColor: greenColor,
                title: const Text("Cricket"),
                value: radio.cricket.value,
                onChanged: (newValue) {
                  radio.cricket.value = newValue!;
                },
              ),
              CheckboxListTile(
                activeColor: greenColor,
                title: const Text("Yoga"),
                value: radio.yoga.value,
                onChanged: (newValue) {
                  radio.yoga.value = newValue!;
                },
              ),
              CheckboxListTile(
                activeColor: greenColor,
                title: const Text("Badminton"),
                value: radio.badminton.value,
                onChanged: (newValue) {
                  radio.badminton.value = newValue!;
                },
              ),
              space(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Text(
                  "Turf Type",
                  style: popins(),
                ),
              ),
              CheckboxListTile(
                activeColor: greenColor,
                title: const Text("Sevens"),
                value: radio.sevens.value,
                onChanged: (newValue) {
                  radio.sevens.value = newValue!;
                },
              ),
              CheckboxListTile(
                activeColor: greenColor,
                title: const Text("Sixes"),
                value: radio.sixes.value,
                onChanged: (newValue) {
                  radio.sixes.value = newValue!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

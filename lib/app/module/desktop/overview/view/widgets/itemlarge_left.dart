import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../util/colors.dart';
import '../../../../../util/widgets.dart';
import '../../controller/radio_controller.dart';

class ItemLargeScreenLeft extends StatelessWidget {
  const ItemLargeScreenLeft({
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Text(
                  "Turf Category",
                  style: popins(),
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Football"),
                  value: radio.football.value,
                  onChanged: (newValue) {
                    radio.football.value = newValue!;
                  },
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("YoGa"),
                  value: radio.yoga.value,
                  onChanged: (newValue) {
                    radio.yoga.value = newValue!;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Text(
                  "Turf Type",
                  style: popins(),
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Sevens"),
                  value: radio.sevens.value,
                  onChanged: (newValue) {
                    radio.sevens.value = newValue!;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Text(
                  "Amenities",
                  style: popins(),
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Cafeteria"),
                  value: radio.cafeteria.value,
                  onChanged: (newValue) {
                    radio.cafeteria.value = newValue!;
                  },
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Parking"),
                  value: radio.parking.value,
                  onChanged: (newValue) {
                    radio.parking.value = newValue!;
                  },
                ),
              ),
              Flexible(
                child: CheckboxListTile(
                  activeColor: greenColor,
                  title: const Text("Gallery"),
                  value: radio.gallery.value,
                  onChanged: (newValue) {
                    radio.gallery.value = newValue!;
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

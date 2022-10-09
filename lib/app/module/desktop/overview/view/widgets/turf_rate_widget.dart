import 'package:flutter/material.dart';
import '../../../../../util/widgets.dart';
import '../../controller/desktop_controller_overview.dart';

class TimeLevelWidget extends StatelessWidget {
  const TimeLevelWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DesktopOverviewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller.morningRate,
            decoration: const InputDecoration(
              labelText: "Morning",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
        space(),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller.afternoonRate,
            decoration: const InputDecoration(
              labelText: "Afternoon",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
        space(),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller.eveningRate,
            decoration: const InputDecoration(
              labelText: "Evening",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

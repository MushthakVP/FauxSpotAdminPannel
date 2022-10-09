import 'package:flutter/material.dart';
import '../../../../../util/widgets.dart';
import '../../controller/desktop_controller_overview.dart';

class TurfLevelWidgetInfo extends StatelessWidget {
  const TurfLevelWidgetInfo({
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
            controller: controller.turfName,
            decoration: const InputDecoration(
              labelText: "Turf Name",
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
            readOnly: true,
            controller: controller.turfMuncipality,
            decoration: const InputDecoration(
              labelText: "Turf Muncipality",
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
            readOnly: true,
            controller: controller.turfPlace,
            decoration: const InputDecoration(
              labelText: "Turf Place",
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

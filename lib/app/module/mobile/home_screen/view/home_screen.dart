import 'package:faux_admin/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_mobilecontroller.dart';

class HomeScreenMobile extends StatelessWidget {
  HomeScreenMobile({super.key});
  final controller = Get.put(HomeMobileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGreen,
        centerTitle: true,
        title: const Text("Faux Spot - Vendor"),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}

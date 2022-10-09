import 'package:cached_network_image/cached_network_image.dart';
import 'package:faux_admin/app/module/desktop/home_view/controller/home_desktop_controller.dart';
import 'package:faux_admin/app/module/desktop/overview/view/overview_desktop.dart';
import 'package:faux_admin/app/module/desktop/upload_view/view/update_view.dart';
import 'package:faux_admin/app/util/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/colors.dart';

class HomeScreenDesktop extends StatelessWidget {
  HomeScreenDesktop({super.key});

  final controller = Get.put(DesktopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGreen,
        title: const Text("Home View Desktop"),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.to(UploadView());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.turfList.isEmpty
                ? const Center(
                    child: Text("Add Data"),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: controller.turfList.length,
                    itemBuilder: (context, index) {
                      final turf = controller.turfList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            DesktopOverview(turf: turf),
                            arguments: turf,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(6),
                          width: 180,
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: grey,
                                blurRadius: 15,
                                offset: Offset(0, 10),
                              ),
                            ],
                            color: white,
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      turf.turfImages!.turfImages1.toString(),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              space(),
                              Text(
                                turf.turfName.toString(),
                                style: gSans(
                                  size: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}

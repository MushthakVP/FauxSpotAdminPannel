import 'package:faux_admin/app/module/desktop/home_view/model/vendor_model.dart';
import 'package:faux_admin/app/module/desktop/overview/controller/radio_controller.dart';
import 'package:faux_admin/app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/widgets.dart';
import '../controller/desktop_controller_overview.dart';
import 'widgets/image_view.dart';
import 'widgets/item_small.dart';
import 'widgets/itemlarge_left.dart';
import 'widgets/itemlarge_right.dart';
import 'widgets/turf_info_widget.dart';
import 'widgets/turf_level_info.dart';
import 'widgets/turf_rate_widget.dart';

class DesktopOverview extends StatelessWidget {
  final DataList turf;
  DesktopOverview({super.key, required this.turf});
  final controller = Get.put(DesktopOverviewController());
  final radio = Get.put(RadioController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      radio.badminton.value = turf.turfCategory!.turfBadminton!;
      radio.football.value = turf.turfCategory!.turfFootball!;
      radio.cricket.value = turf.turfCategory!.turfCricket!;
      radio.yoga.value = turf.turfCategory!.turfYoga!;
      radio.sixes.value = turf.turfType!.turfSixes!;
      radio.sevens.value = turf.turfType!.turfSevens!;
      radio.parking.value = turf.turfAmenities!.turfParking!;
      radio.water.value = turf.turfAmenities!.turfWater!;
      radio.cafeteria.value = turf.turfAmenities!.turfCafeteria!;
      radio.washroom.value = turf.turfAmenities!.turfWashroom!;
      radio.dressing.value = turf.turfAmenities!.turfDressing!;
      radio.gallery.value = turf.turfAmenities!.turfGallery!;
      controller.mapController.text = turf.turfInfo!.turfMap!;
      controller.ratingController.text = turf.turfInfo!.turfRating.toString();
      controller.turfName.text = turf.turfName.toString();
      controller.turfPlace.text = turf.turfPlace.toString();
      controller.turfMunicipality.text = turf.turfMunicipality.toString();
      //controller.turfDistrict.text = turf.turfDistrict.toString();
      controller.morningRate.text = turf.turfTime!.timeMorning.toString();
      controller.eveningRate.text = turf.turfTime!.timeEvening.toString();
      controller.afternoonRate.text = turf.turfTime!.timeAfternoon.toString();
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          turf.turfName.toString(),
          style: gSans(color: balck),
        ),
        leading: const BackButton(color: balck),
        backgroundColor: white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.chngeCarousel(
                            path: turf.turfImages!.turfImages1.toString());
                      },
                      child: OverviewSmallImage(
                          image: turf.turfImages!.turfImages1.toString()),
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.chngeCarousel(
                              path: turf.turfImages!.turfImages2.toString());
                        },
                        child: OverviewSmallImage(
                            image: turf.turfImages!.turfImages2.toString())),
                    GestureDetector(
                      onTap: () {
                        controller.chngeCarousel(
                            path: turf.turfImages!.turfImages3.toString());
                      },
                      child: OverviewSmallImage(
                          image: turf.turfImages!.turfImages3.toString()),
                    ),
                  ],
                ),
                Obx(
                  () => Expanded(
                    flex: size.width >= 740 ? 4 : 1,
                    child: OverviewSmallImage(
                      height: 375,
                      image: controller.chnageImage.value.trim().isEmpty
                          ? turf.turfImages!.turfImages1.toString()
                          : controller.chnageImage.value,
                    ),
                  ),
                ),
                ItemsSmallScreen(size: size, radio: radio),
                ItemLargeScreenLeft(size: size, radio: radio),
                ItemLargeScreenRight(size: size, radio: radio),
              ],
            ),
          ),
          TurfInfoWidget(controller: controller, radio: radio),
          TurfLevelWidgetInfo(controller: controller),
          space(height: 15),
          TimeLevelWidget(controller: controller),
          space(),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("CLOSE"),
                  ),
                ),
              ),
              space(),
              Expanded(
                flex: 3,
                child: Obx(
                  () => SizedBox(
                    height: 50,
                    child: controller.isLoading.value
                        ? Material(
                            color: grey.withOpacity(.3),
                            child: const Center(
                              child: CupertinoActivityIndicator(),
                            ))
                        : ElevatedButton(
                            onPressed: () {
                              controller.updateData(turf: turf);
                            },
                            child: const Text("UPDATE"),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

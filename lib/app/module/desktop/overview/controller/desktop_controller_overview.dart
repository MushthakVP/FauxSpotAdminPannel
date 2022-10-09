import 'package:faux_admin/app/module/desktop/overview/api/overview_api.dart';
import 'package:faux_admin/app/module/desktop/overview/controller/radio_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../util/colors.dart';
import '../../home_view/controller/home_desktop_controller.dart';
import '../../home_view/model/vendor_model.dart';

class DesktopOverviewController extends GetxController {
  TextEditingController mapController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController turfName = TextEditingController();
  TextEditingController turfPlace = TextEditingController();
  TextEditingController turfDistrict = TextEditingController();
  TextEditingController turfMuncipality = TextEditingController();
  TextEditingController morningRate = TextEditingController();
  TextEditingController eveningRate = TextEditingController();
  TextEditingController afternoonRate = TextEditingController();
  RadioController radio = Get.put(RadioController());
  DesktopController controller = Get.put(DesktopController());

  RxString chnageImage = "".obs;
  chngeCarousel({required String path}) {
    chnageImage.value = path;
  }

  RxBool isLoading = false.obs;

  updateData({required DataList turf}) async {
    isLoading.value = true;
    VendorModelResp data = VendorModelResp(
      status: true,
      data: [
        DataList(
          turfCreatorId: turf.turfCreatorId,
          turfName: turfName.text,
          turfPlace: turfPlace.text,
          turfMuncipality: turfMuncipality.text,
          id: turf.id,
          turfInfo: TurfInfo(
            turfMap: mapController.text,
            turfRating: double.parse(ratingController.text),
            turfIsAvailale: radio.available.value,
          ),
          turfTime: TurfTime(
            timeMorning: morningRate.text,
            timeAfternoon: afternoonRate.text,
            timeEvening: eveningRate.text,
          ),
          turfCatogery: TurfCatogery(
            turfBadminton: radio.badminton.value,
            turfCricket: radio.cricket.value,
            turfFootball: radio.football.value,
            turfYoga: radio.yoga.value,
          ),
          turfType: TurfType(
            turfSixes: radio.sixse.value,
            turfSevens: radio.sevense.value,
          ),
          turfAmenities: TurfAmenities(
            turfParking: radio.parking.value,
            turfWater: radio.water.value,
            turfCafeteria: radio.cafeteria.value,
            turfWashroom: radio.washroom.value,
            turfDressing: radio.dressing.value,
            turfGallery: radio.gallery.value,
          ),
          turfImages: TurfImages(
            turfImages1: turf.turfImages?.turfImages1,
            turfImages2: turf.turfImages!.turfImages2,
            turfImages3: turf.turfImages?.turfImages3,
          ),
        ),
      ],
    );

    final respones = await OverviewApi().upadateTurf(data: data, id: turf.id!);
    if (respones != null) {
      if (respones["status"] == true) {
        isLoading.value = false;
        controller.fetchTurf();
        Get.snackbar(
          "Success",
          "Updated",
          backgroundColor: darkGreen,
          colorText: white,
          margin: const EdgeInsets.only(
            top: 30,
            left: 50,
            right: 50,
          ),
        );
      } else {
        isLoading.value = false;
        Get.snackbar(
          "Error",
          "Failed",
          backgroundColor: darkGreen,
          colorText: white,
          margin: const EdgeInsets.only(
            top: 30,
            left: 50,
            right: 50,
          ),
        );
      }
    }
  }
}

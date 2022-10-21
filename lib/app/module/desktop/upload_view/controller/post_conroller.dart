import 'dart:math';
import 'package:faux_admin/app/module/desktop/upload_view/api/post_api_service.dart';
import 'package:faux_admin/app/module/desktop/upload_view/model/add_turf_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'district_controller.dart';
import 'image_picker.dart';
import 'upload_controller.dart';

class PostController extends GetxController {
  final button = Get.put(UploadController());
  final images = Get.put(ImagePickController());
  final dropdown = Get.put(DistrictController());

  randomNumberGenerator() {
    var rng = Random();
    int num = 10;
    for (int i = 0; i < 10; i++) {
      num = rng.nextInt(10);
    }
    return num;
  }

  randomRating() {
    var rng = Random();
    int num = 5;
    for (int i = 0; i < 5; i++) {
      num = rng.nextInt(5);
    }
    return num;
  }

  postDAta() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString("userid");
    double ratingGenerate = randomNumberGenerator().toDouble();
    double rtGenerate = randomRating();
    String rating = "0";
    if (rtGenerate < 3) {
      rating = "3.$rtGenerate";
    } else {
      rating = "$rtGenerate.$ratingGenerate";
    }
    AddTurfModel data = AddTurfModel(
      data: [
        DataList(
          turfAmenities: TurfAmenities(
            turfCafeteria: button.cafeteriaUp.value,
            turfDressing: button.dressingUp.value,
            turfGallery: button.galleryUp.value,
            turfParking: button.parkingUp.value,
            turfWater: button.waterUp.value,
            turfWashroom: button.showerUp.value,
          ),
          turfCategory: TurfCategory(
            turfCricket: button.cricket.value,
            turfFootball: button.football.value,
            turfBadminton: button.badminton.value,
            turfYoga: button.yoga.value,
          ),
          turfType: TurfType(
            turfSevens: button.sevence.value,
            turfSixes: button.fives.value,
          ),
          turfInfo: TurfInfo(
            turfIsAvailable: true,
            turfMap: button.turfLink.text,
            turfRating: double.tryParse(rating),
          ),
          turfImages: TurfImages(
            turfImages1: images.cloudinary1,
            turfImages2: images.cloudinary2,
            turfImages3: images.cloudinary3,
          ),
          turfPrice: TurfPrice(
            morningPrice: int.tryParse(button.afternoonPrice.text),
            afternoonPrice: int.tryParse(button.eveningPrice.text),
            eveningPrice: int.tryParse(button.morningPrice.text),
          ),
          turfCreatorId: user,
          turfName: button.turfName.text,
          turfPlace: button.turfPlace.text,
          turfDistrict: dropdown.dropdownValue,
          turfMunicipality: dropdown.mDropdownValue,
          turfLogo: button.turfLogo.text,
          turfTime: TurfTime(
            timeAfternoonEnd: int.tryParse(button.turfAfternoonEnd.text),
            timeAfternoonStart: int.tryParse(button.turfAfternoonStart.text),
            timeEveningEnd: int.tryParse(button.turfEveningEnd.text),
            timeEveningStart: int.tryParse(button.turfEveningStart.text),
            timeMorningEnd: int.tryParse(button.turfMorningEnd.text),
            timeMorningStart: int.tryParse(button.turfMorningStart.text),
          ),
        ),
      ],
    );

    PostApiService().postTurf(data);
  }
}

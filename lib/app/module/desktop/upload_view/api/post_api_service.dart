import 'package:cloudinary/cloudinary.dart';
import 'package:faux_admin/app/util/colors.dart';
import 'package:faux_admin/app/util/endpoints.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import '../model/add_turf_model.dart';

class PostApiService {
  void postTurf(AddTurfModel data) async {
    Response response =
        await Dio().post(EndPoints.addTurf, data: data.toJson());
    try {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        Get.snackbar("Success", "Turf Added Successfully",
            backgroundColor: darkGreen, colorText: white);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong $e",
          colorText: white, backgroundColor: darkGreen);
    }
  }
}

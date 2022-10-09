import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeMobileController extends GetxController {
  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("login");
  }
}

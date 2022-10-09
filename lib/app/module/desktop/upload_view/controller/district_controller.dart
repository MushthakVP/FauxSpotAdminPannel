import 'dart:developer';

import 'package:get/get.dart';

class DistrictController extends GetxController {
  @override
  void onInit() {
    countryDependentDropDown();
    super.onInit();
  }

  Map<String, String> dstrict = {
    "Thiruvananthapuram": "tvm",
    "Kollam": "klm",
    "Pathanamthitta": "pt",
    "Alappuzha": "alp",
    "Kottayam": "ktm",
    "Idukki": "idk",
    "Ernakulam": "ekl",
    "Thrissur": "tsr",
    "Palakkad": "pkd",
    "Malappuram": "mlp",
    "Kozhikode": "kkd",
    "Wayanad": "wyd",
    "Kannur": "knr",
    "Kasaragod": "ksd",
  };

  List<String> dstrictList = [];

  countryDependentDropDown() {
    dstrict.forEach((key, value) {
      dstrictList.add(key);
    });
  }

  String? dropdownValue;

  changeDropName({required var dropdownValue}) {
    this.dropdownValue = dropdownValue;
    update();
  }

  final muncipality = {
    "Attingal": "tvm",
    "Nedumangad": "tvm",
    "Neyyattinkara": "tvm",
    "Varkala": "tvm",
    "Karunagappally": "klm",
    "Kollam": "klm",
    "Kottarakkara": "klm",
    "Paravur": "klm",
    "Punalur": "klm",
    "Peringamala": "pt",
    "Anchakkala": "pt",
    "Vanchipoika": "pt",
    "Alappuzha": "alp",
    "Chengannur": "alp",
    "Cherthala": "alp",
    "Kayamkulam": "alp",
    "Mavelikara": "alp",
    "Harippad": "alp",
    "Kottayam": "ktm",
    "Changanacherry": "ktm",
    "Vaikom": "ktm",
    "Pala": "ktm",
    "Erattupetta": "ktm",
    "Ettumanoor": "ktm",
    "Kattappana": "idk",
    "Thodupuzha": "idk",
    "Thrippunithura": "ekl",
    "Muvattupuzha": "ekl",
    "Kothamanagalam": "ekl",
    "Perumbavoor": "ekl",
    "Aluva": "ekl",
    "Kalamassery": "ekl",
    "North Paravoor": "ekl",
    "Angamaly": "ekl",
    "Eloor": "ekl",
    "Thrikkakara": "ekl",
    "Maradu": "ekl",
    "Piravom": "ekl",
    "Koothattukulam": "ekl",
    "Chalakkudy": "tsr",
    "Chahvakkad": "tsr",
    "Guruvayoor‍": "tsr",
    "Irinjalakkuda": "tsr",
    "Kodungalloor‍": "tsr",
    "Kunnamkulam": "tsr",
    "Wadakkanchery": "tsr",
    "Mannarkkad": "pkd",
    "Cherpulassery": "pkd",
    "Pattambi": "pkd",
    "Shornur": "pkd",
    "Ottappalam": "pkd",
    "Chittur": "pkd",
    "Palakkad": "pkd",
    "Kondotty": "mlp",
    "Kottakkal": "mlp",
    "Malappuram": "mlp",
    "Manjeri": "mlp",
    "Nilambur": "mlp",
    "Parappanangadi": "mlp",
    "Perinthalmanna": "mlp",
    "Ponnani": "mlp",
    "Tirur": "mlp",
    "Tanur": "mlp",
    "Feroke": "kkd",
    "Koduvally": "kkd",
    "Koyilandy": "kkd",
    "Mukkam": "kkd",
    "Payyoli": "kkd",
    "Ramanattukara": "kkd",
    "Vadakara": "kkd",
    "Kalpetta": "wyd",
    "Sulthan Bathery": "wyd",
    "Mananthavady": "wyd",
    "Anthoor": "knr",
    "Iritty": "knr",
    "Koothuparambu": "knr",
    "Mattannur": "knr",
    "Pannoor": "knr",
    "Payyannur": "knr",
    "Sree Kandapuram": "knr",
    "Thalassery": "knr",
    "Thaliparamba": "knr",
    "Kanhangad": "ksd",
    "Kasaragod": "ksd",
    "Nileshwar": "ksd",
  };

  List<String> muncipal = [];

  districtChange(shortCode) {
    muncipal.clear();
    muncipality.forEach((key, value) {
      if (shortCode == value) {
        log(key.toString());
        muncipal.add(key);
      }
    });
    mDropdownValue = muncipal[0];
    update();
  }

  String? mDropdownValue;

  changemDropName({required var mDropdownValue}) {
    this.mDropdownValue = mDropdownValue;
    update();
  }
}

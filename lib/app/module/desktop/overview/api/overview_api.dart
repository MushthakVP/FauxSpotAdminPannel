import 'package:dio/dio.dart';
import 'package:faux_admin/app/module/desktop/home_view/model/vendor_model.dart';
import 'package:faux_admin/app/util/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/colors.dart';

class OverviewApi {
  Future<dynamic> upadateTurf(
      {required VendorModelResp data, required String id}) async {
    try {
      final response = await Dio().patch(
          EndPoints.updateTurf.replaceFirst("{turfid}", id),
          data: data.toJson());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }
    } catch (e) {
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

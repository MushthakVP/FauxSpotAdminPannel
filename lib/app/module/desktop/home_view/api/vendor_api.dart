import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:faux_admin/app/module/desktop/home_view/model/vendor_model.dart';
import 'package:faux_admin/app/util/endpoints.dart';

class VendorApiService {
  Future<VendorModelResp> getTurf({required String user}) async {
    Response response =
        await Dio().get(EndPoints.vendorTurf.replaceFirst('{vendorid}', user));
    try {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        VendorModelResp vendorModelResp =
            VendorModelResp.fromJson(response.data);
        log(vendorModelResp.toString());
        return vendorModelResp;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return VendorModelResp(error: true, message: "Service Error");
      } else if (e.type == DioErrorType.connectTimeout) {
        return VendorModelResp(error: true, message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return VendorModelResp(
            error: true, message: "Unable to connect to the server");
      } else if (e.type == DioErrorType.other) {
        return VendorModelResp(error: true, message: "Something went wrong");
      }
    } catch (e) {
      return VendorModelResp(error: true, message: "Server Down");
    }
    return VendorModelResp(error: true, message: "Something went wrong");
  }
}

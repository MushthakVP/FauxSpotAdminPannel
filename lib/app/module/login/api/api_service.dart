import 'package:dio/dio.dart';
import 'package:faux_admin/app/module/login/model/usermodel_resp.dart';
import 'package:faux_admin/app/util/endpoints.dart';

class LoginApiService {
  Future<UserModelResponse?> postMethod({required String number}) async {
    try {
      Response respones = await Dio()
          .post(EndPoints.webSignupOtp, data: {"user_number": number});
      if (respones.statusCode! >= 200 && respones.statusCode! <= 299) {
        return UserModelResponse.fromJson(respones.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return UserModelResponse(error: true, message: "Service Error");
      } else if (e.type == DioErrorType.connectTimeout) {
        return UserModelResponse(error: true, message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return UserModelResponse(
            error: true, message: "Unable to connect to the server");
      } else if (e.type == DioErrorType.other) {
        return UserModelResponse(error: true, message: "Something went wrong");
      }
    } catch (e) {
      return UserModelResponse(error: true, message: "Server Down");
    }
    return UserModelResponse(error: true, message: "Restart Application");
  }

  //otp verify

  Future<UserOtpVerifyResp> accountVerify({required UserOtpVerify data}) async {
    try {
      Response respones =
          await Dio().post(EndPoints.webOtpverify, data: data.toJson());
      if (respones.statusCode! >= 200 && respones.statusCode! <= 299) {
        return UserOtpVerifyResp.fromJson(respones.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return UserOtpVerifyResp.fromJson(e.response?.data);
      } else if (e.type == DioErrorType.connectTimeout) {
        return UserOtpVerifyResp(error: true, message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return UserOtpVerifyResp(
            error: true, message: "Unable to connect to the server");
      } else if (e.type == DioErrorType.other) {
        return UserOtpVerifyResp(error: true, message: "Something went wrong");
      }
    } catch (e) {
      return UserOtpVerifyResp(error: true, message: "Server Down");
    }
    return UserOtpVerifyResp(error: true, message: "Something went wrong");
  }
}

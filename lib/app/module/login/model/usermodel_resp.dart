class UserModelResponse {
  UserModelResponse({this.status, this.id, this.error = false, this.message});
  bool? error;
  bool? status;
  String? id;
  String? message;

  factory UserModelResponse.fromJson(Map<String, dynamic> json) =>
      UserModelResponse(
        status: json["status"],
        id: json["_id"],
        error: json["error"] ?? false,
      );
}

// verify user

class UserOtpVerify {
  UserOtpVerify({
    this.userOtp,
    this.userNumber,
    this.id,
  });

  String? userOtp;
  int? userNumber;
  String? id;

  Map<String, dynamic> toJson() => {
        "user_otp": userOtp,
        "user_number": userNumber,
        "_id": id,
      };
}

// otp verify respones model

class UserOtpVerifyResp {
  UserOtpVerifyResp({this.status, this.jwt, this.error, this.message});

  bool? error;
  String? message;
  bool? status;
  String? jwt;

  factory UserOtpVerifyResp.fromJson(Map<String, dynamic> json) =>
      UserOtpVerifyResp(
        status: json["status"],
        jwt: json["jwt"],
        error: json["error"] ?? false,
      );
}

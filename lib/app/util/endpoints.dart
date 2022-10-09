class EndPoints {
  static String baseUrl = "https://fauxspot.herokuapp.com/";
  static String webGetUrl = "${baseUrl}user/all-turf";
  static String webSignupOtp = "${baseUrl}account/login-number";
  static String webOtpverify = "${baseUrl}account/verify-number-otp";
  static String vendorTurf = "${baseUrl}user/vendor-turf/{vendorid}";
  static String updateTurf = "${baseUrl}vendor/updateturf/{turfid}";
  static String addTurf = "${baseUrl}vendor/add-product";
}

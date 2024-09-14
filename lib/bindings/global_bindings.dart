import 'package:cfl/controllers/address_controller.dart';
import 'package:cfl/controllers/auth/login_password.dart';
import 'package:cfl/controllers/main_controller.dart';
import 'package:cfl/controllers/kyc/camera_screen_controller.dart';
import 'package:cfl/controllers/kyc/kyc_controller.dart';
import 'package:cfl/controllers/kyc/kyc_details_controller.dart';
import 'package:cfl/controllers/kyc/otp_kyc_controller.dart';
import 'package:cfl/controllers/auth/login_otp_controller.dart';
import 'package:cfl/controllers/nav/home_screen_controller.dart';
import 'package:cfl/controllers/occupation/business_info_controller.dart';
import 'package:cfl/controllers/sign_up_controller.dart';
import 'package:cfl/controllers/splash_screens_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth/login_phone_controller.dart';
import '../controllers/kyc/verify_selfie_controller.dart';
import '../controllers/kyc/video_kyc_controller.dart';
import '../controllers/reference_controller.dart';

class GlobalBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(),fenix: true);
    Get.lazyPut<LoginOTPController>(() => LoginOTPController(),fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(),fenix: true);
    Get.lazyPut<AddressInfoController>(() => AddressInfoController(),fenix: true);
    Get.lazyPut<KYCInfoController>(() => KYCInfoController(),fenix: true);
    Get.lazyPut<OTPKYCController>(() => OTPKYCController(),fenix: true);
    Get.lazyPut<VideoKYCController>(() => VideoKYCController(),fenix: true);
    Get.lazyPut<KYCDetailsController>(() => KYCDetailsController(),fenix: true);
    Get.lazyPut<BusinessInfoController>(() => BusinessInfoController(),fenix: true);
    Get.lazyPut<LoginPhoneController>(() => LoginPhoneController(),fenix: true);
    Get.lazyPut<LoginPasswordController>(() => LoginPasswordController(),fenix: true);
    Get.lazyPut<VerifySelfieController>(() => VerifySelfieController(),fenix: true);
    Get.lazyPut<CameraScreenController>(() => CameraScreenController(),fenix: true);
    Get.lazyPut<MainScreenController>(() => MainScreenController(),fenix: true);
    Get.lazyPut<HomeScreenController>(() => HomeScreenController(),fenix: true);
    Get.lazyPut<ReferenceController>(() => ReferenceController(),fenix: true);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class KYCInfoController extends GetxController {
  var isChecked = false.obs;
  var selectedKYCMode = 'OTP'.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PermissionsController extends GetxController {

  var isSignup = false.obs;
  var isChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      isSignup.value = Get.arguments[0];
    }
  }
}
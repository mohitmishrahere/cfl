import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ConfirmPasswordController extends GetxController {

  final confPassword = TextEditingController();
  var mobile = ''.obs;
  var password = ''.obs;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      mobile.value = Get.arguments[0];
      password.value = Get.arguments[1];
    }
  }
}
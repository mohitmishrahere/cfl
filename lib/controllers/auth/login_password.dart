import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginPasswordController extends GetxController {

  final password = TextEditingController();
  var mobile = ''.obs;
  var loading = false.obs;
  var forgotLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      mobile.value = Get.arguments[0];
    }
  }
}
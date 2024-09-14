import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class RequestLoanPreviewController extends GetxController {


  var isChecked = false.obs;
  var isLoading = false.obs;
  var tenure = ''.obs;
  var amount = 0.obs;
  var bankName = ''.obs;
  var bankId = ''.obs;
  var dueDate = ''.obs;
  var selectedOptions = <String>[].obs;
  var remarks = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments!=null){
      tenure.value = Get.arguments[0];
      amount.value = Get.arguments[1];
      bankName.value = Get.arguments[2];
      bankId.value = Get.arguments[3];
    }
    DateTime currentDate = DateTime.now();
    DateTime newDate = currentDate.add(Duration(days: int.parse(tenure.value)));
    dueDate.value = DateFormat('MMM d, yyyy').format(newDate);
  }

  void toggleOption(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      if (selectedOptions.length < 2) {
        selectedOptions.add(option);
      }
    }
    remarks.value = 'Requesting Loan for ${selectedOptions.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(',', ' and')}';
  }
}

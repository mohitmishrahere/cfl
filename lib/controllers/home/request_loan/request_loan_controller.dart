import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/api_services.dart';

class RequestLoanController extends GetxController {
  var isChecked = false.obs;
  var bankName = ''.obs;
  var accountNumber = ''.obs;
  var noBankFound = false.obs;
  var availableLimit = '0'.obs;
  var totalLimit = '0'.obs;
  TextEditingController amountController = TextEditingController(text: '₹ 500');
  TextEditingController tenureController = TextEditingController(text: '28 Days');
  var selectedAmount = 500.obs;
  var selectedTenure = 28.obs;
  var deductions = 0.obs;
  var cflCashback = 0.obs;
  var interest = 10.0.obs;
  var fAC = 50.0.obs;
  var amountToBeDisbursed = 450.0.obs;
  var tap = 510.0.obs;
  var bankId = ''.obs;

  var isLoading = true.obs;

  List<int> amounts = [];
  List<int> tenure = [28];

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments!=null){
      availableLimit.value = Get.arguments[0];
      totalLimit.value = Get.arguments[1];
    }
    amounts = List<int>.generate(
        int.parse(availableLimit.value) ~/ 500, (index) => (index + 1) * 500);
    fetchBank();
    // 9829288997//Pawan Sharma
  }

  Future<void> fetchBank() async {
    isLoading.value = true;
    var responseAccount = await APIServices.getBankAccount();
    List<dynamic> data = responseAccount['data'];
    print(data.runtimeType);
    if(responseAccount['message'] == 'Bank accounts fetched successfully.' && data.isNotEmpty){
      var data = responseAccount['data'];
      bankName.value = data[0]['bankName'];
      accountNumber.value = data[0]['accountNumber'];
      bankId.value = data[0]['_id'];
      isLoading.value = false;
    }else if(responseAccount['message'] == 'Bank accounts fetched successfully.' && data.isEmpty){
      noBankFound.value = true;
      isLoading.value = false;
    }
  }
}

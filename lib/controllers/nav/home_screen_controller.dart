import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_services.dart';

class HomeScreenController extends GetxController {

  var profilePic = ''.obs;
  var name = ''.obs;
  var isLoading = false.obs;
  var availableLimit = '0'.obs;
  var totalLimit = '0'.obs;


  @override
  void onInit() {
    super.onInit();
    if(Get.arguments!=null){
      name.value = Get.arguments[0];
      profilePic.value = Get.arguments[1];
    }
    fetchLoanLimit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchLoanLimit() async {
    isLoading.value = true;
    var responseAccount = await APIServices.getLoanLimit();
    // List<dynamic> data = responseAccount['data'];
    // print(data.runtimeType);
    if(responseAccount['message'] == 'Loan limits fetched' && responseAccount.isNotEmpty){
      // var data = responseAccount;
      // print(responseAccount['avaliableLimit']);
      availableLimit.value = responseAccount['avaliableLimit'].toString();
      totalLimit.value = responseAccount['totalLimit'].toString();
      isLoading.value = false;
    }else if(responseAccount['message'] == 'Loan limits fetched' && responseAccount.isEmpty){
      // noBankFound.value = true;
      isLoading.value = false;
    }
  }
}

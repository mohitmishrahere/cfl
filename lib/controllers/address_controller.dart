import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddressInfoController extends GetxController {
  var isChecked = false.obs;
  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController permanentAddressLine1 = TextEditingController();
  TextEditingController permanentAddressLine2 = TextEditingController();
  TextEditingController permanentCity = TextEditingController();
  TextEditingController permanentPincode = TextEditingController();
  TextEditingController residencePincode = TextEditingController();
  FocusNode residencePincodeFocus = FocusNode();
  FocusNode permanentPincodeFocus = FocusNode();
  final jaipurPincodes = [
    "303007", "302011", "303002", "303903", "303905", "302005", "302013",
    "303102", "303338", "303807", "303604", "303602", "303802", "302002",
    "303106", "303601", "303804", "303801", "303901", "302006", "303302",
    "303001", "302026", "303908", "303003", "303702", "303120", "303105",
    "302022", "302012", "303008", "303104", "303328", "303803", "302016",
    "302019", "303806", "303103", "303805", "302033", "302017", "303348",
    "303108", "302029", "303109", "302015", "302027", "303603", "302003",
    "303704", "303305", "303110", "302004", "302001", "303107", "303701",
    "303005", "303904", "303301", "303706", "303119", "302028", "303012",
    "303009", "302025", "302018", "303712", "302039"
  ];

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}

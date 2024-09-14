import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController spouseNameController = TextEditingController();
  final TextEditingController referralCodeHere = TextEditingController();
  final TextEditingController occupationController = TextEditingController(text: 'Business');
  final TextEditingController selectedQualificationStatus = TextEditingController(text: 'Graduate and Above');
  final TextEditingController selectedMaritalStatus = TextEditingController(text: 'Single');
  var obscureText = true.obs;
  var gender = 'Male'.obs;
  var password = ''.obs;
  var loading = false.obs;
  var mobile = ''.obs;
  var isMarried = false.obs;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments!=null){
      mobile.value = Get.arguments[0];
      password.value = Get.arguments[1];
    }
  }
}
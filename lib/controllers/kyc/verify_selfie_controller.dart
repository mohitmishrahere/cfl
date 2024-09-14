import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class VerifySelfieController extends GetxController {
  var isChecked = false.obs;
  var isAadhaarEntered = false.obs;
  var isPANEntered = false.obs;
  var isPANLengthBetween5to9 = false.obs;
  TextEditingController aadharController = TextEditingController();
  FocusNode pANFocusNode = FocusNode();

}
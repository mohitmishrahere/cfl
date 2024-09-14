import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

import '../../api/api_services.dart';

class KYCDetailsController extends GetxController {
  var isChecked = false.obs;
  var isAadhaarEntered = false.obs;
  var otp = ''.obs;
  var isAadhaarVerified = false.obs;
  var isPanVerified = false.obs;
  var isPANEntered = false.obs;
  var isPANLengthBetween5to9 = false.obs;
  var verifyLoading = false.obs;
  var isLoading = false.obs;
  var panName = ''.obs;
  var name = ''.obs;
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  var keyboardType = TextInputType.text.obs;
  FocusNode pANFocusNode = FocusNode();
  FocusNode aadharFocusNode = FocusNode();
  FocusNode otpFocusNode = FocusNode();
  var aadhaarFrontImage = Rxn<File>();
  var aadhaarBackImage = Rxn<File>();
  var panImage = Rxn<File>();
  final Telephony telephony = Telephony.instance;
  var requestId = ''.obs;

  final ImagePicker _picker = ImagePicker();
  var occupation = ''.obs;

  @override
  void onInit() {
    super.onInit();
    init();
    startListeningForSMS();

  }

  // Future<void> pickImage(ImageSource source, String type) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     switch (type) {
  //       case 'aadhaarFront':
  //         aadhaarFrontImage.value = File(pickedFile.path);
  //         processImage(pickedFile);
  //         break;
  //       case 'aadhaarBack':
  //         aadhaarBackImage.value = File(pickedFile.path);
  //         break;
  //       case 'pan':
  //         panImage.value = File(pickedFile.path);
  //         break;
  //     }
  //   }
  // }

  // void showPicker(BuildContext context, String type) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext bc) {
  //       return SafeArea(
  //         child: Wrap(
  //           children: <Widget>[
  //             ListTile(
  //               leading: const Icon(CupertinoIcons.search),
  //               title: const Text('Photo Library'),
  //               onTap: () {
  //                 pickImage(ImageSource.gallery, type);
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.photo_camera),
  //               title: const Text('Camera'),
  //               onTap: () {
  //                 pickImage(ImageSource.camera, type);
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    occupation.value = prefs.getString('occupation')!;
    name.value = prefs.getString('name')!;
    nameController.text = prefs.getString('name')!;
    print("Occupation: " + occupation.value);
  }

  // Future<void> processImage(XFile image) async {
  //   final inputImage = InputImage.fromFilePath(image.path);
  //   // final textRecognizer = GoogleMlKit.vision.textRecognizer();
  //   final textRecognizer = TextRecognizer();
  //   final RecognizedText recognizedText =
  //   await textRecognizer.processImage(inputImage);
  //
  //   // Extract Aadhaar number from recognized text
  //   final aadhaarNumber = extractAadhaarNumber(recognizedText.text);
  //   print(aadhaarNumber);
  //
  //   aadharController.text = aadhaarNumber;
  //   isAadhaarEntered.value = true;
  // }

  String extractAadhaarNumber(String text) {
    final aadhaarRegex = RegExp(r'\b\d{4}\s\d{4}\s\d{4}\b');
    final vidRegex = RegExp(r'\b\d{4}\s\d{4}\s\d{4}\s\d{4}\b');

    final aadhaarMatch = aadhaarRegex.firstMatch(text);
    print(aadhaarMatch?.group(0)!);
    final vidMatch = vidRegex.firstMatch(text);
    print(vidMatch?.group(0)!);
    if (aadhaarMatch != null) {
      return aadhaarMatch.group(0)!.replaceAll(' ', '');
    } else if (vidMatch != null) {
      return ''; // Ignore VID and return empty if only VID is found
    }

    return ''; // Return empty if neither Aadhaar nor VID is found
  }

  void verifyOtp() async {
    isLoading.value = true;
    // Logic to verify OTP
    // Simulate network request delay
    await Future.delayed(const Duration(milliseconds: 500));
    var response =
    await APIServices.verifyOTPForAadharNumber(otp.value, requestId.value);
    if (response.containsKey("data")){
      Get.back();
      Get.snackbar('Success', 'Aadhaar verification successful');
      isAadhaarVerified.value = true;
    }
    else if (response['message'] == 'Verification Failed.') {
      Fluttertoast.showToast(msg: 'Invalid OTP. Please try again.');
    }
    else if (response.containsKey("errors")) {
      Fluttertoast.showToast(msg: 'Invalid Request');
      Get.back();
    }
    else {
      Get.back(); // Close the dialog
      Fluttertoast.showToast(msg: 'Invalid Request');
    }
    // if (otp.value == '123456') {
    //   // OTP verification successful

    // } else {
    //   // OTP verification failed
    //   Get.snackbar('Error', 'Invalid OTP. Please try again.');
    // }
    isLoading.value = false;
  }

  void startListeningForSMS() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        String smsBody = message.body ?? "";
        // Assuming OTP is a 6 digit number
        RegExp regExp = RegExp(r'\d{6}');
        var match = regExp.firstMatch(smsBody);
        if (match != null) {
          otpController.text = match.group(0)!;
          otp.value = match.group(0)!;
          verifyOtp();
        }
      },
      listenInBackground: false,
    );
  }
}

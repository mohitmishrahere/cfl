import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/api_services.dart';

class EmploymentInfoController extends GetxController {
  var allFieldsEntered = false.obs;
  var isAadhaarEntered = false.obs;
  TextEditingController shopName = TextEditingController();
  TextEditingController shopAddress = TextEditingController();
  TextEditingController pincode = TextEditingController();

  var isUploadingImage = false.obs;
  var isUploaded = false.obs;
  var isLoading = false.obs;
  var uploadedImageAddress = ''.obs;

  final ImagePicker _picker = ImagePicker();
  var poV = Rxn<File>();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      poV.value = File(pickedFile.path);
      isUploadingImage.value = true;
      var response = await APIServices.uploadImage(poV.value!);
      if (response.containsKey('error') && response['error'] == 'Not Found') {
        isUploadingImage.value = false;
        Fluttertoast.showToast(msg: 'Server Error!, Try Again Later');
      } else if(response.containsKey('message') && response['message'] == 'File uploaded successfully'){
        uploadedImageAddress.value = response['filePath'];
        isUploadingImage.value = false;
        isUploaded.value = true;
      } else{
        isUploadingImage.value = false;
        print(response);
        Fluttertoast.showToast(msg: 'Something went wrong, Try Again!');
      }
      // print(response);
    }
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cfl/screens/authentication/contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_services.dart';

class CameraScreenController extends GetxController {
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;
  XFile? _capturedImage;
  bool isFrontCamera = false;
  var selfie = Rxn<File>();
  var isUploadingImage = false.obs;
  var uploadedImageAddress = ''.obs;

  CameraScreenController() {
    _initializeCamera();
  }

  CameraController? get controller => _cameraController;

  Future<void>? get initializeControllerFuture => _initializeControllerFuture;

  XFile? get capturedImage => _capturedImage;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.last;

    isFrontCamera = firstCamera.lensDirection == CameraLensDirection.front;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.low,
    );

    _initializeControllerFuture = _cameraController!.initialize();
    update();
  }

  Future<void> captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _cameraController!.takePicture();
      _capturedImage = image;
      final containsFace = await _containsFace(image.path);
      if (containsFace) {
        // Proceed with the captured image
        update();
      } else {
        // Show error message
        Fluttertoast.showToast(msg: 'No Face Found in the selfie.');
        print('No face detected in the image.');
        // Optionally, you can show a dialog or Snackbar to inform the user
      }
      // update();
    } catch (e) {
      print(e);
    }
  }

  void retakeImage() {
    _capturedImage = null;
    update();
  }

  Future<void> confirmImage() async {
    if (_capturedImage != null) {
      selfie.value = File(_capturedImage!.path);
      isUploadingImage.value = true;
      var response = await APIServices.uploadImage(selfie.value!);
      if (response.containsKey('error') && response['error'] == 'Not Found') {
        isUploadingImage.value = false;
        Fluttertoast.showToast(msg: 'Server Error!, Try Again Later');
      } else if (response.containsKey('message') &&
          response['message'] == 'File uploaded successfully') {
        uploadedImageAddress.value = response['filePath'];
        var responseSave =
            await APIServices.saveSelfie(uploadedImageAddress.value);
        print(responseSave);
        if (responseSave.containsKey('data') &&
            responseSave['data']['profilepic'] != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isPhotoUploaded', true);
          prefs.setString('profilePic', uploadedImageAddress.value);
          Get.off(() => ReferenceContact());
        }
        isUploadingImage.value = false;
        print('uploadedImage: ${uploadedImageAddress.value}');
      } else {
        isUploadingImage.value = false;
        Fluttertoast.showToast(msg: 'Something went wrong, Try Again!');
      }
      // print(response);
    }
    // Get.back(result: _capturedImage);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<bool> _containsFace(String imagePath) async {
    final InputImage inputImage = InputImage.fromFilePath(imagePath);
    // final faceDetector = GoogleMlKit.vision.faceDetector();
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    final List<Face> faces = await faceDetector.processImage(inputImage);
    await faceDetector.close();
    return faces.isNotEmpty;
  }
}

import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controllers/kyc/camera_screen_controller.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CameraScreenController cameraController = Get.put(CameraScreenController());

    return Scaffold(
      body: GetBuilder<CameraScreenController>(
        builder: (controller) {
          if (controller.capturedImage != null) {
            return Obx(()=>Stack(
                children: [
                  Positioned.fill(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(controller.isFrontCamera ? pi : 0),
                      child: Image.file(
                        File(controller.capturedImage!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: controller.retakeImage,
                              child: Text('Retake'),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: controller.confirmImage,
                              child: Text('Confirm'),
                            ),
                          ],
                        ),
                        SizedBox(height: 70),
                      ],
                    ),
                  ),
                  if(controller.isUploadingImage.value)
                    Container(color: Color(0x80000000),),
                  if(controller.isUploadingImage.value)
                    Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white,),
                        SizedBox(height: 25,),
                        Text('Please wait while image uploads', style: GoogleFonts.poppins(color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return FutureBuilder<void>(
              future: controller.initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      Positioned.fill(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 1.17,
                                child: CameraPreview(controller.controller!)),
                          )),
                      CustomPaint(
                        size: Size(
                            MediaQuery.of(context).size.width,
                            MediaQuery.of(context)
                                .size
                                .height), // Specify your custom size here
                        painter: OvalPainter(),
                      ),
                      Positioned(
                        left: 30,
                        top: 75,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Color(0x33d9d9d9),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Icon(
                                CupertinoIcons.back,
                                color: Colors.white,
                                size: 20,
                              )),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Take your photo at arm\'s length. Make sure\nyour whole face is visible.',
                              style: GoogleFonts.poppins(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Capture Button
                                InkWell(
                                  onTap: controller.captureImage,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            color: Colors.white.withOpacity(0.3),
                                            width: 9)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: Colors.white),
                                      height: 45,
                                      width: 45,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 70,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          }
        },
      ),
    );
  }
}

class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the oval rect
    double ovalWidth = size.width * 0.78;
    double ovalHeight = size.height * 0.57;

    // Calculate the position to center the oval
    double left = (size.width - ovalWidth) / 2;
    double top = (size.height - ovalHeight) / 2;

    // Define the oval rect
    Rect rect = Rect.fromLTWH(left, top - 90, ovalWidth, ovalHeight);

    // Save the current canvas state
    canvas.saveLayer(Offset.zero & size, Paint());

    // Create a paint object for the light black background
    Paint backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.75)
      ..style = PaintingStyle.fill;

    // Fill the whole canvas with light black color
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    // Use clipping to exclude the oval area from the black background
    canvas.clipPath(Path()..addOval(rect), doAntiAlias: true);

    // Clear the clipped area to make it transparent
    canvas.drawRect(rect, Paint()..blendMode = BlendMode.clear);

    // Restore the canvas state to apply the clipping
    canvas.restore();

    // Create a paint object for the white border
    Paint paintBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    // Draw the white border
    canvas.drawOval(rect, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

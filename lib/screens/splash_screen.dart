import 'package:cfl/screens/authentication/kyc/kyc_details.dart';
import 'package:cfl/screens/authentication/kyc/kyc_info.dart';
import 'package:cfl/screens/authentication/kyc/verify_selfie.dart';
import 'package:cfl/screens/authentication/login_phone.dart';
import 'package:cfl/screens/authentication/occupation/business_info.dart';
import 'package:cfl/screens/authentication/occupation/employment_info.dart';
import 'package:cfl/screens/authentication/signup/sign_up_address_info.dart';
import 'package:cfl/screens/main/main_screen.dart';
import 'package:cfl/screens/permissions/permissions.dart';
import 'package:cfl/screens/slider_intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animation1 = Tween<double>(begin: 0.8, end: 2.4).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animation2 = Tween<double>(begin: 0.8, end: 1.4).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
        bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
        bool isTnCAccepted = prefs.getBool('isT&CAccepted') ?? false;
        print(isLoggedIn);
        bool isAddressSaved = prefs.getBool('isAddressSaved') ?? false;
        bool isKYCSaved = prefs.getBool('isKYCSaved') ?? false;
        bool isOccupationDetailsSaved =
            prefs.getBool('isOccupationDetailsSaved') ?? false;
        bool isPhotoUploaded = prefs.getBool('isPhotoUploaded') ?? false;
        bool isT_and_CAccepted = prefs.getBool('isT&CAccepted') ?? false;

        if (isFirstTime) {
          Get.off(() => SliderIntroScreen());
        } else if (!isTnCAccepted) {
          Get.off(() => PermissionsScreen());
          // Get.off(() => KYCDetails());
        } else if (!isLoggedIn) {
          Get.off(() => LoginPhoneScreen());
          // Get.off(() => KYCDetails());
        }
        // else if (!isAddressSaved) {
        //   Get.off(() => AddressInfo());
        // } else if (!isKYCSaved) {
        //   Get.off(() => KYCInfo());
        // } else if (!isOccupationDetailsSaved) {
        //   String? occupation = prefs.getString('occupation');
        //   print(occupation);
        //   if (occupation == 'Business') {
        //     Get.off(() => BusinessInfo());
        //   } else {
        //     Get.off(() => EmploymentInfo());
        //   }
        // } else if (!isPhotoUploaded) {
        //   Get.off(() => VerifyYourselfWithSelfie());
        // } else if (!isT_and_CAccepted) {
        //   Get.off(() => TermsAndConditions());
        // }
        else {
          Get.off(() => MainScreen(), arguments: [prefs.getString('name') ??'User', prefs.getString('profilePic')??'User']);
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: _animation2,
              child: Image.asset('assets/images/bg.png'),
            ),
          ),
          Center(
            child: ScaleTransition(
              scale: _animation1,
              child: Image.asset('assets/images/bg.png'),
            ),
          ),
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        ],
      ),
    );
  }
}

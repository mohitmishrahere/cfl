import 'package:cfl/controllers/auth/create_password_controller.dart';
import 'package:cfl/screens/authentication/login_phone.dart';
import 'package:cfl/screens/authentication/signup/confirm_password.dart';
import 'package:cfl/screens/authentication/signup/sign_up_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_services.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  final CreatePasswordController cont = Get.put(CreatePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff365EF1), Color(0xff2799EB)],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .57,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Stack(
                  children: [
                    Image.asset('assets/images/sliderbg.png'),
                    Positioned(
                        right: 0,
                        left: 0,
                        bottom: 10,
                        child: Image.asset(
                          'assets/images/loginPassword.png',
                          scale: 2.2,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25, top: 39, bottom: 39),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cont.isForgot.value ? 'Enter New Password' :'Enter Password !',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffFDBC0E),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      cont.isForgot.value ? 'New Password' : 'Password',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      // height: 50,
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cont.password,
                              obscureText: _obscureText,
                              obscuringCharacter: '⬤',
                              // Use a bullet character as placeholder
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: !_obscureText
                                      ? Colors.black
                                      : Color(0xff5C6371),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          IconButton(
                            icon: Image.asset(
                              !_obscureText
                                  ? 'assets/images/eyeOpen.png'
                                  : 'assets/images/eyeClosed.png',
                              color: Colors.grey,
                              width: 22.17,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      cont.isForgot.value ? 'Confirm New Password' : 'Confirm Password',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      // height: 50,
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cont.confPassword,
                              obscureText: _obscureConfirmText,
                              obscuringCharacter: '⬤',
                              // Use a bullet character as placeholder
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: !_obscureConfirmText
                                      ? Colors.black
                                      : Color(0xff5C6371),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          IconButton(
                            icon: Image.asset(
                              !_obscureConfirmText
                                  ? 'assets/images/eyeOpen.png'
                                  : 'assets/images/eyeClosed.png',
                              color: Colors.grey,
                              // scale: 1.7,
                              width: 22.17,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmText = !_obscureConfirmText;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'An example of a password that meets the criteria of having 8 characters, 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character is "A1b2@C3d"',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(()=> cont.loading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : InkWell(
                                  onTap: () async {
                                    if (validated(cont.password.text,
                                        cont.confPassword.text)) {
                                      // cont.loading.value =true;
                                      if(cont.isForgot.value){
                                        cont.loading.value = true;
                                        var response = await APIServices.resetPassword(
                                            cont.mobile.value,
                                            cont.password.text);
                                        if(response['message']=='Password reset successfully.. Kindly login to continue'){
                                          cont.loading.value = false;
                                          Fluttertoast.showToast(msg: 'Password has been reset\nLogin Now To Continue');
                                          Get.offAll(()=>LoginPhoneScreen());
                                        }
                                        // Get.off(() => SignUp(), arguments: [
                                        //   cont.mobile.value,
                                        //   cont.password.text
                                        // ]);
                                      }else{
                                        Get.off(() => SignUp(), arguments: [
                                          cont.mobile.value,
                                          cont.password.text
                                        ]);
                                      }

                                      // Get.to(()=>ConfirmPasswordScreen(), arguments: [cont.mobile.value, cont.password.text]);
                                    }
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(33, 12, 33, 12),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xffF3C309),
                                            Color(0xffF2A40E)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text(
                                      cont.isForgot.value ? 'Reset Password' : 'Login',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xff333B63)),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validated(String text, String textConf) {
    if (text.isEmpty) {
      Fluttertoast.showToast(msg: 'Password field can\'t be empty');
      return false;
    } else if (text.length < 8) {
      Fluttertoast.showToast(
          msg: 'Password must contain at least 8 characters');
      return false;
    } else if (textConf.isEmpty) {
      Fluttertoast.showToast(msg: 'Confirm Password field can\'t be empty');
      return false;
    } else if (textConf != text) {
      Fluttertoast.showToast(msg: 'Confirm Password do not match');
      return false;
    }
    return true;
  }
}

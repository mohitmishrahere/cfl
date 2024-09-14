import 'dart:ffi';

import 'package:cfl/controllers/auth/confirm_password_controller.dart';
import 'package:cfl/controllers/auth/create_password_controller.dart';
import 'package:cfl/screens/authentication/signup/sign_up_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_services.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {

  bool _obscureText = true;
  final ConfirmPasswordController cont = Get.put(ConfirmPasswordController());

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
                height: MediaQuery.of(context).size.height * .63,
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
                          scale: 1.6,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Password !',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffFDBC0E),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Confirm Password',
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
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cont.confPassword,
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cont.loading.value
                            ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : InkWell(
                          onTap: () async {
                            if(validated(cont.confPassword.text, cont)){
                              cont.loading.value =true;
                              Get.to(()=>SignUp(), arguments: [cont.mobile.value, cont.password.value]);
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
                              'Login',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xff333B63)),
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

  bool validated(String text, ConfirmPasswordController cont) {
    if (text.isEmpty) {
      Fluttertoast.showToast(msg: 'Confirm Password field can\'t be empty');
      return false;
    } else if (text != cont.password.value) {
      Fluttertoast.showToast(msg: 'Confirm Password do not match');
      return false;
    }
    return true;
  }
}

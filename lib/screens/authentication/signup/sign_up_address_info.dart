import 'package:cfl/controllers/auth/login_otp_controller.dart';
import 'package:cfl/controllers/sign_up_controller.dart';
import 'package:cfl/screens/authentication/kyc/kyc_info.dart';
import 'package:cfl/widgets/pin_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_services.dart';
import '../../../controllers/address_controller.dart';

class AddressInfo extends StatefulWidget {
  AddressInfo({super.key});

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  final AddressInfoController cont = Get.put(AddressInfoController());

  @override
  Widget build(BuildContext context) {
    // pinController.text = '______';
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height * .63,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      // color: Colors.white,
                      gradient: LinearGradient(
                        colors: [Color(0xff365EF1), Color(0xff2799EB)],
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 90,
                              ),
                              Text(
                                'Address Info',
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tell us about your residence, We\nare eager to know more.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Positioned(
                      //   left: 30,
                      //   top: 75,
                      //   child: InkWell(
                      //     onTap: () {
                      //       Get.back();
                      //     },
                      //     child: Container(
                      //         padding: EdgeInsets.all(4),
                      //         decoration: BoxDecoration(
                      //             color: Color(0x33d9d9d9),
                      //             borderRadius: BorderRadius.circular(25)),
                      //         child: Icon(
                      //           CupertinoIcons.back,
                      //           color: Colors.white,
                      //           size: 20,
                      //         )),
                      //   ),
                      // ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Residence
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Address Line 1 *',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: cont.addressLine1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Address Line 1",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          onChanged: (text) {
                            if (cont.isChecked.value) {
                              setState(() {
                                cont.permanentAddressLine1.text = text;
                              });
                            }
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Address Line 2 *',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: cont.addressLine2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Address Line 2",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          onChanged: (text) {
                            if (cont.isChecked.value) {
                              setState(() {
                                cont.permanentAddressLine2.text = text;
                              });
                            }
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'City *',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: cont.city,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "City",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          onChanged: (text) {
                            if (cont.isChecked.value) {
                              setState(() {
                                cont.permanentCity.text = text;
                              });
                            }
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    // PinCode
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 15),
                      child: Text(
                        'Pincode *',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: cont.residencePincode,
                          focusNode: cont.residencePincodeFocus,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6)
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "pincode",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          onChanged: (text) {
                            if (cont.isChecked.value) {
                              setState(() {
                                cont.permanentPincode.text = text;
                              });
                            }
                            if (text.length == 6) {
                              cont.residencePincodeFocus.unfocus();
                            }
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),

                    Obx(
                      () => CheckboxListTile(
                        title: Text(
                          'Mark Permanent address same as residence',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff333B63)),
                        ),
                        value: cont.isChecked.value,
                        onChanged: (bool? value) {
                          cont.isChecked.value = value!;
                          if (cont.isChecked.value) {
                            setState(() {
                              cont.permanentAddressLine1.text = cont.addressLine1.text;
                              cont.permanentAddressLine2.text = cont.addressLine2.text;
                              cont.permanentCity.text = cont.city.text;
                              cont.permanentPincode.text =
                                  cont.residencePincode.text;
                            });
                          } else {
                            setState(() {
                              cont.permanentAddressLine1.text = "";
                              cont.permanentAddressLine2.text = "";
                              cont.permanentCity.text = "";
                              cont.permanentPincode.text = "";
                            });
                          }
                        },
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity(horizontal: -4),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.blue,
                      ),
                    ),

                    // Permanent Address
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 10),
                      child: Text(
                        'Permanent Address Line 1  *',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          enabled: !cont.isChecked.value,
                          controller: cont.permanentAddressLine1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Permanent Address Line 1",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 10),
                      child: Text(
                        'Permanent Address Line 2  *',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          enabled: !cont.isChecked.value,
                          controller: cont.permanentAddressLine2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Permanent Address Line 2",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 10),
                      child: Text(
                        'Permanent City *',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          enabled: !cont.isChecked.value,
                          controller: cont.permanentCity,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Permanent City",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    // PinCode
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 15),
                      child: Text(
                        'Pincode *',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          enabled: !cont.isChecked.value,
                          controller: cont.permanentPincode,
                          focusNode: cont.permanentPincodeFocus,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "pincode",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0x735c6371),
                            ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6)
                          ],
                          onChanged: (text) {
                            if (text.length == 6) {
                              cont.permanentPincodeFocus.unfocus();
                            }
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 38,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => cont.isLoading.value
                              ? CircularProgressIndicator()
                              : InkWell(
                                  onTap: () async {
                                    if (validated(
                                        cont.addressLine1.text,
                                        cont.addressLine2.text,
                                        cont.city.text,
                                        cont.residencePincode.text,
                                        cont.permanentAddressLine1.text,
                                        cont.permanentAddressLine2.text,
                                        cont.permanentCity.text,
                                        cont.permanentPincode.text,
                                        cont.isChecked)) {
                                      if (cont.jaipurPincodes.contains(
                                              cont.residencePincode.text) &&
                                          cont.jaipurPincodes.contains(
                                              cont.permanentPincode.text)) {
                                        cont.isLoading.value = true;
                                        var response =
                                            await APIServices.saveAddress(
                                                "${cont.addressLine1.text}, ${cont.addressLine2.text}, ${cont.city.text}",
                                                cont.residencePincode.text,
                                                "${cont.permanentAddressLine1.text}, ${cont.permanentAddressLine2.text}, ${cont.permanentCity.text}",
                                                cont.permanentPincode.text,
                                                cont.isChecked.value);
                                        print(response);
                                        if (response['message'] ==
                                            'Address details saved successfully.') {
                                          Fluttertoast.showToast(
                                              msg: response['message']);
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setBool('isAddressSaved', true);
                                          Get.off(() => KYCInfo());
                                        } else if (response['message'] ==
                                            'Address exists for this user..') {
                                          Fluttertoast.showToast(
                                              msg: response['message']);
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setBool('isAddressSaved', true);
                                          Get.off(() => KYCInfo());
                                        }

                                        // if(response){
                                        //
                                        // }
                                      } else {
                                        showErrorDialog();
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        33, 12, 33, 12),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff2799EB),
                                            Color(0xff1354D1)
                                          ],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      'Continue',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white),
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

  bool validated(String adrLine1, String adrLine2, String city, String residencePincode, String perAdrLine1,
      String perAdrLine2, String perAdrCity,
      String permanentPincode, RxBool isChecked) {
    if (adrLine1.isEmpty) {
      Fluttertoast.showToast(msg: 'Address Line 1 can\'t be empty!');
      return false;
    } else if (adrLine2.isEmpty) {
      Fluttertoast.showToast(msg: 'Address Line 2 can\'t be empty!');
      return false;
    } else if (city.isEmpty) {
      Fluttertoast.showToast(msg: 'City can\'t be empty!');
      return false;
    }else if (residencePincode.isEmpty) {
      Fluttertoast.showToast(msg: 'Residence pincode can\'t be empty!');
      return false;
    } else if (residencePincode.length != 6) {
      Fluttertoast.showToast(msg: 'Invalid Residence Pincode');
      return false;
    } else if (!isChecked.value && perAdrLine1.isEmpty) {
      Fluttertoast.showToast(msg: 'Permanent address line 1 can\'t be empty!');
      return false;
    } else if (!isChecked.value && perAdrLine2.isEmpty) {
      Fluttertoast.showToast(msg: 'Permanent address line 2 can\'t be empty!');
      return false;
    } else if (!isChecked.value && perAdrCity.isEmpty) {
      Fluttertoast.showToast(msg: 'Permanent address City can\'t be empty!');
      return false;
    } else if (!isChecked.value && permanentPincode.isEmpty) {
      Fluttertoast.showToast(msg: 'Permanent address pincode can\'t be empty!');
      return false;
    } else if (permanentPincode.length != 6) {
      Fluttertoast.showToast(msg: 'Invalid Permanent Pincode');
      return false;
    }
    return true;
  }

  void showErrorDialog() {
    Get.defaultDialog(
      title: '',
      titleStyle: TextStyle(fontSize: 1),
      contentPadding:
          const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 17),
      content: Column(
        children: [
          Image.asset(
            'assets/images/not_avail.png',
            width: 81,
            height: 81,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Not Available \nAt This Location .',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'We’re not available in current\nlocation, please change it',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'accordingly. ',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 12),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  'Change',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff365EF1)),
                ),
              )
            ],
          )
        ],
      ),
      radius: 25.0,
    );
  }
}

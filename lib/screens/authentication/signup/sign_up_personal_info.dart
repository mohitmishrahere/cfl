import 'package:cfl/controllers/auth/login_otp_controller.dart';
import 'package:cfl/controllers/sign_up_controller.dart';
import 'package:cfl/screens/authentication/signup/sign_up_address_info.dart';
import 'package:cfl/screens/permissions/permissions.dart';
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
import 'package:intl/intl.dart';

import '../../../api/api_services.dart';
// import 'package:pinput/pinput.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final SignUpController cont = Get.put(SignUpController());

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
                                'Personal Info',
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tell us more about you, We are\neager to know more.',
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
                    // Name
                    _inputWidget('Name *', 'John doe', cont.nameController),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Enter your full name as per PAN', style: GoogleFonts.poppins(fontSize: 11,  color: const Color(
                          0xcc5c6371),),),
                    ),
                    // DateOfBirth
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 15),
                      child: Text(
                        'Date Of Birth *',
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Color(0xd304ffe),
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            cont.loading.value = false;
                            _selectDate(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 120,
                                child: TextField(
                                  controller: cont.dateController,
                                  keyboardType: TextInputType.datetime,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "dd/mm/yyyy",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: const Color(0x735c6371),
                                    ),
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xff093030),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 13,
                    ),
                    _inputWidget(
                        'Email *', 'example@example.com', cont.emailController),
                    SizedBox(
                      height: 2,
                    ),

                    _inputWidget(
                        'Father Name *', 'john doe', cont.fatherNameController),

                    // SizedBox(
                    //   height: 3,
                    // ),

                    // MaritalStatus
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 15),
                      child: Text(
                        'Marital Status',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Obx(
                    //   () => Row(
                    //     children: [
                    //       Container(
                    //         width: 130,
                    //         child: RadioListTile<String>(
                    //           contentPadding: EdgeInsets.zero,
                    //           visualDensity: VisualDensity(horizontal: -4),
                    //           title: Text(
                    //             'Single',
                    //             style: GoogleFonts.poppins(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xff344054)),
                    //           ),
                    //           activeColor: Color(0xff365EF1),
                    //           value: 'single',
                    //           groupValue: cont.selectedMaritalStatus.value,
                    //           onChanged: (String? value) {
                    //             cont.selectedMaritalStatus.value = value!;
                    //           },
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: RadioListTile<String>(
                    //           activeColor: Color(0xff365EF1),
                    //           contentPadding: EdgeInsets.zero,
                    //           visualDensity: VisualDensity(horizontal: -4),
                    //           title: Text(
                    //             'Married',
                    //             style: GoogleFonts.poppins(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xff344054)),
                    //           ),
                    //           value: 'married',
                    //           groupValue: cont.selectedMaritalStatus.value,
                    //           onChanged: (String? value) {
                    //             cont.selectedMaritalStatus.value = value!;
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Obx(
                    //   () => Row(
                    //     children: [
                    //       Container(
                    //         width: 130,
                    //         child: RadioListTile<String>(
                    //           contentPadding: EdgeInsets.zero,
                    //           visualDensity: VisualDensity(horizontal: -4),
                    //           title: Text(
                    //             'Divorced',
                    //             style: GoogleFonts.poppins(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xff344054)),
                    //           ),
                    //           activeColor: Color(0xff365EF1),
                    //           value: 'Divorced',
                    //           groupValue: cont.selectedMaritalStatus.value,
                    //           onChanged: (String? value) {
                    //             cont.selectedMaritalStatus.value = value!;
                    //           },
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: RadioListTile<String>(
                    //           activeColor: Color(0xff365EF1),
                    //           contentPadding: EdgeInsets.zero,
                    //           visualDensity: VisualDensity(horizontal: -4),
                    //           title: Text(
                    //             'Widower',
                    //             style: GoogleFonts.poppins(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xff344054)),
                    //           ),
                    //           value: 'Widower',
                    //           groupValue: cont.selectedMaritalStatus.value,
                    //           onChanged: (String? value) {
                    //             cont.selectedMaritalStatus.value = value!;
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    const SizedBox(
                      height: 7,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.only(top: 18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Select Marital Status',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Single',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.selectedMaritalStatus.text =
                                          'Single';
                                      cont.isMarried.value =false;
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Married',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.selectedMaritalStatus.text =
                                          'Married';
                                      cont.isMarried.value =true;
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Divorced',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.selectedMaritalStatus.text =
                                          'Divorced';
                                      cont.isMarried.value =false;
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Widower',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.selectedMaritalStatus.text =
                                          'Widower';
                                      cont.isMarried.value =false;
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Color(0xd304ffe),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                child: TextField(
                                  enabled: false,
                                  controller: cont.selectedMaritalStatus,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                CupertinoIcons.chevron_down,
                                color: Color(0xff323232),
                              )
                            ],
                          )),
                    ),

                    SizedBox(height: 8,),
                    Obx(
                      () => cont.isMarried.isTrue
                          ? _inputWidget('Spouse Name *', 'Spouse Name',
                              cont.spouseNameController)
                          : SizedBox(),
                    ),

                    // Gender
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 15),
                      child: Text(
                        'Gender',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Container(
                            width: 100,
                            child: RadioListTile<String>(
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity(horizontal: -4),
                              title: Text(
                                'Male',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff344054)),
                              ),
                              activeColor: Color(0xff365EF1),
                              value: 'Male',
                              groupValue: cont.gender.value,
                              onChanged: (String? value) {
                                cont.gender.value = value!;
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              activeColor: Color(0xff365EF1),
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity(horizontal: -4),
                              title: Text(
                                'Female',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff344054)),
                              ),
                              value: 'Female',
                              groupValue: cont.gender.value,
                              onChanged: (String? value) {
                                cont.gender.value = value!;
                              },
                            ),
                          ),
                          Container(
                            width: 100,
                            child: RadioListTile<String>(
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity(horizontal: -4),
                              title: Text(
                                'Other',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff344054)),
                              ),
                              activeColor: Color(0xff365EF1),
                              value: 'Other',
                              groupValue: cont.gender.value,
                              onChanged: (String? value) {
                                cont.gender.value = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Qualifications
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 15),
                      child: Text(
                        'Qualifications',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.only(top: 18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Select Qualification',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Graduate and Above',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.selectedQualificationStatus.text =
                                          'Graduate';
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      '10th Pass or Less',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.selectedQualificationStatus.text =
                                          '10th Pass or Less';
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      '8th Pass or Less',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.selectedQualificationStatus.text =
                                          '8th Pass or Less';
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Color(0xd304ffe),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                child: TextField(
                                  enabled: false,
                                  controller: cont.selectedQualificationStatus,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                CupertinoIcons.chevron_down,
                                color: Color(0xff323232),
                              )
                            ],
                          )),
                    ),
                    // Obx(
                    //   () => Row(
                    //     children: [
                    //       Container(
                    //         width: 130,
                    //         child: RadioListTile<String>(
                    //           visualDensity: VisualDensity(horizontal: -4),
                    //           contentPadding: EdgeInsets.zero,
                    //           title: Text(
                    //             'Graduate',
                    //             style: GoogleFonts.poppins(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xff344054)),
                    //           ),
                    //           activeColor: Color(0xff365EF1),
                    //           value: 'graduate',
                    //           groupValue:
                    //               cont.selectedQualificationStatus.value,
                    //           onChanged: (String? value) {
                    //             cont.selectedQualificationStatus.value = value!;
                    //           },
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: RadioListTile<String>(
                    //           activeColor: Color(0xff365EF1),
                    //           visualDensity: VisualDensity(horizontal: -4),
                    //           title: Text(
                    //             'Non Graduate',
                    //             style: GoogleFonts.poppins(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xff344054)),
                    //           ),
                    //           contentPadding: EdgeInsets.zero,
                    //           value: 'non graduate',
                    //           groupValue:
                    //               cont.selectedQualificationStatus.value,
                    //           onChanged: (String? value) {
                    //             cont.selectedQualificationStatus.value = value!;
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // Occupation
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 15),
                      child: Text(
                        'Occupation',
                        style: GoogleFonts.poppins(
                            color: Color(0xff333B63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.only(top: 18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Select Occupation',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Business',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.occupationController.text =
                                          'Business';
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Salaried Employee',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      cont.occupationController.text =
                                          'Salaried Employee';
                                      Navigator.pop(context);
                                    },
                                  ),
                                  // ListTile(
                                  //   title: Text(
                                  //     'Student',
                                  //     style: GoogleFonts.poppins(fontSize: 18),
                                  //   ),
                                  //   onTap: () {
                                  //     cont.occupationController.text =
                                  //         'Student';
                                  //     Navigator.pop(context);
                                  //   },
                                  // ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Color(0xd304ffe),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                child: TextField(
                                  enabled: false,
                                  controller: cont.occupationController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                CupertinoIcons.chevron_down,
                                color: Color(0xff323232),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    _inputWidget('Have a referral code?', 'Referral code here',
                        cont.referralCodeHere),

                    const SizedBox(
                      height: 27,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => cont.loading.value
                              ? CircularProgressIndicator(
                                  color: Colors.blue,
                                )
                              : InkWell(
                                  onTap: () async {
                                    if (validated()) {
                                      cont.loading.value = true;
                                      var response = await APIServices.signUp(
                                          cont.nameController.text,
                                          cont.emailController.text,
                                          cont.mobile.value,
                                          cont.dateController.text,
                                          cont.fatherNameController.text,
                                          cont.selectedMaritalStatus.text.toLowerCase(),
                                          cont.selectedQualificationStatus.text.toLowerCase(),
                                          cont.occupationController.text.toLowerCase(),
                                          cont.gender.value.toLowerCase(),
                                          cont.password.value,
                                          cont.referralCodeHere.text,
                                          cont.spouseNameController.text);

                                      if (response.containsKey('errors')) {
                                        cont.loading.value = false;
                                        Fluttertoast.showToast(msg: response['errors'][0]['msg']);
                                      } else if (response.containsKey('message')) {
                                        cont.loading.value = false;
                                        Fluttertoast.showToast(msg: 'Registered Successfully!');
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.setString('token', response['authtoken']);
                                        prefs.setString('name', cont.nameController.text);
                                        if(cont.occupationController.text == 'Business'){
                                          prefs.setString('occupation', 'Business');
                                        }else if(cont.occupationController.text ==
                                            'Salaried Employee'){
                                          prefs.setString('occupation', 'Salaried Employee');
                                        } else if(cont.occupationController.text ==
                                            'Student'){
                                          prefs.setString('occupation', 'Student');
                                        }

                                        Get.off(() => AddressInfo());
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime minDate =
        DateTime(currentDate.year - 18, currentDate.month, currentDate.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: minDate,
      firstDate: DateTime(1924),
      lastDate: minDate,
    );

    if (picked != null) {
      cont.dateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  bool validated() {
    if (cont.nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Name Can\'t be Empty');
      return false;
    } else if (cont.emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Email Can\'t be Empty');
      return false;
    } else if (cont.dateController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please Select Date of Birth');
      return false;
    } else if (cont.dateController.text.isNotEmpty) {
      String dateString = cont.dateController.text;
      List<String> dateParts = dateString.split('/');
      if (dateParts.length != 3) {
        // If the date format is incorrect, return false
        return false;
      }
      String day = dateParts[0];
      String month = dateParts[1];
      String year = dateParts[2];

      // Ensure the month is two digits
      if (month.length == 1) {
        month = '0' + month;
      }

      // Construct the date string in the YYYY-MM-DD format
      String currentDate = '$year-$month-$day';

      print(currentDate);
      int age = DateTime.now().year - DateTime.tryParse(currentDate)!.year;
      if (DateTime.now().month < DateTime.tryParse(currentDate)!.month ||
          (DateTime.now().month == DateTime.tryParse(currentDate)!.month &&
              DateTime.now().day < DateTime.tryParse(currentDate)!.day)) {
        age--;
      }
      if (age < 18) {
        Fluttertoast.showToast(msg: 'Age must not be less than 18');
        return false;
      }
      print('object');
    } else if (cont.fatherNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Father\'s Name Can\'t be Empty');
      return false;
    } else if (cont.isMarried.value && cont.spouseNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Spouse\'s Name Can\'t be Empty');
      return false;
    }
    return true;
  }

  Widget _inputWidget(
      String head, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              head,
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
                controller: controller,
                inputFormatters: [
                  if (head != "Email *" && head != "Have a referral code?")
                    FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0x735c6371),
                  ),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }
}

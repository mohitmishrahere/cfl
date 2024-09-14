// import 'package:cfl/screens/home/notification.dart';
import 'package:cfl/controllers/home/request_loan/add_new_account_controller.dart';
import 'package:cfl/controllers/home/request_loan/add_new_account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/api_services.dart';

class AddNewAccount extends StatelessWidget {
  final AddNewAccountController cont = Get.put(AddNewAccountController());

  @override
  Widget build(BuildContext context) {
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
                  child: Container(
                    child: Container(
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
                      padding: EdgeInsets.fromLTRB(25, 80, 25, 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: const Color(0x33d9d9d9),
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Icon(
                                  CupertinoIcons.back,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Add New Account',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 39, top: 20),
                child: Text(
                  'Bank Name',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333b63)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xd304ffe), // Fixed color code
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.only(top: 18),
                            child: Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: cont.banks.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      cont.banks[index],
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    onTap: () {
                                      // Assuming cont.selectedBank is a ValueNotifier or similar
                                      cont.selectedBank.value =
                                          cont.banks[index];
                                      cont.selectedBankController.text =
                                          cont.banks[index];
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
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
                                controller: cont.selectedBankController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Select Bank Name',
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 39, top: 10),
                child: Text(
                  'Account Number',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333b63)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xd304ffe),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: cont.accountNumber,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(18)],
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff304FFE),
                            width: 2,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      hintText: 'Enter Account Number',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        Icons.credit_card_rounded,
                        color: Color(0xff344054),
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 39, top: 10),
                child: Text(
                  'Account Holder Name',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333b63)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xd304ffe),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: cont.accountHolderName,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff304FFE),
                            width: 2,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      hintText: 'Enter Account Holder Name',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        Icons.credit_card_rounded,
                        color: Color(0xff344054),
                        size: 16,
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 39, top: 10),
                child: Text(
                  'Account IFSC Code',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333b63)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xd304ffe),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: cont.ifscController,
                    focusNode: cont.ifscFocusNode,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff304FFE),
                            width: 2,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      hintText: 'Enter IFSC Code',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        Icons.credit_card_rounded,
                        color: Color(0xff344054),
                        size: 16,
                      ),
                    ),
                    inputFormatters: [
                      UpperCaseTextFormatter(),
                      LengthLimitingTextInputFormatter(11)
                    ],
                    onChanged: (value) {
                      // Add your logic to handle the text change

                      if (value.length == 11) {
                        cont.ifscFocusNode.unfocus();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Container(
                    padding: const EdgeInsets.only(
                        top: 13, bottom: 13, left: 13, right: 13),
                    decoration: BoxDecoration(
                      color: Color(0xd304ffe),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Loan transfers to Paytm payments Bank have been stopped. Please select a non-Paytm Payments Bank account.',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333B63)),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      cont.isLoading.value
                          ? CircularProgressIndicator(
                              strokeWidth: 2,
                            )
                          : Opacity(
                              opacity: cont.selectedBank.value.isNotEmpty &&
                                      cont.accountNumber.text.length > 10 &&
                                      cont.accountHolderName.text.isNotEmpty &&
                                      cont.ifscController.text.length == 11
                                  ? 1
                                  : 0.5,
                              child: InkWell(
                                onTap: () async {
                                  if(cont.selectedBank.value.isNotEmpty &&
                                      cont.accountNumber.text.length > 10 &&
                                      cont.accountHolderName.text.isNotEmpty &&
                                      cont.ifscController.text.length == 11){
                                    var response = await APIServices.addBankAccount(
                                        cont.selectedBankController.text,
                                        cont.accountNumber.text,
                                        cont.accountHolderName.text,
                                        cont.ifscController.text);
                                    if(response['message'] == 'Bank account added'){
                                      Fluttertoast.showToast(msg: 'Bank Account Added Successfully.');
                                      Get.back(result: 'added');
                                      Get.back(result: 'added');
                                    }
                                  }
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(33, 12, 33, 12),
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xff2799EB),
                                          Color(0xff1354D1),
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Add Bank Account',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerWithIconAndText(String image, String text) {
    return Container(
      height: 96,
      width: 96,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21212121),
            // The shadow color with 20% opacity
            offset: Offset(0, 4),
            // Horizontal and vertical offset
            blurRadius: 12, // The blur radius
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 38,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xff333B63)),
          )
        ],
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

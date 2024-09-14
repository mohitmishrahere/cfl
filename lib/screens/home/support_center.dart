import 'package:cfl/controllers/kyc/verify_selfie_controller.dart';
import 'package:cfl/controllers/support_controller.dart';
import 'package:cfl/screens/authentication/kyc/camera/camera_screen.dart';
import 'package:cfl/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/occupation/business_info_controller.dart';
import '../../../service/permission_service.dart';
import '../../api/api_services.dart';

class SupportCenter extends StatelessWidget {
  SupportCenter({super.key});

  final SupportCenterController cont = Get.put(SupportCenterController());

  @override
  Widget build(BuildContext context) {
    // pinController.text = '______';
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff365EF1), Color(0xff2799EB)],
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 90,
                          ),
                          Text(
                            'Support Center',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: 30,
                    top: 75,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0x33d9d9d9),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 25, bottom: 0),
              child: Card(
                elevation: 3,
                color: Color(0xfff1f3fc),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TabBar(
                    controller: cont.tabController,
                    labelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    unselectedLabelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal, fontSize: 14),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x21212121),
                          offset: Offset(0, 4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Color(0xff365EF1),
                    unselectedLabelColor: Color(0xff333B63),
                    indicatorColor: Colors.transparent,
                    // Add this line to remove the grey line
                    tabs: const [
                      Tab(
                        text: 'Support Assistant',
                      ),
                      Tab(
                        text: 'Help Center',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: cont.tabController,
                children: [
                  Column(
                    children: [
                      Obx(
                        () => Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 28.0, right: 28),
                            child: ListView.builder(
                              itemCount: cont.messages.value.length,
                              controller: cont.scrollController,
                              padding: EdgeInsets.only(top: 17),
                              itemBuilder: (context, index) {
                                return ChatBubble(
                                    message: cont.messages.value[index]);
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // height: 55,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        color: Color(0xffEBEFFE),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 22,
                            ),
                            iconButton('assets/icons/camera.png'),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                // height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14.0, right: 14),
                                  child: TextField(
                                    controller: cont.chatText,
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300),
                                        hintText: 'Write Here...'),
                                    maxLines: 5,
                                    minLines: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            iconButton('assets/icons/mic_1.png'),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  cont.addMessage(cont.chatText.text);
                                  cont.scrollController.animateTo(
                                      cont.scrollController.position
                                          .maxScrollExtent,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                  cont.chatText.clear();
                                },
                                child: iconButton('assets/icons/share.png')),
                            SizedBox(
                              width: 22,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Active Chats',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xff333B63)),
                          ),
                          InkWell(
                            onTap: () {
                              openWhatsApp("+91 9785593154",
                                  "Hello! I\'m here to assist you");
                            },
                            child: customChat('Support Assistant',
                                'Hello! I\'m here to assist you', '2 Min Ago'),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          // Text(
                          //   'Ended Chats',
                          //   style: GoogleFonts.poppins(
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 18,
                          //       color: Color(0xff333B63)),
                          // ),
                          // customChat('Support Assistant',
                          //     'Your account is ready...', 'Feb 08-2024'),
                          // customChat('Support Assistant',
                          //     'Your account is ready...', 'Feb 08-2024'),
                          // SizedBox(
                          //   height: 25,
                          // ),
                          // Image.asset('assets/icons/btm_line.png'),
                          // SizedBox(
                          //   height: 25,
                          // ),
                          Text(
                            'Need Help? Contact Us',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xff333B63)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              onTap: () {
                                _makeEmail('example@example.com');
                              },
                              child: customPreset('example@example.com')),
                          InkWell(
                              onTap: () {
                                _makePhoneCall('+918875488888');
                              },
                              child: customPreset('+91 88754XXXXX')),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Message Us',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xff333B63)),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          customInput('Name', 'Enter your name', cont.nameText),
                          customInput(
                              'Email', 'Enter your Email', cont.emailText),
                          customInput('Subject', 'Enter your Subject',
                              cont.subjectText),
                          customInput('Message', 'Enter your Message',
                              cont.messageText),
                          SizedBox(
                            height: 10,
                          ),
                          Obx(()=> Opacity(
                                opacity: cont.nameText.text.isNotEmpty &&
                                        cont.emailText.text.isNotEmpty &&
                                        cont.subjectText.text.isNotEmpty &&
                                        cont.messageText.text.isNotEmpty
                                    ? 1.0
                                    : 0.6,
                                child: cont.isLoading.value ? CircularProgressIndicator() : InkWell(
                                  onTap:() async {
                                    if(cont.nameText.text.isNotEmpty &&
                                        cont.emailText.text.isNotEmpty &&
                                        cont.subjectText.text.isNotEmpty &&
                                        cont.messageText.text.isNotEmpty){
                                      cont.isLoading.value = true;
                                      var response = await APIServices.sendMessage(
                                          cont.nameText.text,
                                          cont.emailText.text,
                                          cont.subjectText.text,
                                          cont.messageText.text);
                                      if(response['message']=='Thank you for reaching! We will get back to you soon.'){
                                        showThankYouDialog();
                                        cont.subjectText.clear();
                                        cont.messageText.clear();
                                        cont.isLoading.value = false;
                                      }else{
                                        Fluttertoast.showToast(msg: 'Try Again');
                                        cont.isLoading.value = false;
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
                                            Color(0xff1354D1)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text(
                                      'Send',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xffffffff)),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationWidget(BuildContext context, String image, String title,
      String content, String time, String extra) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 39.25,
                  decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(4)),
                  child: Image.asset(
                    image,
                    width: 35.76,
                  )),
              SizedBox(
                width: 9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff333B63)),
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 3),
                      width: MediaQuery.of(context).size.width * .65,
                      child: Text(
                        content,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff333B63)),
                      )),
                  extra != ''
                      ? Text(
                          extra,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: Color(0xff365EF1)),
                        )
                      : SizedBox(),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            time,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xff1965F2)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Color(0xff333B63),
                height: 0.5,
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget iconButton(String icon) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: Color(0xff1354D1), borderRadius: BorderRadius.circular(8)),
      child: Image.asset(
        icon,
        scale: 2,
      ),
    );
  }

  Widget customChat(String head, String content, String time) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: Color(0xd365ef1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                  color: Color(0xff365EF1),
                  borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                'assets/icons/support.png',
                scale: 2,
              )),
          SizedBox(
            width: 11,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                head,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff333B63)),
              ),
              Text(
                content,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff333B63)),
              ),
              SizedBox(
                height: 4,
              )
            ],
          )),
          SizedBox(
            width: 11,
          ),
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Text(
              time,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  color: Color(0xff333B63)),
            ),
          )
        ],
      ),
    );
  }

  Widget customPreset(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: Color(0xd365ef1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                color: Color(0xff365EF1),
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(
            width: 11,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff333B63)),
              ),
              SizedBox(
                height: 4,
              )
            ],
          )),
          SizedBox(
            width: 11,
          ),
          Icon(
            CupertinoIcons.arrow_right,
            color: Color(0xff1965F2),
          )
        ],
      ),
    );
  }

  customInput(String head, String hint, TextEditingController controller) {
    return Column(
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                color: Color(0xd304ffe),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0x735c6371),
                ),
              ),
              // keyboardType: TextInputType.number,
              minLines: head == "Message" ? 5 : 1,
              maxLines: head == "Message" ? 5 : 1,

              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
              ),
            )),
        SizedBox(
          height: 22,
        ),
      ],
    );
  }

  Future<void> _makeEmail(String s) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: s,
      query: '',
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      debugPrint('Could not launch $emailUri');
    }
  }

  Future<void> _makePhoneCall(String s) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: s,
    );

    if (await canLaunch('tel:$s')) {
      await launch(launchUri.toString());
    } else {
      debugPrint('Could not launch $launchUri');
      // Show a dialog or snackbar here to inform the user
    }
  }

  void openWhatsApp(String phoneNumber, String message) async {
    final String whatsappUrl =
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  void showThankYouDialog() {
    Get.defaultDialog(
      title: '\nMessage Sent',
      titleStyle: GoogleFonts.poppins(color: Colors.black),
      middleText: "Thank you for messaging us, we'll contact you soon.",
      middleTextStyle: GoogleFonts.poppins(color: Colors.black87),
      backgroundColor: Colors.white,
      radius: 20,
      contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 40),
      confirm: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xff2799EB),
              Color(0xff1354D1)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

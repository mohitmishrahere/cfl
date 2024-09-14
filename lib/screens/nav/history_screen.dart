import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // pinController.text = '';
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Container(
                  decoration: const BoxDecoration(
                    // color: Colors.white,
                    gradient: LinearGradient(
                      colors: [Color(0xff365EF1), Color(0xff2799EB)],
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(25, 80, 25, 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.back();
                          Navigator.pop(context);
                        },
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: const Color(0x33d9d9d9),
                                borderRadius:
                                BorderRadius.circular(25)),
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
                        'History',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          // Get.to(() => NotificationScreen());
                        },
                        child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                color: Color(0xffF2EACB),
                                borderRadius:
                                BorderRadius.circular(25.71)),
                            child: Image.asset('assets/icons/calendar.png', scale: 2,)),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xcc2799eb),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TabBar(
                    // controller: cont.tabController,
                    labelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    unselectedLabelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal, fontSize: 14),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,

                    ),
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Color(0xff365EF1),
                    unselectedLabelColor: Color(0xffFFFFFF),
                    tabs: const [
                      Tab(
                        text: 'Open Loans',
                      ),
                      Tab(
                        text: 'Paid Loans',
                      ),
                      Tab(
                        text: 'Requests',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('No Transactions here yet!', style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xff333B63)),),
                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore',textAlign: TextAlign.center,style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff333B63)),)
                    ],
                  ),
                ),
              ),
/*
              Expanded(
                child: TabBarView(children: [],
                  // controller: cont.tabController,
                ),
              ),
*/
            ],
          ),
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
      height: 30,
      width: 30,
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

  customInput(String head, String hint) {
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
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Color(0xd304ffe),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0x735c6371),
                ),
              ),
              // keyboardType: TextInputType.number,

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

}
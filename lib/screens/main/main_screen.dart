import 'package:cfl/controllers/main_controller.dart';
import 'package:cfl/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainScreenController cont = Get.put(MainScreenController());


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Center(
        child: cont.widgetOptions.elementAt(cont.selectedIndex.value),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffEBEFFE),
        height: 65,
        child: Container(
          // height: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildNavItem('assets/icons/home.png', 0),
              buildNavItem('assets/icons/history.png', 1),
              buildNavItem('assets/icons/chart.png', 2),
              // buildNavItem('assets/icons/gift.png', 3),
              buildNavItem('assets/icons/profile.png', 3),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildNavItem(String image, int index) {
    return GestureDetector(
      onTap: () => cont.onItemTapped(index),
      child: Container(
        width: 43,
        height: 43,
        decoration: BoxDecoration(
          color: cont.selectedIndex.value == index ? Color(0xff1354D1) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(9),
        child: Image.asset(
          image,
          width: 24,
          color: cont.selectedIndex.value == index ? Colors.white : Color(0xff333B63),
        ),
      ),
    );
  }
}

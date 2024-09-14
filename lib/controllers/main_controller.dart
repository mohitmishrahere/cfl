import 'package:cfl/screens/nav/history_screen.dart';
import 'package:cfl/screens/nav/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainScreenController extends GetxController {
  final name = ''.obs;
  final profilePic = ''.obs;
  var selectedIndex = 0.obs;

  List<Widget> widgetOptions = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      name.value = Get.arguments[0];
      profilePic.value = Get.arguments[1];
    }
    widgetOptions = <Widget>[
      HomeScreen(
          name: name.value.split(' ').first.capitalizeFirst.toString(),
          profilePic: profilePic.value),
      History(),
      Text('Chart Page'),
      // Text('Gift Page'),
      Text('Profile Page'),
    ];
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}

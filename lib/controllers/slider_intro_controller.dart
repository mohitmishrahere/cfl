import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  PageController pageController = PageController();
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ever(currentPage, (_) => changePage());
    changePage();
  }





  void changePage() {
    Future.delayed(Duration(seconds: 3), () {
      currentPage.value = (currentPage.value + 1) % 3;
      if(pageController.hasClients){
        pageController.animateToPage(
          currentPage.value,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }


}
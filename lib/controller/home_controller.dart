import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/screens/home_screen.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    timer();
    super.onInit();
  }

  void timer() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const HomeScreen());
    });
  }
}

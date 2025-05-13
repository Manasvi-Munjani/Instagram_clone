import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.timer();
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppImageConst.appInstagram,
              height: 70,
              width: 70,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'from',
                  style: TextStyle(
                    color: AppColorConst.appGray,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Image.asset(
                  AppImageConst.appMeta,
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

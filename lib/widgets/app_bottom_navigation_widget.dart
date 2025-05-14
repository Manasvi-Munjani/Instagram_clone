import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';

class AppBottomNavigationWidget extends StatelessWidget {
  const AppBottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: AppColorConst.appBlack,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColorConst.appWhite,
        unselectedItemColor: AppColorConst.appWhite,
        currentIndex: homeController.selected.value,
        onTap: homeController.selectIcon,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              homeController.selected.value == 0
                  ? Icons.home
                  : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              homeController.selected.value == 1 ? Icons.search : Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              homeController.selected.value == 2
                  ? Icons.movie_creation_rounded
                  : Icons.movie_creation_outlined,
            ),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              homeController.selected.value == 3
                  ? Icons.person
                  : Icons.person_outline,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

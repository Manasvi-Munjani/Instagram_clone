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

    final List<IconData> iconsFilled = [
      Icons.home,
      Icons.search,
      // Icons.add_box,
      Icons.movie_creation_rounded,
      Icons.person,
    ];

    final List<IconData> iconsOutlined = [
      Icons.home_outlined,
      Icons.search,
      // Icons.add_box_outlined,
      Icons.movie_creation_outlined,
      Icons.person_outline,
    ];

    return Obx(
      () => Container(
        color: AppColorConst.appBlack,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            return GestureDetector(
              onTap: () {
                homeController.selectIcon(index);
              },
              child: Icon(
                homeController.selected.value == index
                    ? iconsFilled[index]
                    : iconsOutlined[index],
                color: AppColorConst.appWhite,
                size: 22,
              ),
            );
          }),
        ),
      ),
    );
  }
}

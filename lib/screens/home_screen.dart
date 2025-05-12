import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/constant/appimage_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          children: [
            Image.asset(
              AppImageConst.appInstagramText,
              height: 35,
              width: 120,
            ),
            const Spacer(),
            const Icon(
              Icons.add_box_outlined,
              color: AppColorConst.appWhite,
            ),
            const SizedBox(width: 15),
            const Icon(
              Icons.favorite_border_rounded,
              color: AppColorConst.appWhite,
            ),
            const SizedBox(width: 15),
            const Icon(
              Icons.message_rounded,
              color: AppColorConst.appWhite,
            )
          ],
        ),
      ),
    );
  }
}

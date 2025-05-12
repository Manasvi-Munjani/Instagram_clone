import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appimage_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            AppImageConst.appBackground,
            fit: BoxFit.cover,
          ),
        ),
        Image.asset(AppImageConst.appInstagramText)
      ],),
    );
  }
}

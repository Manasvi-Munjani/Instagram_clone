import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/photo_view_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,

      appBar: AppBar(
        backgroundColor: AppColorConst.appBlack,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColorConst.appWhite),
          onPressed: () {
            Get.to(()=> HomeScreen());
          },
        ),
        title: const Text(
          'Favorite Screen',
          style: TextStyle(
            color: AppColorConst.appWhite,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _favoritePostGrid(),
      ),
    );
  }

  Widget _favoritePostGrid() {
    final postImages = [
      'assets/images/nature.jpg',
      'assets/images/nature2.png',
      'assets/images/nature.jpg',
      'assets/images/nature2.png',
      'assets/images/post1.png',
      'assets/images/nature.jpg',
      'assets/images/nature.jpg',
      'assets/images/nature2.png',
      'assets/images/nature.jpg',
      'assets/images/nature2.png',
      'assets/images/post1.png',
      'assets/images/nature.jpg',
    ];

    List<Widget> imageWidgets = [];

    for (var img in postImages) {
      imageWidgets.add(
        GestureDetector(
          onTap: () => Get.off(() => Photoviewscreen(imageURL: img)),
          child: SizedBox(
            height: 150,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: imageWidgets,
    );
  }
}

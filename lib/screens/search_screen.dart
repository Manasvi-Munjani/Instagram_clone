import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/screens/photo_view_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: TextField(
                style: const TextStyle(
                  color: AppColorConst.appLightGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColorConst.appSearchBlack,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColorConst.appLightGray,
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: AppColorConst.appLightGray,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeController.postList.length,
              // itemCount: postImages.length,
              itemBuilder: (context, index) {
                final posts = homeController.postList[index];
                return GestureDetector(
                  onTap: () => Get.off(() => Photoviewscreen(
                        imageURL: posts['postImage'], /*postImages[index]*/
                      )),
                  child: ClipRRect(
                    child: Image.network(
                      // postImages[index],
                      posts['postImage'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static final List<String> postImages = [
    'assets/images/nature.jpg',
    'assets/images/post1.png',
    'assets/images/nature2.png',
    'assets/images/book.jpg',
    'assets/images/post2.jpg',
    'assets/images/book2.jpg',
    'assets/images/doraemon.jpg',
    'assets/images/flower.jpg',
    'assets/images/nature.jpg',
    'assets/images/post1.png',
    'assets/images/nature2.png',
    'assets/images/book.jpg',
    'assets/images/post2.jpg',
    'assets/images/book2.jpg',
    'assets/images/doraemon.jpg',
    'assets/images/flower.jpg',
  ];
}

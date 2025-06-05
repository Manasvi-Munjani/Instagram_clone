import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/models/posts_model.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/likes_details_screen.dart';
import 'package:instagram_clone/screens/photo_view_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      appBar: AppBar(
        backgroundColor: AppColorConst.appBlack,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColorConst.appWhite),
          onPressed: () {
            Get.to(() => const HomeScreen());
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
        child: _favoritePostGrid(homeController),
      ),
    );
  }

  Widget _favoritePostGrid(HomeController homeController) {
    return Obx(() {
      final likedPosts = homeController.postList
          .where((post) => post['isFavorite'].value == true)
          .toList();

      if (likedPosts.isEmpty) {
        return const Center(
          child: Text(
            'No liked posts yet.',
            style: TextStyle(
              color: AppColorConst.appWhite,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }

      return GridView.builder(
        itemCount: likedPosts.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          final post = likedPosts[index];

          return GestureDetector(
            onTap: () {
              List<PostsModel> likedPostModels =
                  likedPosts.map((e) => PostsModel.fromMap(e)).toList();

              Get.to(() => LikesDetailsScreen(
                    posts: likedPostModels,
                    initialIndex: index,
                  ));
            },
            child: SizedBox(
              height: 150,
              child: Image.network(
                post['postImage'],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    });
  }
}

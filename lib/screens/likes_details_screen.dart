import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/models/posts_model.dart';
import 'package:instagram_clone/screens/likes_screen.dart';

class LikesDetailsScreen extends StatelessWidget {
  final List<PostsModel> posts;
  final int initialIndex;

  const LikesDetailsScreen(
      {super.key, required this.posts, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final likedPosts = homeController.postList
        .where((post) => post['isFavorite'].value == true)
        .toList();

    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      appBar: AppBar(
        backgroundColor: AppColorConst.appBlack,
        leading: GestureDetector(
          onTap: () => Get.to(() => const LikesScreen()),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColorConst.appWhite,
            size: 20,
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: initialIndex),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          // final post = posts[index];
          final post = likedPosts[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColorConst.appYellow,
                            AppColorConst.appOrange,
                            AppColorConst.appRed,
                            AppColorConst.appPurple,
                            AppColorConst.appDeepPurple,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorConst.appBlack,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            AppImageConst.appDpImage,
                            fit: BoxFit.cover,
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeController.userModel.value!.username,
                          style: const TextStyle(
                            color: AppColorConst.appWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          post['caption']!,
                          style: const TextStyle(
                            color: AppColorConst.appGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Image.network(
                  post['postImage'],
                  // post.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Obx(() {
                      int index = homeController.postList.indexWhere(
                        (p) => p['postId'] == post['postId'],
                      );
                      if (index == -1) return const SizedBox();

                      var currentPost = homeController.postList[index];
                      bool isLiked = currentPost['isFavorite'].value;

                      return GestureDetector(
                        onTap: () async {
                          final result = await homeController.likesData(
                            postOwnerId: currentPost['postOwnerId'],
                            postId: currentPost['postId'],
                            postData: currentPost,
                          );

                          currentPost['isFavorite'].value = result['isLiked'];
                          currentPost['likes'] = "${result['likeCount']} likes";
                          homeController.postList[index] =
                              Map<String, dynamic>.from(currentPost);
                        },
                        child: isLiked
                            ? const Icon(Icons.favorite_rounded,
                                color: AppColorConst.appRed)
                            : const Icon(Icons.favorite_outline_rounded,
                                color: AppColorConst.appWhite),
                      );
                    }),
                    const SizedBox(width: 12),
                    const Icon(Icons.messenger_outline_outlined,
                        color: AppColorConst.appWhite),
                    const SizedBox(width: 12),
                    const Icon(Icons.send, color: AppColorConst.appWhite),
                    const Spacer(),
                    const Icon(Icons.bookmark_outline,
                        color: AppColorConst.appWhite),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    post['description']!,
                    style: TextStyle(
                      color: AppColorConst.appWhite.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

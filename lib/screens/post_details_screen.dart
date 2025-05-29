import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/models/posts_model.dart';
import 'package:instagram_clone/screens/profile_screen.dart';

class PostDetailsScreen extends StatelessWidget {
  final List<PostsModel> posts;
  final int initialIndex;

  const PostDetailsScreen(
      {super.key, required this.posts, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      appBar: AppBar(
        backgroundColor: AppColorConst.appBlack,
        leading: GestureDetector(
          onTap: () => Get.to(() => const ProfileScreen()),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColorConst.appWhite,
            size: 20,
          ),
        ),
        title: const Center(
          child: Column(
            children: [
              Text(
                'Posts',
                style: TextStyle(
                  color: AppColorConst.appWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'UserName',
                style: TextStyle(
                    color: AppColorConst.appWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: initialIndex),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
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
                          'name',
                          style: TextStyle(
                            color: AppColorConst.appWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          post.caption!,
                          style: TextStyle(
                            color: AppColorConst.appGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColorConst.appWhite,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Image.network(
                  post.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.favorite_outline_rounded,
                        color: AppColorConst.appWhite),
                    SizedBox(width: 12),
                    Icon(Icons.messenger_outline_outlined,
                        color: AppColorConst.appWhite),
                    SizedBox(width: 12),
                    Icon(Icons.send, color: AppColorConst.appWhite),
                    Spacer(),
                    Icon(Icons.bookmark_outline, color: AppColorConst.appWhite),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    post.description!,
                    style: TextStyle(
                      color: AppColorConst.appWhite.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
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

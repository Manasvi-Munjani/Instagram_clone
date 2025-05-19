import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/constant/appimage_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/screens/order_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/reels_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:instagram_clone/widgets/app_bottom_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    final List<Widget> screens = [
      _homeContent(homeController),
      const SearchScreen(),
      const OrderScreen(),
      const ReelsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: Obx(() => screens[homeController.selected.value]),
      bottomNavigationBar: const AppBottomNavigationWidget(),
    );
  }

  Widget _homeContent(HomeController homeController) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 11,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    AppImageConst.appDpImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: AppColorConst.appBlue,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColorConst.appBlack,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: AppColorConst.appWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Your Story",
                            style: TextStyle(
                              color: AppColorConst.appWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                  width: 61,
                                  height: 61,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "User",
                            style: TextStyle(
                              color: AppColorConst.appWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 1000,
            child: ListView.builder(
              itemCount: homeController.postList.length,
              itemBuilder: (context, index) {
                final post = homeController.postList[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Row(
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
                                  post['userImage'],
                                  fit: BoxFit.cover,
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            post['username'],
                            style: const TextStyle(
                              color: AppColorConst.appWhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_horiz,
                            color: AppColorConst.appWhite,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(post['postImage']),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Row(
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () => homeController.favoriteIcon(),
                              child: homeController.isFavorite.value
                                  ? const Icon(Icons.favorite_rounded,
                                      color: AppColorConst.appRed)
                                  : const Icon(Icons.favorite_outline_rounded,
                                      color: AppColorConst.appWhite),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.chat_bubble_outline,
                              color: AppColorConst.appWhite,
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.send,
                              color: AppColorConst.appWhite,
                            ),
                          ),
                          const Spacer(),
                          Obx(
                            () => GestureDetector(
                              onTap: () => homeController.saveData(),
                              child: homeController.isSave.value
                                  ? const Icon(
                                      Icons.bookmark,
                                      color: AppColorConst.appWhite,
                                    )
                                  : const Icon(
                                      Icons.bookmark_border,
                                      color: AppColorConst.appWhite,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        post['likes'],
                        style: const TextStyle(
                          color: AppColorConst.appWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        post['caption'],
                        style: const TextStyle(
                          color: AppColorConst.appWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'View all 103 comments',
                        style: TextStyle(
                          color: AppColorConst.appGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Obx(
                        () {
                          final post = homeController.postList[index];
                          final isFocused = post['isFocused'] as RxBool;

                          return Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  AppImageConst.appDpImage,
                                  fit: BoxFit.cover,
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  focusNode: post['focusNode'] as FocusNode,
                                  decoration: const InputDecoration(
                                    hintText: "Add a comment...",
                                    hintStyle: TextStyle(
                                      color: AppColorConst.appGray,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    color: AppColorConst.appWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              isFocused.value
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.send,
                                        color: AppColorConst.appBlue,
                                        size: 18,
                                      ),
                                      onPressed: () {},
                                    )
                                  : const SizedBox(),
                              const Icon(Icons.favorite,
                                  color: AppColorConst.appRed, size: 16),
                              const SizedBox(width: 8),
                              const Icon(Icons.emoji_emotions,
                                  color: AppColorConst.appYellow, size: 16),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                },
                                child: const Icon(Icons.add_circle_outline,
                                    color: AppColorConst.appGray, size: 16),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: Text(
                        post['timeAgo'],
                        style: const TextStyle(
                          color: AppColorConst.appGray,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

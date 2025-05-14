import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/constant/appimage_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
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
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
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
                              width: 58,
                              height: 58,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
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
              },
            ),
          ),

          /*Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                              AppImageConst.appPostDp,
                              fit: BoxFit.cover,
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "marvel",
                        style: TextStyle(
                          color: AppColorConst.appWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.more_horiz,
                          color: AppColorConst.appWhite),
                    ],
                  ),
                ),
                Image.asset(
                  AppImageConst.appPost,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: AppColorConst.appRed),
                      SizedBox(width: 12),
                      Icon(Icons.chat_bubble_outline,
                          color: AppColorConst.appWhite),
                      SizedBox(width: 12),
                      Icon(Icons.send, color: AppColorConst.appWhite),
                      Spacer(),
                      Icon(Icons.bookmark_border,
                          color: AppColorConst.appWhite),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '105,762 likes',
                    style: TextStyle(
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
                    'marvel We can’t get enough of this dynamic duo. Marvel Studios\' @HawkeyeOfficial is...',
                    style: TextStyle(
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
                    () => Row(
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
                            focusNode: homeController.focusNode,
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
                        if (homeController.isFocused.value)
                          IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: AppColorConst.appBlue,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                        const Icon(Icons.favorite,
                            color: AppColorConst.appRed, size: 16),
                        const SizedBox(width: 8),
                        const Icon(Icons.emoji_emotions,
                            color: AppColorConst.appYellow, size: 16),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            */
          /*setState(() {
                            _showEmojiPicker = !_showEmojiPicker;
                          });*/
          /*
                          },
                          child: const Icon(Icons.add_circle_outline,
                              color: AppColorConst.appGray, size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    '13 hours ago',
                    style: TextStyle(
                      color: AppColorConst.appGray,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),*/

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
                          const Icon(Icons.more_horiz,
                              color: AppColorConst.appWhite),
                        ],
                      ),
                    ),
                    Image.asset(post['postImage']),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: AppColorConst.appRed),
                          SizedBox(width: 12),
                          Icon(Icons.chat_bubble_outline,
                              color: AppColorConst.appWhite),
                          SizedBox(width: 12),
                          Icon(Icons.send, color: AppColorConst.appWhite),
                          Spacer(),
                          Icon(Icons.bookmark_border,
                              color: AppColorConst.appWhite),
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
                        () => Row(
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
                                focusNode: homeController.focusNode,
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
                            if (homeController.isFocused.value)
                              IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: AppColorConst.appBlue,
                                  size: 18,
                                ),
                                onPressed: () {},
                              ),
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
                        ),
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

/*
                Image.asset(
                  AppImageConst.appNature,
                  fit: BoxFit.cover,
                  height: 500,
                  width: double.infinity,
                ),

                Image.asset(
                  AppImageConst.appNature2,
                  fit: BoxFit.cover,
                  height: 500,
                  width: double.infinity,
                ),

*/

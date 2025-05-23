import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/constant/appimage_const.dart';
import 'package:instagram_clone/controller/reels_controller.dart';
import 'package:instagram_clone/screens/audio_screen.dart';
import 'package:instagram_clone/screens/photo_view_screen.dart';
import 'package:instagram_clone/widgets/reels_widget.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReelsController());

    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reelsData.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned.fill(
                child: reelsData[index].endsWith('.mp4')
                    ? ReelWidget(videoUrl: reelsData[index]) // ✅ Video
                    : Image.asset(
                        reelsData[index],
                        fit: BoxFit.fill,
                      ),

                /*child: reelsData.isEmpty
                    ? ReelWidget(videoUrl: reelsData[index])
                    : Image.asset(
                        reelsData[index],
                        fit: BoxFit.fill,
                      ),*/
              ),
              const Positioned(
                top: 20,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reels',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: AppColorConst.appWhite,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.favorite_border,
                        color: AppColorConst.appWhite, size: 24),
                    const SizedBox(height: 5),
                    const Text(
                      '31.7k',
                      style: TextStyle(color: AppColorConst.appWhite),
                    ),
                    const SizedBox(height: 20),
                    const Icon(Icons.mode_comment_outlined,
                        color: AppColorConst.appWhite, size: 24),
                    const SizedBox(height: 5),
                    const Text(
                      '547',
                      style: TextStyle(color: AppColorConst.appWhite),
                    ),
                    const SizedBox(height: 20),
                    const Icon(Icons.send,
                        color: AppColorConst.appWhite, size: 24),
                    const SizedBox(height: 20),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColorConst.appWhite,
                      size: 24,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Get.off(() => const AudioScreen()),
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColorConst.appWhite,
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          AppImageConst.appNature,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.off(
                            () => const Photoviewscreen(
                              imageURL: 'assets/images/nature.jpg',
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/nature.jpg'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'earthfervor',
                          style: TextStyle(
                            color: AppColorConst.appWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColorConst.appWhite,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                              color: AppColorConst.appWhite,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Unbelievable climbing speed by a ...',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Icon(
                          Icons.music_note,
                          size: 16,
                          color: AppColorConst.appWhite,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'earthfervor • Original Audio',
                          style: TextStyle(
                            color: AppColorConst.appWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static final List<String> reelsData = [
    'assets/images/book.jpg',
    'assets/images/book2.jpg',
    'assets/images/doraemon.jpg',
    'assets/images/post2.jpg',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
  ];
}

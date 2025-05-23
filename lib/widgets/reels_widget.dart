import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controller/reels_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';


class ReelWidget extends StatelessWidget {
  final String videoUrl;
  const ReelWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final ReelsController reelsController = Get.find();
    final controller = reelsController.getController(videoUrl);

    return VisibilityDetector(
      key: Key(videoUrl),
      onVisibilityChanged: (info) {
        reelsController.onVisibilityChanged(videoUrl, info);
      },
      child: GetBuilder<ReelsController>(
        builder: (_) {
          if (!controller.value.isInitialized) {
            return const Center(child: CircularProgressIndicator()); // Shown only briefly
          }
          return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          );
        },
      ),
    );
  }
}


/*class ReelWidget extends StatelessWidget {
  final String videoUrl;

  const ReelWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final ReelsController reelsController = Get.find();
    final controller = reelsController.getController(videoUrl);

    return VisibilityDetector(
      key: Key(videoUrl),
      onVisibilityChanged: (info) {
        reelsController.onVisibilityChanged(videoUrl, info);
      },
      child: GetBuilder<ReelsController>(
        builder: (_) {
          if (!controller.value.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }
          return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          );
        },
      ),
    );
  }
}*/

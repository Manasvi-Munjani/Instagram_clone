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
    final ReelsController reelsController = Get.put(ReelsController());

    return VisibilityDetector(
      key: Key(videoUrl),
      onVisibilityChanged: reelsController.onVisibilityChanged,
      child: reelsController.controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: reelsController.controller.value.aspectRatio,
              child: VideoPlayer(reelsController.controller),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

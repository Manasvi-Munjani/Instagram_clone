import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReelsController extends GetxController {
  final Map<String, VideoPlayerController> _controllers = {};

  VideoPlayerController getController(String url) {
    if (!_controllers.containsKey(url)) {
      final controller = VideoPlayerController.network(url);
      _controllers[url] = controller;

      controller.initialize().then((_) {
        controller.setLooping(true);
        controller.play();
        update();
      }).catchError((e) {
        debugPrint("Error initializing video: $e");
      });
    }
    return _controllers[url]!;
  }

  void onVisibilityChanged(String url, VisibilityInfo info) {
    final controller = _controllers[url];
    if (controller != null && controller.value.isInitialized) {
      if (info.visibleFraction > 0.5) {
        controller.play();
      } else {
        controller.pause();
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}

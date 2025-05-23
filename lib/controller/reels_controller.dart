/*
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReelsController extends GetxController {
  late VideoPlayerController controller;

  @override
  void onInit() {
    controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        controller.play();
        controller.setLooping(true);
      });
    super.onInit();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.6) {
      controller.play();
    } else {
      controller.pause();
    }
  }

}
*/

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
        update(); // Ensures GetBuilder rebuilds
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
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }
}

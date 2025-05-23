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

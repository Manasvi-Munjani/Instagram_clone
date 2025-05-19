import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController{
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString musicPath = ''.obs;

  void setMusic(String path) async {
    musicPath.value = path;
    await player.setFilePath(path);
  }

  void playPauseMusic() async {
    if (isPlaying.value) {
      await player.pause();
    } else {
      await player.play();
    }
    isPlaying.toggle();
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
/*import 'package:get/get.dart';
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
}*/

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:file_picker/file_picker.dart';

class MusicController extends GetxController {
  final AudioPlayer player = AudioPlayer();
  var isPlaying = false.obs;
  var currentFile = ''.obs;

  Future<void> pickAudioFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null && result.files.single.path != null) {
      currentFile.value = result.files.single.name;
      await player.setFilePath(result.files.single.path!);
    }
  }

  void playAudio() async {
    await player.play();
    isPlaying.value = true;
  }

  void pauseAudio() async {
    await player.pause();
    isPlaying.value = false;
  }

  void stopAudio() async {
    await player.stop();
    isPlaying.value = false;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}

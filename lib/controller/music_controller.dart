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
import 'package:file_picker/file_picker.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
  final AudioPlayer player = AudioPlayer();

  var isPlaying = false.obs;
  var currentFile = ''.obs;

  /// Pick an audio file using FilePicker
  Future<void> pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null && result.files.single.path != null) {
      currentFile.value = result.files.single.path!;
      await player.setFilePath(currentFile.value);
      isPlaying.value = false;
    }
  }

  /// Play the selected audio file
  Future<void> playAudio() async {
    if (currentFile.value.isNotEmpty) {
      await player.play();
      isPlaying.value = true;
    }
  }

  /// Pause the audio
  Future<void> pauseAudio() async {
    await player.pause();
    isPlaying.value = false;
  }

  /// Stop the audio
  Future<void> stopAudio() async {
    await player.stop();
    isPlaying.value = false;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}

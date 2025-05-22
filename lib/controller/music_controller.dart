import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
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

/*
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
  final AudioPlayer _player = AudioPlayer();

  var isPlaying = false.obs;
  var musicPath = ''.obs;

  Future<void> pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null && result.files.single.path != null) {
      setMusic(result.files.single.path!);
    }
  }

  Future<void> setMusic(String path) async {
    musicPath.value = path;
    await _player.setFilePath(path);
    isPlaying.value = false;
  }

  Future<void> playPauseMusic() async {
    if (isPlaying.value) {
      await _player.pause();
      isPlaying.value = false;
    } else {
      await _player.play();
      isPlaying.value = true;
    }
  }

  Future<void> playAudio() async {
    if (musicPath.value.isNotEmpty) {
      await _player.play();
      isPlaying.value = true;
    }
  }

  Future<void> pauseAudio() async {
    await _player.pause();
    isPlaying.value = false;
  }

  Future<void> stopAudio() async {
    await _player.stop();
    isPlaying.value = false;
  }

  @override
  void onClose() {
    _player.dispose();
    super.onClose();
  }
}
*/

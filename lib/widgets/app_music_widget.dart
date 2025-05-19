import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controller/music_controller.dart';

class AppMusicWidget extends StatelessWidget {
  AppMusicWidget({super.key});

  final MusicController musicController = Get.put(MusicController());

  Future<void> pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null && result.files.single.path != null) {
      musicController.setMusic(result.files.single.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return musicController.musicPath.isNotEmpty
              ? Text(
                  "Selected: ${File(musicController.musicPath.value).path.split('/').last}",
                  style: const TextStyle(color: Colors.white),
                )
              : const Text("No music selected",
                  style: TextStyle(color: Colors.white));
        }),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickAudioFile,
              child: const Text("Pick Music"),
            ),
            const SizedBox(width: 10),
            Obx(() => IconButton(
                  icon: Icon(
                    musicController.isPlaying.value
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () => musicController.playPauseMusic(),
                )),
          ],
        ),
      ],
    );
  }
}

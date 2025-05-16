import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Photoviewscreen extends StatelessWidget {
  final String imageURL;

  const Photoviewscreen({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: const AssetImage("assets/large-image.jpg"),
      ),
    );
  }
}


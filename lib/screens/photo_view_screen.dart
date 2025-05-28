import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:photo_view/photo_view.dart';

class Photoviewscreen extends StatelessWidget {
  final String imageURL;

  const Photoviewscreen({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: PhotoView(
        imageProvider: NetworkImage(imageURL),
        initialScale: PhotoViewComputedScale.contained * 0.8,
        backgroundDecoration: const BoxDecoration(
          color: AppColorConst.appBlack,
        ),
      ),
    );
  }
}

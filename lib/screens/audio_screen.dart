import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Row(
        children: [
          Text(
            'Audio',
            style: TextStyle(
              color: AppColorConst.appGray,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Spacer(),
          Icon(
            Icons.bookmark_border,
            color: AppColorConst.appGray,
          ),
          SizedBox(width: 5),
          Icon(
            Icons.more_vert_outlined,
            color: AppColorConst.appGray,
          )
        ],
      ),
    );
  }
}

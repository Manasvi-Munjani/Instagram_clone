import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  'Reels',
                  style: TextStyle(
                    color: AppColorConst.appWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.camera_alt_outlined,
                  color: AppColorConst.appWhite,
                )
              ],
            ),
            Icon(
              Icons.favorite_outline_rounded,
              color: AppColorConst.appWhite,
            ),
            Text(
              '31.2k',
              style: TextStyle(color: AppColorConst.appWhite),
            ),
            Icon(
              Icons.mode_comment_outlined,
              color: AppColorConst.appWhite,
            ),
            Text(
              '510',
              style: TextStyle(color: AppColorConst.appWhite),
            ),
            Icon(
              Icons.send,
              color: AppColorConst.appWhite,
            ),
            Icon(
              Icons.more_horiz,
              color: AppColorConst.appWhite,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: AppColorConst.appWhite,
                ),
                Text(
                  'Audio',
                  style: TextStyle(
                    color: AppColorConst.appWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.bookmark_border,
                  color: AppColorConst.appWhite,
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.more_vert_outlined,
                  color: AppColorConst.appWhite,
                )
              ],
            ),
            Text(
              'Origin audio',
              style: TextStyle(
                color: AppColorConst.appOffWhite,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '_.zenkaii',
              style: TextStyle(
                color: AppColorConst.appOffWhite,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColorConst.appBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Use Audio',
                  style: TextStyle(
                    color: AppColorConst.appWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

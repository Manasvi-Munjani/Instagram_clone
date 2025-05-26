import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Post',
              style: TextStyle(
                color: AppColorConst.appWhite,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Add Caption',
                  hintStyle: TextStyle(
                      color: AppColorConst.appGray,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add description',
                hintStyle: TextStyle(
                    color: AppColorConst.appGray,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

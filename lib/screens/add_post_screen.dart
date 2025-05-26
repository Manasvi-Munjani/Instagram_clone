import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: Column(
        children: [
          Text(
            'Add Post',
            style: TextStyle(
              color: AppColorConst.appWhite,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Add Caption',
                hintStyle: TextStyle(color: AppColorConst.appGray,fontWeight: FontWeight.w500,fontSize: 14),
                border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}

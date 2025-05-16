import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: TextField(
          decoration: InputDecoration(
        filled: true,
        fillColor: AppColorConst.appSearchBlack,
        prefixIcon: const Icon(
          Icons.search,
          color: AppColorConst.appLightGray,
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(
            color: AppColorConst.appLightGray,
            fontSize: 17,
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: _profileData(),
    );
  }

  Widget _profileData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(13),
            child: Row(
              children: [
                Text(
                  'john_scott',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColorConst.appWhite,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.add_box_outlined,
                  color: AppColorConst.appWhite,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.menu,
                  color: AppColorConst.appWhite,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(AppImageConst.appDpImage),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColorConst.appBlue,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColorConst.appBlack, width: 2),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Column(
                children: [
                  Text(
                    '5',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Post',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Column(
                children: [
                  Text(
                    '1000',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Column(
                children: [
                  Text(
                    '500',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Following',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Jonathan Scott',
            style: TextStyle(
              color: AppColorConst.appWhite,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Creative/Artistic',
            style: TextStyle(
              color: AppColorConst.appWhite,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'www.johnscott.com',
            style: TextStyle(
              color: AppColorConst.appWhite,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColorConst.appWhite),
                  ),
                  child: const Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(color: AppColorConst.appWhite),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColorConst.appWhite),
                ),
                child: const Center(
                  child: Icon(
                    Icons.expand_circle_down_outlined,
                    color: AppColorConst.appWhite,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

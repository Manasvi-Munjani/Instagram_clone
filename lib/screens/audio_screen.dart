import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/screens/reels_screen.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColorConst.appWhite),
                    onPressed: () => Get.to(() => const ReelsScreen()),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Audio',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.bookmark_border,
                      color: AppColorConst.appWhite),
                  const SizedBox(width: 15),
                  const Icon(Icons.more_vert_outlined,
                      color: AppColorConst.appWhite),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Original audio',
                        style: TextStyle(
                          color: AppColorConst.appWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '_.zenkaii',
                        style: TextStyle(
                          color: AppColorConst.appOffWhite,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColorConst.appBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Use Audio',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: 0,
                      onChanged: (val) {},
                      activeColor: AppColorConst.appWhite,
                      inactiveColor: AppColorConst.appOffWhite,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '0:00',
                    style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey[850],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

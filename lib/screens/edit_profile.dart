import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/profile_controller.dart';
import 'package:instagram_clone/validation/app_validation.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});



  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final ProfileController profileController = Get.put(ProfileController());
    final TextEditingController nameController = TextEditingController();
    final TextEditingController bioController = TextEditingController();
    final TextEditingController linkController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImageConst.appBackground2,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: AppColorConst.appWhite,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Get Started',
                  style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Please enter your detail to create an account ',
                  style: TextStyle(
                      color: AppColorConst.appWhite,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 25, right: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    style: const TextStyle(
                        color: AppColorConst.appGray, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Name...',
                      hintStyle: const TextStyle(
                          color: AppColorConst.appGray, fontSize: 12),
                      suffixIcon: const Icon(Icons.account_box_outlined,
                          color: AppColorConst.appGray, size: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: AppColorConst.appGray),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: AppColorConst.appBlue, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: AppColorConst.appGray),
                      ),
                    ),
                    validator: (value) =>
                        emptyValidation(value, 'Please enter your name'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: bioController,
                    style: const TextStyle(
                        color: AppColorConst.appGray, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Bio...',
                      hintStyle: const TextStyle(
                          color: AppColorConst.appGray, fontSize: 12),
                      suffixIcon: const Icon(Icons.email_outlined,
                          color: AppColorConst.appGray, size: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: AppColorConst.appGray),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: AppColorConst.appBlue, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: AppColorConst.appGray),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: linkController,
                    style: const TextStyle(
                        color: AppColorConst.appGray, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Link...',
                      hintStyle: const TextStyle(
                          color: AppColorConst.appGray, fontSize: 12),
                      suffixIcon: const Icon(Icons.email_outlined,
                          color: AppColorConst.appGray, size: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: AppColorConst.appGray),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: AppColorConst.appBlue, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: AppColorConst.appGray),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColorConst.appDarkBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        /*
                        if (formkey.currentState!.validate()) {
                          homeController.signupButton(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }*/
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: AppColorConst.appWhite, fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            color: AppColorConst.appBlue,
                            decoration: TextDecoration.underline,
                          ),
                          /*recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(
                                () => const LoginScreen(),
                              );
                            },*/
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// image
// - choose from library
// - remove current picture
// Name
// user name
// bio
// links

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/profile_controller.dart';
import 'package:instagram_clone/validation/app_validation.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final ProfileController profileController = Get.put(ProfileController());
    final TextEditingController nameController = TextEditingController();
    final TextEditingController bioController = TextEditingController();
    final TextEditingController linkController = TextEditingController();

    return Scaffold(
      body: Form(
        key: formkey,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppImageConst.appBackground2,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: AppColorConst.appWhite,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Get Started',
                    style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Please enter your detail to create an account ',
                    style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60, left: 25, right: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nameController,
                      style: const TextStyle(
                          color: AppColorConst.appGray, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Name...',
                        hintStyle: const TextStyle(
                            color: AppColorConst.appGray, fontSize: 12),
                        suffixIcon: const Icon(Icons.account_box_outlined,
                            color: AppColorConst.appGray, size: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: AppColorConst.appGray),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: AppColorConst.appBlue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: AppColorConst.appGray),
                        ),
                      ),
                      validator: (value) =>
                          emptyValidation(value, 'Please enter your name'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: bioController,
                      style: const TextStyle(
                          color: AppColorConst.appGray, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Bio...',
                        hintStyle: const TextStyle(
                            color: AppColorConst.appGray, fontSize: 12),
                        suffixIcon: const Icon(Icons.email_outlined,
                            color: AppColorConst.appGray, size: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: AppColorConst.appGray),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: AppColorConst.appBlue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: AppColorConst.appGray),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: linkController,
                      style: const TextStyle(
                          color: AppColorConst.appGray, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Link...',
                        hintStyle: const TextStyle(
                            color: AppColorConst.appGray, fontSize: 12),
                        suffixIcon: const Icon(Icons.email_outlined,
                            color: AppColorConst.appGray, size: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                          const BorderSide(color: AppColorConst.appGray),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: AppColorConst.appBlue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                          const BorderSide(color: AppColorConst.appGray),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          color: AppColorConst.appDarkBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            homeController.signupButton(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: AppColorConst.appWhite, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                              color: AppColorConst.appBlue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(
                                  () => const LoginScreen(),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

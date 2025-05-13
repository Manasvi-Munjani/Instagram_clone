import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appimage_const.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/validation/app_validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final HomeController homeController = Get.put(HomeController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                    'Welcome back',
                    style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Please enter your account details to sign in\nyour account ',
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
                      controller: emailController,
                      style: const TextStyle(
                          color: AppColorConst.appGray, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Email...',
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
                      validator: emailValidation,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => TextFormField(
                        controller: passwordController,
                        style: const TextStyle(
                            color: AppColorConst.appGray, fontSize: 14),
                        obscureText: homeController.obscureText.value,
                        decoration: InputDecoration(
                          hintText: 'Password...',
                          hintStyle: const TextStyle(
                              color: AppColorConst.appGray, fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColorConst.appGray),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: AppColorConst.appDarkBlue, width: 1.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: AppColorConst.appGray,
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: homeController.show,
                            child: Icon(
                              homeController.obscureText.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColorConst.appGray,
                              size: 20,
                            ),
                          ),
                        ),
                        validator: passwordValidation,
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
                            homeController.SignInButton(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          }
                        },
                        child: const Text(
                          'Login',
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
                            text: "Don't have an account? ",
                            style: TextStyle(color: AppColorConst.appWhite),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(
                              color: AppColorConst.appBlue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(
                                  () => const SignupScreen(),
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

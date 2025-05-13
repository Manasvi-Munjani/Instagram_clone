import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
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
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImageConst.appInstagramText,
                height: 35,
                width: 120,
              ),
              TextFormField(
                style:
                const TextStyle(color: AppColorConst.appGray, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Email...',
                  hintStyle: const TextStyle(
                      color: AppColorConst.appGray, fontSize: 12),
                  suffixIcon: const Icon(Icons.email_outlined,
                      color: AppColorConst.appGray, size: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColorConst.appGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: AppColorConst.appBlue, width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColorConst.appGray),
                  ),
                ),
                validator: emailValidation,
              ),
              const SizedBox(height: 20),
              Obx(
                    () => TextFormField(
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
                          color: AppColorConst.appBlue, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                        const BorderSide(color: AppColorConst.appGray)),
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
                    color: AppColorConst.appWhite,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style:
                    TextStyle(color: AppColorConst.appGray, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.white),
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
    );
  }
}

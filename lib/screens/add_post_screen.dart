import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/validation/app_validation.dart';

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
            const Text(
              'Add Post',
              style: TextStyle(
                color: AppColorConst.appWhite,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Add Caption',
                hintStyle: TextStyle(
                    color: AppColorConst.appGray,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  emptyValidation(value, 'Please add Caption'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Add description',
                hintStyle: TextStyle(
                    color: AppColorConst.appGray,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  emptyValidation(value, 'Please add description'),
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
                  if (formkey.currentState!.validate()) {}
                },
                child: const Text(
                  'Add Post',
                  style: TextStyle(color: AppColorConst.appWhite, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

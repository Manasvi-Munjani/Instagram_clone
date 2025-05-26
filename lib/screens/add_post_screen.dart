/*
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
*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/validation/app_validation.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final formKey = GlobalKey<FormState>();
  File? _selectedImage;

  final TextEditingController captionController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text(
                'Add Post',
                style: TextStyle(
                  color: AppColorConst.appWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: _pickImage,
                child: _selectedImage == null
                    ? Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColorConst.appGray.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Tap to select image',
                            style: TextStyle(
                              color: AppColorConst.appGray,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _selectedImage!,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              const SizedBox(height: 15),

              // Caption Field
              TextFormField(
                controller: captionController,
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

              // Description Field
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Add Description',
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

              // Add Post Button
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    color: AppColorConst.appDarkBlue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (_selectedImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please select an image')),
                        );
                      } else {
                        // Upload to backend / Firebase logic here
                      }
                    }
                  },
                  child: const Text(
                    'Add Post',
                    style:
                        TextStyle(color: AppColorConst.appWhite, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

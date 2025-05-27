import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/validation/app_validation.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _captionController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      appBar: AppBar(
        backgroundColor: AppColorConst.appBlack,
        title: const Text(
          'Add Post',
          style: TextStyle(
            color: AppColorConst.appWhite,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /* GestureDetector(
                  onTap: homeController.pickImage,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColorConst.appGray.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: homeController.pickedImage == null
                        ? const Center(
                            child: Text(
                              'Tap to select image *',
                              style: TextStyle(color: AppColorConst.appGray),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: kIsWeb
                                ? (homeController.webImage != null
                                    ? Image.memory(homeController.webImage!,
                                        fit: BoxFit.cover)
                                    : const SizedBox())
                                : (homeController.fileImage != null
                                    ? Image.file(homeController.fileImage!,
                                        fit: BoxFit.cover)
                                    : const SizedBox()),
                          ),
                  ),
                ),*/

                GetBuilder<HomeController>(builder: (_) {
                  return GestureDetector(
                    onTap: homeController.pickImage,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColorConst.appGray.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: homeController.pickedImage.value == null
                          ? const Center(
                              child: Text(
                                'Tap to select image',
                                style: TextStyle(color: AppColorConst.appGray),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: kIsWeb
                                  ? Image.memory(
                                      homeController.webImage!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      homeController.fileImage!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _captionController,
                  decoration: const InputDecoration(
                    hintText: 'Add Caption',
                    hintStyle: TextStyle(
                      color: AppColorConst.appGray,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Add Description',
                    hintStyle: TextStyle(
                      color: AppColorConst.appGray,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorConst.appDarkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        homeController.postData(
                          caption: _captionController.text.trim(),
                          description: _descriptionController.text.trim(),
                          image: homeController.uploadedImageUrl.value,
                        );
                        if (homeController.pickedImage == null) {
                          Fluttertoast.showToast(msg: 'Please select an image');
                          return;
                        }
                        Fluttertoast.showToast(msg: 'Post Update successfully');
                        Get.to(() => const ProfileScreen());
                      }
                    },
                    child: const Text(
                      'Add Post',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
=================== Support only Mobile ===================

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
*/

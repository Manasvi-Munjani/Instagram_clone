import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/validation/app_validation.dart';

/*class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    // final ProfileController profileController = Get.put(ProfileController());
    final TextEditingController nameController = TextEditingController();
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController bioController = TextEditingController();
    final TextEditingController linkController = TextEditingController();

    return Scaffold(
      body: Obx(() {
        final HomeController homeController = Get.put(HomeController());
        final user = homeController.userModel.value;
        return Form(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    const Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: AppColorConst.appWhite,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Center(child: CircleAvatar()),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 60, left: 25, right: 25),
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
                        controller: userNameController,
                        style: const TextStyle(
                            color: AppColorConst.appGray, fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'Username...',
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
                          hintText: 'Add links',
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
                              homeController.editProfile();
                            }
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                                color: AppColorConst.appWhite, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}*/

// image
// - choose from library
// - remove current picture
// Name
// user name
// bio
// links

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: Obx(() {
        final user = homeController.userModel.value;

        if (user != null) {
          nameController.text = user.name ?? '';
          userNameController.text = user.username ?? '';
          bioController.text = user.bio ?? '';
          linkController.text = user.link ?? '';
        }

        return Form(
          key: formKey,
          child: Stack(
            children: [
              Positioned.fill(
                child:
                    Image.asset(AppImageConst.appBackground2, fit: BoxFit.fill),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.off(() => const ProfileScreen()),
                      child: const Icon(Icons.arrow_back,
                          size: 20, color: AppColorConst.appWhite),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text('Edit Profile',
                          style: TextStyle(
                              color: AppColorConst.appWhite,
                              fontSize: 22,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 5),
                    const Center(child: CircleAvatar(radius: 40)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 60, left: 25, right: 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTextField(nameController, 'Name...',
                          Icons.account_box_outlined),
                      const SizedBox(height: 20),
                      _buildTextField(
                          userNameController, 'Username...', Icons.person),
                      const SizedBox(height: 20),
                      _buildTextField(bioController, 'Bio...', Icons.info),
                      const SizedBox(height: 20),
                      _buildTextField(
                          linkController, 'Add links...', Icons.link),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColorConst.appDarkBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              homeController.editProfile(
                                name: nameController.text,
                                username: userNameController.text,
                                bio: bioController.text,
                                link: linkController.text,
                              );
                            }
                          },
                          child: const Text('Edit',
                              style: TextStyle(color: AppColorConst.appWhite)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, IconData icon) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: AppColorConst.appGray, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColorConst.appGray, fontSize: 12),
        suffixIcon: Icon(icon, color: AppColorConst.appGray, size: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColorConst.appGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: AppColorConst.appBlue, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColorConst.appGray),
        ),
      ),
      validator: (value) => emptyValidation(value, 'This field is required'),
    );
  }
}

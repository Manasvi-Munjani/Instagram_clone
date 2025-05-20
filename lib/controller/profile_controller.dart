import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/models/profile_model.dart';
import 'package:uuid/uuid.dart';

class ProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  Future<void> saveProfileData({String? existingProfileId}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Fluttertoast.showToast(msg: "User not logged in.");
        return;
      }

      final String userId = user.uid;
      final String profileId = existingProfileId ?? const Uuid().v4();

      final profile = ProfileModel(
        userid: userId,
        id: profileId,
        username: nameController.text.trim(),
        bio: bioController.text.trim(),
        links: linkController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('profile')
          .doc(profileId)
          .set(profile.toMap());

      Fluttertoast.showToast(msg: 'Profile saved successfully.');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to save profile.');
      log('Error saving profile -> $e');
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    bioController.dispose();
    linkController.dispose();
    super.onClose();
  }
}

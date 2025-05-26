import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/constant/appimage_const.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/widgets/cloudinary_image.dart';

class HomeController extends GetxController {
  var obscureText = true.obs;
  final formkey = GlobalKey<FormState>();
  final RxList<Map<String, dynamic>> postList = <Map<String, dynamic>>[].obs;
  final FocusNode focusNode = FocusNode();
  var isFocused = false.obs;
  var selected = 0.obs;
  var isFavorite = false.obs;
  var isSave = false.obs;
  var isDataSet = false.obs;
  final picker = ImagePicker();
  var userModel = Rxn<UserModel>();
  final RxString tempProfileImage = ''.obs;

  // Rxn<UserModel> userModel = Rxn<UserModel>();

// ======================== Selected Icons -> BottomNavigation Screen ========================

  void selectIcon(int index) {
    selected.value = index;
  }

// ======================== Favorite Icon ========================

  void favoriteIcon() {
    isFavorite.value = !isFavorite.value;
  }

// ======================== Save Icon ========================

  void saveData() {
    isSave.value = !isSave.value;
  }

// ======================== Password Icon ========================

  void show() {
    obscureText.value = !obscureText.value;
  }

// ======================== Timer -> Splash screen ========================

  void timer() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const HomeScreen());
    });
  }

// ======================== Post Data -> Home screen ========================

  @override
  void onInit() {
    postList.assignAll([
      {
        'username': 'marvel',
        'userImage': AppImageConst.appPostDp,
        'postImage': AppImageConst.appPost,
        'caption':
            "marvel We can’t get enough of this dynamic duo. Marvel Studios' @HawkeyeOfficial is...",
        'likes': '105,762 likes',
        'timeAgo': '13 hours ago',
        'focusNode': FocusNode(),
        'isFocused': false.obs,
      },
      {
        'username': 'Beauty_of_Nature',
        'userImage': AppImageConst.appPostDp,
        'postImage': AppImageConst.appNature,
        'caption':
            "marvel We can’t get enough of this dynamic duo. Marvel Studios' @HawkeyeOfficial is...",
        'likes': '105,762 likes',
        'timeAgo': '13 hours ago',
        'focusNode': FocusNode(),
        'isFocused': false.obs,
      },
    ]);

    for (var post in postList) {
      final focusNode = post['focusNode'] as FocusNode;
      final isFocused = post['isFocused'] as RxBool;

      focusNode.addListener(() {
        isFocused.value = focusNode.hasFocus;
      });
    }

    fetchProfileData();
    // loadUserData();
    super.onInit();
  }

//========================= Profile Screen User ==================

/*
  void loadUserData() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      userModel.value = UserModel(
          userid: currentUser.uid,
          username: currentUser.displayName ?? '',
          email: currentUser.email ?? '');
    }
  }
*/

// ======================== SignIn Button ========================

  void SignInButton(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        debugPrint('Signed in as :${user.email}');
      }
      Get.to(() => SplashScreen());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else {
        errorMessage = e.message ?? 'An unknown error occurred.';
      }
      Fluttertoast.showToast(msg: errorMessage);
      log('Error -> $e');
      return;
    }
  }

// ======================== SignUp Button ========================

  void signupButton(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(name);

      DateTime currentTime = DateTime.now();
      await addUserDetail(
        userCredential.user!.uid,
        name,
        email,
        currentTime,
      );

      Get.off(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'The email is already in use.';
          break;
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        default:
          errorMessage = e.message ?? 'An unknown error occurred.';
          break;
      }
      Fluttertoast.showToast(msg: errorMessage);
    } catch (e) {
      Fluttertoast.showToast(msg: 'An error occurred: $e');
    }
  }

  addUserDetail(
    String userId,
    String username,
    String email,
    DateTime time,
  ) async {
    try {
      UserModel user = UserModel(
        userid: userId,
        username: username,
        email: email,
        time: time,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user.toMap());
      debugPrint("Current user UID: ${FirebaseAuth.instance.currentUser?.uid}");
    } catch (e) {
      debugPrint("Error saving user data: $e");
      Fluttertoast.showToast(msg: "Firestore error: $e");
    }
  }

// =========================== Fetch profile Data =================================

  Future<void> fetchProfileData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userdoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userdoc.exists) {
      userModel.value = UserModel(
        userid: userdoc['userid'],
        username: userdoc['username'],
        email: userdoc['email'],
        bio: userdoc['bio'],
        link: userdoc['link'],
        image: userdoc['image'],
      );
    }
  }
}

/*
  Future<void> fetchProfileData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userdoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userdoc.exists) {
      userModel.value = UserModel(
          userid: userdoc['userid'],
          username: userdoc['username'],
          email: userdoc['email']);
    }
  }

  Future<void> fetchProfileData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (snapshot.exists) {
      userModel.value = UserModel.fromMap(snapshot.data()!);
    }
  }*/

// =========================== Update profile Data =================================

Future<void> editProfile({
  required String name,
  required String username,
  String? image,
  String? bio,
  String? link,
}) async {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    Map<String, dynamic> updateData = {
      'name': name,
      'username': username,
      'image': image,
      'bio': bio ?? '',
      'link': link ?? '',
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update(updateData);

    Fluttertoast.showToast(msg: 'Profile updated successfully!');
    // await fetchProfileData();

    Get.off(() => const ProfileScreen());
  } catch (e) {
    Fluttertoast.showToast(msg: 'Error: $e');
  }
}

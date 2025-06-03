import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/posts_model.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/splash_screen.dart';
import 'package:http/http.dart' as http;

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
  var allPosts = <PostsModel>[].obs;

//============================ Post Image ======================

  final Rx<XFile?> pickedImage = Rx<XFile?>(null);
  Uint8List? webImage;
  File? fileImage;
  final ImagePicker _picker = ImagePicker();
  final RxString uploadedImageUrl = ''.obs;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = image;

      if (kIsWeb) {
        webImage = await image.readAsBytes();
      } else {
        fileImage = File(image.path);
      }
      update();
    }
  }

// ======================= Cloudinary Post image =======================

  String cloudName = 'dgu8vmtqi';
  String uploadPreset = 'flutter_unsigned';

  Future<void> uploadImageToCloudinary({
    required String caption,
    required String description,
  }) async {
    try {
      if (pickedImage.value == null) {
        Fluttertoast.showToast(msg: 'Please select an image first.');
        return;
      }

      final imageBytes =
          kIsWeb ? webImage : await pickedImage.value!.readAsBytes();

      final uri =
          Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');

      final request = http.MultipartRequest('POST', uri)
        ..fields['upload_preset'] = uploadPreset
        ..files.add(http.MultipartFile.fromBytes(
          'file',
          imageBytes!,
          filename: pickedImage.value!.name,
        ));

      final response = await request.send();

      if (response.statusCode == 200) {
        final resStr = await response.stream.bytesToString();
        final data = jsonDecode(resStr);

        uploadedImageUrl.value = data['secure_url'];
        debugPrint(uploadedImageUrl.value);

        postData(
          caption: caption,
          description: description,
          image: uploadedImageUrl.value,
        );

        Fluttertoast.showToast(msg: 'Post uploaded successfully!');
      } else {
        Fluttertoast.showToast(msg: 'Cloudinary upload failed');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Upload Error: $e');
    }
  }

// ======================== Selected Icons -> BottomNavigation Screen ========================

  void selectIcon(int index) {
    selected.value = index;
  }

// ======================== Favorite Icon ========================

  /*void favoriteIcon(Map<String, dynamic> post) {
    post['isFavorite'].value = !post['isFavorite'].value;
  }*/

  void favoriteIcon() {
    isFavorite.value = !isFavorite.value;
  }

// ======================== Save Icon ========================

  /*void saveData(Map<String, dynamic> post) {
    post['isSaved'].value = !post['isSaved'].value;
  }*/

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
    fetchProfileData();
    fetchUploadedPosts();
    fetchAllUsers();
    fetchUsersPosts();
    super.onInit();
  }

// ============================= Story Fetch All users ===================================

  RxList<Map<String, dynamic>> allUsers = <Map<String, dynamic>>[].obs;

  void fetchAllUsers() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    allUsers.value = snapshot.docs.map((doc) => doc.data()).toList();
  }

// ============================= Post Fetch All users ===================================

  Future<void> fetchUsersPosts() async {
    final usersSnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    final List<Map<String, dynamic>> userPosts = [];

    for (final userDoc in usersSnapshot.docs) {
      final userData = userDoc.data();
      final uid = userDoc.id;

      final userPostsSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('posts')
          .get();

      for (final postDoc in userPostsSnapshot.docs) {
        final postData = postDoc.data();
        final postId = postDoc.id;

        final isLiked = await isPostLiked(postOwnerId: uid, postId: postId);
        final likeCount = await getLikesCount(uid, postId);

        userPosts.add({
          'postId': postId,
          'username': userData['username'] ?? '',
          'userImage': userData['image'] ?? '',
          'postImage': postData['image'] ?? '',
          'caption': postData['caption'] ?? '',
          'description': postData['description'] ?? '',
          // 'likes': "0 likes" ?? '',
          'likes': "$likeCount likes",
          'timeAgo': postData['time'] ?? '',
          'focusNode': FocusNode(),
          'isFocused': false.obs,
          'isFavorite': false.obs,
          'postOwnerId': uid,
        });
      }
    }

    postList.assignAll(userPosts);

    for (var post in postList) {
      final focusNode = post['focusNode'] as FocusNode;
      final isFocused = post['isFocused'] as RxBool;
      focusNode.addListener(() {
        isFocused.value = focusNode.hasFocus;
      });
    }
  }

//====================== Post Collection ==========================

  // final RxList<String> uploadedPostImages = <String>[].obs;
  final RxList<PostsModel> uploadedPostImages = <PostsModel>[].obs;

  void postData({
    required String caption,
    required String description,
    required String image,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        debugPrint('User not logged in');
        return;
      }

      final userId = user.uid;

      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('posts')
          .doc();

      final post = PostsModel(
        userid: userId,
        caption: caption,
        description: description,
        image: image,
        time: DateTime.now(),
        postId: docRef.id,
      );

      await docRef.set(post.toMap());

      // uploadedPostImages.add(image);
      uploadedPostImages.add(post);

      debugPrint('Post uploaded successfully! Doc ID: ${docRef.id}');
    } catch (e) {
      debugPrint('Failed to upload post: $e');
    }
  }

  Future<void> fetchUploadedPosts() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('posts')
          .get();

      uploadedPostImages.clear();

      /*for (var doc in snapshot.docs) {
      uploadedPostImages.add(doc['image']);
    }*/

      for (var doc in snapshot.docs) {
        debugPrint("Fetched Post: ${doc.data()}");

        uploadedPostImages.add(PostsModel.fromMap(doc.data()));
      }
    } catch (e) {
      debugPrint('Error:$e');
    }
  }

// ======================== Delete Post ========================

  void deletePost(String postId) {
    try {
      debugPrint('Deleting post with ID: $postId');

      if (postId.isEmpty) {
        Fluttertoast.showToast(msg: 'Post ID is empty!');
        return;
      }

      final userId = FirebaseAuth.instance.currentUser!.uid;

      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('posts')
          .doc(postId)
          .delete();
      allPosts.removeWhere((post) => post.postId == postId);

      Fluttertoast.showToast(msg: 'Post deleted successfully');
      update();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      debugPrint('Error : ${e.toString()}');
    }
  }

// ======================== Favorite Data =======================

  void likesData({
    required String postOwnerId,
    required String postId,
    required Map<String, dynamic> postData,
  }) async {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    final likeDocRef = FirebaseFirestore.instance
        .collection('users')
        .doc(postOwnerId)
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(currentUserId);

    final likeDoc = await likeDocRef.get();

    if (likeDoc.exists) {
      await likeDocRef.delete();
      isFavorite.value = false;
    } else {
      await likeDocRef.set({
        'postId': postId,
        'image': postData['postImage'] ?? '',
        'caption': postData['caption'] ?? '',
        'description': postData['description'] ?? '',
        'likes': postData['likes'],
        'likedAt': Timestamp.now()
      });
      isFavorite.value = true;
    }
  }

// ============================= Get Likes Data ===============================

  /*void likesData({
  required String postOwnerId,
  required String postId,
  required Map<String, dynamic> postData,
}) async {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final likesRef = FirebaseFirestore.instance
      .collection('users')
      .doc(postOwnerId)
      .collection('posts')
      .doc(postId)
      .collection('likes')
      .doc(userId);

  final doc = await likesRef.get();

  if (doc.exists) {
    // Unlike
    await likesRef.delete();
  } else {
    // Like
    await likesRef.set({'likedAt': FieldValue.serverTimestamp()});
  }
}
*/

  Future<bool> isPostLiked({
    required String postOwnerId,
    required String postId,
    required Map<String, dynamic> postData,
  }) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final likeDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(postOwnerId)
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userId);
        // .get();

    // return likeDoc.exists;


    final doc = await likeDoc.get();

    if (doc.exists) {
      // Unlike
      await likeDoc.delete();
    } else {
      // Like
      await likeDoc.set({'likedAt': FieldValue.serverTimestamp()});
    }
  }

  Future<int> getLikesCount(String postOwnerId, String postId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(postOwnerId)
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .get();

    return snapshot.docs.length;
  }

// ======================== SignIn Button ========================

  void signInButton(String email, String password) async {
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
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      DocumentSnapshot userdoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userdoc.exists) {
        userModel.value = UserModel(
            userid: userdoc['userid'],
            username: userdoc['username'],
            email: userdoc['email']);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  /* Future<void> fetchProfileData() async {
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
      await fetchProfileData();

      Get.off(() => const ProfileScreen());
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: $e');
    }
  }
}

//====================== ON LIKES SCREEN =====================

/*
RxMap<String, bool> likedPosts = <String, bool>{}.obs;

Future<void> checkIfLiked(String postOwnerId, String postId) async {
  final doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(postOwnerId)
      .collection('posts')
      .doc(postId)
      .collection('likes')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();

  likedPosts[postId] = doc.exists;
}
*/

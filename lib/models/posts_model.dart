import 'package:cloud_firestore/cloud_firestore.dart';

class PostsModel {
  final String userid;
  final String postId;
  final String? caption;
  final String? description;
  final String image;
  final DateTime? time;

  PostsModel({
    required this.userid,
    required this.postId,
    this.caption,
    this.description,
    required this.image,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'postId': postId,
      'caption': caption,
      'description': description,
      'image': image,
      'time': time,
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      userid: map['userid'] ?? '',
      caption: map['caption'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      time: map['time'] != null && map['time'] is Timestamp
          ? (map['time'] as Timestamp).toDate()
          : null,
      postId: map['postId'] ?? '',
    );
  }
}

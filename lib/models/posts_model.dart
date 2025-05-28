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
      'time': time?.toIso8601String(),
    };
  }
}

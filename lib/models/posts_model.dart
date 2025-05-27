class PostsModel {
  final String userid;
  final String? caption;
  final String? description;
  final String image;
  final DateTime? time;

  PostsModel({
    required this.userid,
    this.caption,
    this.description,
    required this.image,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'caption': caption,
      'description': description,
      'image': image,
      'time': time?.toIso8601String(),
    };
  }
}

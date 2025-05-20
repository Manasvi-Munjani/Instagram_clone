class ProfileModel {
  String? userid;
  String id;
  String username;
  String? bio;
  String? links;
  String profileImage;

  ProfileModel({
    this.userid,
    required this.id,
    required this.username,
    this.bio,
    this.links,
    required this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'bio': bio,
      'links': links,
      'profileImage':profileImage,
    };
  }
}

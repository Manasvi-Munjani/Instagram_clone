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


/*class UserModel {
  final String userid;
  final String username;
  final String email;
  final String? name;
  final String? bio;
  final String? link;
  final DateTime? time;

  UserModel({
    required this.userid,
    required this.username,
    required this.email,
    this.name,
    this.bio,
    this.link,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'username': username,
      'email': email,
      'name': name ?? '',
      'bio': bio ?? '',
      'link': link ?? '',
      'time': time?.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userid: map['userid'],
      username: map['username'],
      email: map['email'],
      name: map['name'],
      bio: map['bio'],
      link: map['link'],
      time: map['time'] != null ? DateTime.parse(map['time']) : null,
    );
  }
}
*/
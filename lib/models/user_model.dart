class UserModel {
  String userid;
  String username;
  String email;
  DateTime? time;

  UserModel({
    required this.userid,
    required this.username,
    required this.email,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'username': username,
      'email': email,
      'time': time,
    };
  }
}

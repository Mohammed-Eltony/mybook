class User {
  int? userId;
  String? userName;

  User({this.userId, this.userName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
    );
  }
}

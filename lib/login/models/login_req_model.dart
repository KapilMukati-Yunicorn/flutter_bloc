class LoginReqModel {
  final String username;
  final String password;

  LoginReqModel({
    required this.username,
    required this.password,
  });

  // JSON se Dart object me convert
  factory LoginReqModel.fromJson(Map<String, dynamic> json) {
    return LoginReqModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  // Dart object se JSON me convert
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

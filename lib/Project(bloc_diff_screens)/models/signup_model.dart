class LoginModel {
  String? usename;
  String? email;
  int? password;

  LoginModel({this.usename, this.email, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    usename = json['usename'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usename'] = this.usename;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

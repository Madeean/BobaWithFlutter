class UserLoginModel {
  late int? id;
  late String? name;
  late String? email;
  late String? role;
  late String? token;

  UserLoginModel({
    this.id,
    this.name,
    this.email,
    this.role,
    this.token,
  });

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'token': token,
    };
  }
}

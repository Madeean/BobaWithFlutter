class GetUserModel {
  late int? id;
  late String? name;
  late String? email;
  late String? role;

  GetUserModel({
    this.id,
    this.name,
    this.email,
    this.role,
  });

  GetUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
    };
  }
}

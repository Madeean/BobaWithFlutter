class UserRegisterModel {
  late int? id;
  late String? name;
  late String? email;

  UserRegisterModel({
    this.id,
    this.name,
    this.email,
  });

  UserRegisterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}

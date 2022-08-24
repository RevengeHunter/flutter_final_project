class UserModel {
  UserModel({
    this.id,
    required this.role,
    required this.email,
    required this.fullname,
    required this.active,
  });

  String? id;
  String role;
  String email;
  String fullname;
  bool active;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    role: json["role"],
    email: json["email"],
    fullname: json["fullname"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "email": email,
    "fullname": fullname,
    "active": active,
  };
}
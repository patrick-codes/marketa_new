class UserModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String token;
  final String role;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.token,
     this.role = 'buyer',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'].toString(), // MongoDB _id comes as string
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      token: json['token'] ?? '',
      role:json['role']??'',
    );
  }
}

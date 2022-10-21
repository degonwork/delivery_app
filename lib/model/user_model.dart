class UserModel {
  final String? id;
  final String? email;
  final String? name;
  final String? pic;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.pic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        pic: json['pic'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'pic': pic,
      };
}

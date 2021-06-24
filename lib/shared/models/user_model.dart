import 'dart:convert';

class UserModel {
  final String name;
  final String? photoURL;

  UserModel({required this.name, this.photoURL});

  // converter map em objeto
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photoURL: map['photoURL']);
  }

  // converter json em objeto
  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  // converter objeto em map = key pair do dart (?)
  Map<String, dynamic> toMap() => {"name": name, "photoURL": photoURL};

  // converter objeto em json (string)
  String toJson() => jsonEncode(toMap());
}

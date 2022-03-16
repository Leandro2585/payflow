import 'dart:convert';

class UserModel {
  final String name;
  final String? avatar;

  UserModel({ required this.name, this.avatar });

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(name: map['name'], avatar: map['avatar']);
  }

  factory UserModel.fromJson(String json) => UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
    'name': name,
    'avatar': avatar,
  };

  String parseJson() => jsonEncode(toMap());

  
}

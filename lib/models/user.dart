import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String address;
  final String password;
  final String type;
  final String token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.password,
      required this.type,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'address': this.address,
      'password': this.password,
      'type': this.type,
      'token': this.token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      password: map['password'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
    );
  }

  String toJson()  =>   json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));




}

import 'package:TODO/features/signUp/domain/entities/user.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends User {
  final String email;
  final String id;

  UserModel({
    @required this.email,
        this.id,
      }) 
      : super(email: email, id: id);

        factory UserModel.fromJson(Map<String, dynamic> json) {
        return UserModel(
          email: json['email'],
          id: json['uid'],
        );
      }

  Map<String, dynamic> toJson() {
    return {'email': email, 'id': id};
  }
}
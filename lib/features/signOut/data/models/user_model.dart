import 'package:TODO/features/signOut/domain/entities/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends Users {
  UserModel({String email}) : super(email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email']);
  }

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    return UserModel(
      email: documentSnapshot.data()['email']
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "email": email,
    };
  }
}

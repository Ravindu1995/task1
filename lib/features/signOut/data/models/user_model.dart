import 'package:TODO/features/signOut/domain/entities/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends Users {
  UserModel({String uid}) : super(uid);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(uid: json['uid']);
  }

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    return UserModel(
      uid: documentSnapshot.data()['uid']
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
    };
  }
}

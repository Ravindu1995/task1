import 'package:TODO/features/signUp/domain/entities/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel extends User {
       UserModel({ String uID, String name, String email, String password}): super( uID, name, email, password);

        factory UserModel.fromJson(Map<String,dynamic> json){
          return UserModel(
            uID: json['uid'],
            name: json['name'],
            email: json['email'],
            password: json['password']
          );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    return UserModel(
      uID: documentSnapshot.data()['uid'],
      name: documentSnapshot.data()['name'],
      email: documentSnapshot.data()['email'],
      password: documentSnapshot.data()['password'],
    );
  }
  Map<String,dynamic> toDocument(){
    return {
      'uid': uID,
      "name":name,
      "email":email,
      "password":password,
    };
  }
}
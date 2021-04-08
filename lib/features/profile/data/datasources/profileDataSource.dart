import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/profile/data/models/user_model.dart';
import 'package:TODO/features/profile/domain/entities/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class ProfileDataSource {
  Stream<List<UserModel>> getUser();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  ProfileDataSourceImpl({@required this.firestore , @required this.firebaseAuth})
      : assert(firestore != null, 'this datasource cant be null');

  

  @override
  Stream<List<UserModel>> getUser() {
    try {
      return firestore.collection('users').doc(firebaseAuth.).get().
      //return res.data.map((e) => UserModel.fromMap(e.data()));
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }
}

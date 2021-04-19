import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/profile/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


abstract class ProfileDataSource {
  Stream<UserModel> getUsers();
  Future<void> updateUser(String name);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  //final Uuid uuid;

  ProfileDataSourceImpl({@required this.firestore, @required this.firebaseAuth})
      : assert(firestore != null, 'this datasource cant be null');

  @override
  Stream<UserModel> getUsers() {
    return firestore.collection('users').doc(firebaseAuth.currentUser.uid).snapshots().
    map((abc) => UserModel.fromMap(abc.data()));
  }

  @override
  Future<void> updateUser(String name) async{
   try {
      //final uid = uuid.v1();
      return await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser.uid)
          .update({ 'name': name});
          
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }


  }


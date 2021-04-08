import 'package:TODO/core/error/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

abstract class SignUpDataSource {
  Future<String> signUp(String name, String email, String password);
}

class SignUpDataSourceImpl implements SignUpDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final Uuid uuid;

  SignUpDataSourceImpl(
      {@required this.firebaseAuth,  this.uuid,  @required this.firebaseFirestore})
      : assert(firebaseAuth != null, 'Firebase authentication cannot be null');

  @override
  Future<String> signUp(String name, String email, String password) async {
    try {
      //final uid = uuid.v1();
      final res = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (res.user != null) {
        await firebaseFirestore.collection('users').doc(res.user.uid).set({
          'email': email,
          'name': name,
        });
        return 'signed up Successfully';
      }
      ///!
      throw Exception('Cannot Signup at the time');
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}

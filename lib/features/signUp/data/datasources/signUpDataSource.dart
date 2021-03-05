import 'package:TODO/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class SignUpDataSource {
  Future<String> signUp(String name, String email, String password);
}

class SignUpDataSourceImpl implements SignUpDataSource {
  final FirebaseAuth firebaseAuth;

  SignUpDataSourceImpl({@required this.firebaseAuth}): assert(firebaseAuth != null, 'Firebase authentication cannot be null');

  @override
  Future<String> signUp(String name, String email, String password) async {
    try {
      final res = await firebaseAuth.signUp(
          name: name, email: email, password: password);
      if (res.user != null) {
        return 'signed up Successfully';
      }
      throw AuthException(message: 'Cannot Signup at the time');
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}

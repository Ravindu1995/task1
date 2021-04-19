import 'package:TODO/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class SignOutDataSource {
  Future<void> signOut();
}

class SignOutDataSourceImpl implements SignOutDataSource {
  final FirebaseAuth firebaseAuth;

  SignOutDataSourceImpl({@required this.firebaseAuth})
      : assert(firebaseAuth != null, 'Firebase authentication cannot be null');

  @override
  Future<void> signOut() async {
    try {
      return await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}

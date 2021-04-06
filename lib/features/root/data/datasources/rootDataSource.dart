import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class RootDataSource {
  Future<bool> isUserLoggedIn();
  Stream<User> get authStateChange;
}

class RootDataSourceImpl implements RootDataSource {
  final FirebaseAuth firebaseAuth;

  RootDataSourceImpl({@required this.firebaseAuth})
      : assert(firebaseAuth != null, 'Firebase authentication cannot be null');

  

  @override
  // TODO: implement authStateChange
  Stream<User> get authStateChange => firebaseAuth.authStateChanges();

  @override
  Future<bool> isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }
}

import 'package:firebase_auth/firebase_auth.dart';

abstract class RootRepository {
  Future<bool> isUserLoggedIn();
  Stream<User> get authStateChange;
}

import 'package:TODO/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class LoginDataSource {
  Future<String> login(String email, String password);
  //Stream<List<UserModel>> getUsers();
}

// class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Future<void> login(String email, String password) async {
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//   }

// }
class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth firebaseAuth;
  LoginDataSourceImpl({
    @required this.firebaseAuth,
  }) : assert(firebaseAuth != null, 'Firebase authentication cannot be null');
  @override
  Future<String> login(String email, String password) async {
    try {
      final res = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (res.user != null) {
        return 'Logged in Successfully';
      }
      throw AuthException(message: 'Cannot login at the time');
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}

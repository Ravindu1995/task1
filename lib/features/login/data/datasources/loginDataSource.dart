import 'package:TODO/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class LoginDataSource {
  Future<String> login(String email, String password);
  //Future<void> isUserLoggedIn();
  //Stream<List<UserModel>> getUsers();
}


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

  // @override
  // Future<void> isUserLoggedIn() async{
  //   // TODO: implement isUserLoggedIn
  //   final user = await firebaseAuth.currentUser();
  //   return user != null;
  // }

  
}

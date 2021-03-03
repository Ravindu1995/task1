import 'package:TODO/features/login/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseRemoteDataSource {
  Future<void> login(String email, String password);
  //Stream<List<UserModel>> getUsers();
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

        

}

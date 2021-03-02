import 'package:TODO/features/login/data/models/user_model.dart';

abstract class FirebaseRemoteDataSource {
  Future<void> login(String email, String password);
  Stream<List<UserModel>> getUsers();
}

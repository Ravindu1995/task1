import 'package:TODO/features/login/domain/entities/users.dart';

abstract class FireBaseRepository {
  Future<void> login(String email, String password);
  Stream<List<Users>> getUsers();
}

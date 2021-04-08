import 'package:TODO/features/profile/domain/entities/users.dart';


abstract class ProfileRepository {
  Stream<List<User>> getUsers();
}

import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/profile/domain/entities/users.dart';
import 'package:dartz/dartz.dart';


abstract class ProfileRepository {
  Stream<UserEntity> getUsers();
  Future<Either<Failure, void>> updateUser(String name);
}

import 'package:TODO/core/error/failures.dart';

import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, String>> getUsers(String uID);
}

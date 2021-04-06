import 'package:TODO/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SignOutRepository {
  Future<Either<Failure , void>> signout();
}

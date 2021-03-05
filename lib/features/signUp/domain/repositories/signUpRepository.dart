import 'package:TODO/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepository {
  Future<Either<Failure, String>> signUp(String name, String email, String password);
}

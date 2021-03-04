import 'package:TODO/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(String email, String password);
}

import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/signUp/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {


    Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {String email, String password});
}

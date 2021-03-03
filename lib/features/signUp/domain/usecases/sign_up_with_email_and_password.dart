import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/signUp/domain/entities/user.dart';
import 'package:TODO/features/signUp/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpWithEmailAndPassword {
  final AuthRepository authRepository;

  SignUpWithEmailAndPassword({this.authRepository});

    Future<Either<Failure, User>> call({String email, String password}) {
    return authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

}

import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/signUp/data/datasources/signUpDataSource.dart';
import 'package:TODO/features/signUp/domain/repositories/signUpRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource signUpDataSource;

  SignUpRepositoryImpl({@required this.signUpDataSource})
      : assert(signUpDataSource != null, 'Data source cannot be null');

  @override
  Future<Either<Failure, String>> signUp(
      String name, String email, String password) async {
    try {
      return Right(await signUpDataSource.signUp(name, email, password));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  // @override
  // Future<Either<Failure, String>> signUp(
  //     String name, String email, String password) async {

  // }
}

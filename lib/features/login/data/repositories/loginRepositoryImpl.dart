import 'package:TODO/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/login/data/datasources/loginDataSource.dart';
import 'package:TODO/features/login/domain/repositories/firebase_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class LoginReposiyoryImpl implements LoginRepository {
  final LoginDataSource dataSource;
  LoginReposiyoryImpl({
    @required this.dataSource,
  }) : assert(dataSource != null, 'Data source cannot be null');
  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      return Right(await dataSource.login(email, password));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }
}

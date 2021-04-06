import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/signOut/data/datasources/signOutDataSource.dart';
import 'package:TODO/features/signOut/domain/repositories/signOutRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SignOutRepositoryImpl implements SignOutRepository {
  final SignOutDataSource signOutDataSource;

  SignOutRepositoryImpl({@required this.signOutDataSource})
      : assert(signOutDataSource != null, 'Data source cannot be null');

  @override
  Future<Either<Failure, void>> signout() async {
    try {
      return Right(await signOutDataSource.signOut());
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }
}

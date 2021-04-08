import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/profile/data/datasources/profileDataSource.dart';
import 'package:TODO/features/profile/domain/entities/users.dart';
import 'package:TODO/features/profile/domain/repositories/profileRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource profileDataSource;

  ProfileRepositoryImpl({@required this.profileDataSource})
  : assert((profileDataSource) != null, 'Data source cannot be null');

  @override
  Stream<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

 
}

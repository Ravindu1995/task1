import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/profile/domain/entities/users.dart';
import 'package:TODO/features/profile/domain/usecases/profileUsecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ProfileModel extends StreamViewModel<List<User>> {
  final ProfileUsecase usecase;

  ProfileModel({@required this.usecase}): assert(usecase != null, ' usecase cannot be null');

  List<User> get users => data;
  @override
  // TODO: implement stream
  Stream<List<User>> get stream => usecase(NoParams());
}

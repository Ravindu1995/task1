import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/profile/domain/entities/users.dart';
import 'package:TODO/features/profile/domain/usecases/UpdateProUsecase.dart' as updateprousecase;
import 'package:TODO/features/profile/domain/usecases/profileUsecase.dart'
    as prousecase;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ProfileModel extends StreamViewModel<UserEntity> {
  final prousecase.ProfileUsecase usecase;
  final updateprousecase.UpdateProUsecase proUsecase;

  ProfileModel({@required this.usecase ,@required this.proUsecase})
      : assert(usecase != null, ' usecase cannot be null');

  final TextEditingController nameController = TextEditingController();

  UserEntity get users => data;
  @override
  // TODO: implement stream
  Stream<UserEntity> get stream => usecase(NoParams());

  Future<void> updateUser() async {
    final res = await proUsecase(updateprousecase.Params(
        name: nameController.text));
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', 'Updated User');
    });
  }
}

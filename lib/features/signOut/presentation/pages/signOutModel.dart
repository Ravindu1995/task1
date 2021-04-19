import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/login/presentation/pages/loginView.dart';
import 'package:TODO/features/signOut/domain/usecases/signOutUsecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class SignOutModel extends BaseViewModel {
  final SignOutUsecase usecase;

  SignOutModel({@required this.usecase})
      : assert(usecase != null, 'SignOut usecase cannot be null');

  Future<void> signOut() async {
    final res = await usecase(NoParams());
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', 'Signed Out');
      Get.to(()=>LoginPage());
    });
  }
}

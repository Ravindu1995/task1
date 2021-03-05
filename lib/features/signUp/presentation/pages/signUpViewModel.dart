import 'package:TODO/features/signUp/domain/usecases/signUpUsecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  final SignUpUsecase signUpUsecase;

  SignUpViewModel({@required this.signUpUsecase})
      : assert(signUpUsecase != null, 'Login usecase cannot be null');

  Future<void> signUp() async {
    final res = await signUpUsecase(
        Params(name: '',email: '', password: ''));
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', r);
    });
  }
}

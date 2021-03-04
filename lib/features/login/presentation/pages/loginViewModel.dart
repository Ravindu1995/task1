import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import 'package:TODO/features/login/domain/usecases/login_usecase.dart';

class LoginViewModel extends BaseViewModel {
  final LoginUseCase loginUseCase;
  LoginViewModel({
    @required this.loginUseCase,
  }) : assert(loginUseCase != null, 'Login usecase cannot be null');

  Future<void> login() async {
    final res = await loginUseCase(
        Params(email: 'ravindutharaka2013@gmail.com', password: 'ravindu@123'));
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', r);
    });
  }
}

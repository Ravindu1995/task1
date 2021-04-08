
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import 'package:TODO/features/login/domain/usecases/login_usecase.dart';

class LoginViewModel extends BaseViewModel {
  final LoginUseCase loginUseCase;
  //final FirebaseAuth firebaseAuth;
  String _selectedRole = 'Select a User Role';
  String get selectedRole => _selectedRole;

  void setSelectedRole(String role) {
    _selectedRole = role;
    notifyListeners();
  }

  LoginViewModel({
    @required this.loginUseCase,
  }) : assert(loginUseCase != null, 'Login usecase cannot be null');

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final res = await loginUseCase(
        Params(email: emailController.text , password: passwordController.text));
    res.fold((l) {
      Get.snackbar('Error', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', r);
    });
  }
}

 // @override
  // TODO: implement streamsMap
  // Map<String, StreamData> get streamsMap => throw UnimplementedError();

  // Future handleStartUpLogic() async {
  //   var hasLoggedInUser = await firebaseAuth.isUserLoggedIn();

  //   if (hasLoggedInUser) {
  //     _navigationService.navigateTo(HomeViewRoute);
  //   } else {
  //     _navigationService.navigateTo(LoginViewRoute);
  //   }
  // }


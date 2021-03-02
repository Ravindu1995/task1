import 'package:TODO/features/login/domain/repositories/firebase_repository.dart';

class LoginUseCase{
  final FireBaseRepository repository;

  LoginUseCase({this.repository});

  Future<void> call(String email,String password){
    return repository.login(email, password);
  }

}
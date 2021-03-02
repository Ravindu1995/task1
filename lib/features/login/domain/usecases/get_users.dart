import 'package:TODO/features/login/domain/entities/users.dart';
import 'package:TODO/features/login/domain/repositories/firebase_repository.dart';

class GetUsersUseCase {
  final FireBaseRepository repository;

  GetUsersUseCase({this.repository});

  Stream<List<Users>> call() => repository.getUsers();


}
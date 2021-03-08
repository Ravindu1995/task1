import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class UpdateToDoUsecase extends UseCase<void, ToDoList> {
  final ToDoRepository toDoRepository;

  UpdateToDoUsecase({@required this.toDoRepository})
      : assert(toDoRepository != null, 'Repository can not be null');

  @override
  Future<Either<Failure, String>> call(ToDoList params) {
    return toDoRepository.updateTask(params);
  }
}

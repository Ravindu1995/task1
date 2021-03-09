import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class DeleteToDoUsecase implements UseCase<bool, String>{
  final ToDoRepository toDoRepository;

  DeleteToDoUsecase({@required this.toDoRepository}) : 
      assert(toDoRepository != null ,"this repository cant be null");
  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await toDoRepository.deleteTask(params);
  }

}
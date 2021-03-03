import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AddTodo implements UseCase<void, Params> {
  final TodoRepository todoRepository;

  AddTodo(this.todoRepository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    // TODO: implement call
    return todoRepository.addTodo(params.title);
  }
}

class Params extends Equatable {
  final String title;

  Params({@required this.title});

  @override
  // TODO: implement props
  List<Object> get props => [title];
}

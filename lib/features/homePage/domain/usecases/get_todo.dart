import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/todo.dart';
import 'package:TODO/features/homePage/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class GetTodo implements UseCase<Todo, params> {
  final TodoRepository todoRepository;

  GetTodo(this.todoRepository);

  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    return await todoRepository.getTodo(params.id);
  }
}

class Params extends Equatable {
  final int id;

  Params(this.id);

  @override
  // TODO: implement props
  List<Object> get props => [id];
  
}

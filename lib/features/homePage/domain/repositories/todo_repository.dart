import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/entities/todo.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<Failure, Todo>> getTodo(int id);
  Future<Either<Failure, Todo>> addTodo(String title);
  Future<Either<Failure, Todo>> getAllTodo();
}

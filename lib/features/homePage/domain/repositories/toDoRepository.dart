import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:dartz/dartz.dart';


abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoList>>> getToDoList(String docID);
  Future<Either<Failure, bool>> deleteTask(String docID);
  Future<Either<Failure, String>> insertTask(ToDoList toDoList);
  Future<Either<Failure, String>> updateTask(ToDoList toDoList);


}


import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:dartz/dartz.dart';


abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoList>>> getToDoList();
  Future<Either<Failure, void>> deleteTask(String docID);
  Future<Either<Failure, void>> insertTask(String title,String task);
  Future<Either<Failure, void>> updateTask(String title,String task);
  Stream<List<ToDoList>>  getListOfTodo();


}


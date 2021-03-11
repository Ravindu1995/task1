import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:dartz/dartz.dart';


abstract class ToDoRepository {
  Future<Either<Failure, String>> getToDoList(String title,String task);
  Future<Either<Failure, bool>> deleteTask(String docID);
  Future<Either<Failure, String>> insertTask(String title,String task);
  Future<Either<Failure, String>> updateTask(ToDoList toDoList);


}


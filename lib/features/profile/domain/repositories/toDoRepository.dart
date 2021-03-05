import 'package:TODO/core/error/failures.dart';
import 'package:dartz/dartz.dart';


abstract class ToDoRepository {
  Future<Either<Failure, String>> show(String title, String task);
}

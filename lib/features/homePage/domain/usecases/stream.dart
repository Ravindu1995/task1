import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:flutter/cupertino.dart';

class StreamUse extends StreamUseCase<List<ToDoList>, NoParams> {
  final ToDoRepository toDoRepository;

  StreamUse({@required this.toDoRepository})
      : assert(toDoRepository != null, 'Repository cannot be null');

  @override
  Stream<List<ToDoList>> call(NoParams params)  {
     return toDoRepository.getListOfTodo();
  }
      //Stream<List<ToDoList>>.fromFuture(Future<T> future)
}

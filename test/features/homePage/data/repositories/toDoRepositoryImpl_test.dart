import 'package:TODO/core/error/failures.dart';
//import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/data/repositories/toDoRepositoryImpl.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
//import 'package:TODO/main.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockToDoDatasources extends Mock implements ToDoDataSource {}

void main() {
  final taskList = [
    ToDoList(
       'Todo 1',
       'todo one',
    ),
  ];



  MockToDoDatasources mockToDoDatasources;
  ToDoRepositoryImpl toDoRepositoryImpl;

  setUp(() {
    mockToDoDatasources = MockToDoDatasources();
    toDoRepositoryImpl = ToDoRepositoryImpl( toDoDataSource : mockToDoDatasources);
  });
  test('should emit task list successfully ', () async {
      when(mockToDoDatasources.getTodoList())
      .thenAnswer(((_) async => taskList));
    expect(await toDoRepositoryImpl.getToDoList(),
        Right(taskList));
  });

  test('should return fail load ', () async {
      when(mockToDoDatasources.getTodoList())
      .thenAnswer(((_) async => throw Left(ServerFailure('Error'))));
    expect(await toDoRepositoryImpl.getToDoList(),
        Left(ServerFailure('Error')));
  });
    /// error not work

}

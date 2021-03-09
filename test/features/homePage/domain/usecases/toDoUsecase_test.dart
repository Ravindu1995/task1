import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockToDoRepository extends Mock implements ToDoRepository {}

void main() {

  final List<ToDoList> taskList = [
    ToDoList('',"todo", "fadf"),
    ToDoList('',"dfd", "faddfdff"),
    ToDoList('',"tdsfdfodo", "fadgddf"),
  ];

  MockToDoRepository mockToDoRepository;
  ToDoUsecase toDoUsecase;

  setUp(() {
    mockToDoRepository = MockToDoRepository();
    toDoUsecase = ToDoUsecase(toDoRepository: mockToDoRepository);
  });
  test('should return task list', () async {
    when(mockToDoRepository.getToDoList())
        .thenAnswer((realInvocation) async => Right(taskList));
    expect(await toDoUsecase(NoParams()), Right(taskList));
  });

  test('should fail return list', () async {
    when(mockToDoRepository.getToDoList())
        .thenAnswer((realInvocation) async => Left(ServerFailure('Error')));
    expect(await toDoUsecase(NoParams()), Left(ServerFailure('Error')));
  });
}

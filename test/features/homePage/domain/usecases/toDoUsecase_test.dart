import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockToDoRepository extends Mock implements ToDoRepository {}

void main() {

  // final List<ToDoList> taskList = [
  //   ToDoList('',"todo", "fadf"),
  //   ToDoList('',"dfd", "faddfdff"),
  //   ToDoList('',"tdsfdfodo", "fadgddf"),
  // ];

  MockToDoRepository mockToDoRepository;
  ToDoUsecase toDoUsecase;

  setUp(() {
    mockToDoRepository = MockToDoRepository();
    toDoUsecase = ToDoUsecase(toDoRepository: mockToDoRepository);
  });
  test('should return task list', () async {
    when(mockToDoRepository.getToDoList('abc','cde'))
        .thenAnswer((realInvocation) async => Right('Inserted'));
    expect(await toDoUsecase(Params(title: 'abc',task: 'cde')), Right('Inserted'));
  });

  test('should fail return list', () async {
    when(mockToDoRepository.getToDoList('abc','cde'))
        .thenAnswer((realInvocation) async => Left(ServerFailure('Error')));
    expect(await toDoUsecase(Params(title: 'abc',task: 'cde')), Left(ServerFailure('Error')));
  });
}

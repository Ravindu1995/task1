import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockToDoRepository extends Mock implements ToDoRepository {}

void main() {
  MockToDoRepository mockToDoRepository;
  ToDoUsecase toDoUsecase;

  setUp(() {
    mockToDoRepository = MockToDoRepository();
    toDoUsecase = ToDoUsecase(toDoRepository: mockToDoRepository);
  });
  test('should return success string from repository', () async {
    when(mockToDoRepository.show('abc', 'def'))
        .thenAnswer((realInvocation) async => Right('added'));
    expect(await toDoUsecase(Params(title: 'abc', task: 'def')),
        Right('added'));
  });
}

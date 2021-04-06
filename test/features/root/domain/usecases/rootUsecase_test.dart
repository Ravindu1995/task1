import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/root/domain/repositories/rootRepository.dart';
import 'package:TODO/features/root/domain/usecases/rootUsecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

class MockRootRepository extends Mock implements RootRepository {}

void main() {
  MockUser user;
  MockRootRepository mockrepository;
  RootUsecase usecase;

  setUp(() {
    mockrepository = MockRootRepository();
    usecase = RootUsecase(repository: mockrepository);
  });
  test('should return users', () {
    when(mockrepository.authStateChange)
        .thenAnswer((realInvocation) => Stream.fromIterable([user]));
    expect(usecase(NoParams()), emitsInOrder([user]));
  });

  test('should return empty', () {
    when(mockrepository.authStateChange)
        .thenAnswer((realInvocation) => Stream.empty());
    expect(usecase(NoParams()), emitsDone);
  });

  test('should return Error Strems', () {
    when(mockrepository.authStateChange)
        .thenAnswer((realInvocation) => Stream.error('StremErr'));
    expect(usecase(NoParams()), emitsError('StremErr'));
  });
}

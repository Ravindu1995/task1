import 'package:TODO/features/root/data/datasources/rootDataSource.dart';
import 'package:TODO/features/root/data/repositories/rootRepositoryImpl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

class MockRootDataSource extends Mock implements RootDataSource {}

void main() {
  MockRootDataSource rootDataSources;
  MockUser mockUser;
  RootRepositoryImpl repositoryImpl;

  setUp(() {
    mockUser = MockUser();
    rootDataSources = MockRootDataSource();
    repositoryImpl = RootRepositoryImpl(rootDataSource: rootDataSources);
  });

  test('Should emit user', () {
    when(rootDataSources.authStateChange)
        .thenAnswer((_) => Stream.fromIterable([mockUser]));
    expect(repositoryImpl.authStateChange , emitsInOrder([mockUser]));
  });

  test('Should return Empty', () {
    when(rootDataSources.authStateChange)
        .thenAnswer((_) => Stream.empty());
    expect(repositoryImpl.authStateChange , emitsDone);
  });

  test('Should return Error', () {
    when(rootDataSources.authStateChange)
        .thenAnswer((_) => Stream.error('ERR'));
    expect(repositoryImpl.authStateChange , emitsError('ERR'));
  });
}

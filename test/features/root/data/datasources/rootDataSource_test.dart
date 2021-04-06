

import 'package:TODO/features/root/data/datasources/rootDataSource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  RootDataSourceImpl rootDataSourceImpl;
  MockUser mockUser;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
    rootDataSourceImpl = RootDataSourceImpl(firebaseAuth: mockFirebaseAuth);
  });

  test('test should Pass when Auth State change', () {
    when(mockFirebaseAuth.authStateChanges())
        .thenAnswer((_) => Stream.fromIterable([mockUser]));

    expect(rootDataSourceImpl.authStateChange , emitsInOrder([mockUser]));
  });

  test('test should Pass for Empty', () {
    when(mockFirebaseAuth.authStateChanges())
        .thenAnswer((_) => Stream.empty());

    expect(rootDataSourceImpl.authStateChange , emitsDone);
  });

   test('test should Pass for Error', () {
    when(mockFirebaseAuth.authStateChanges())
        .thenAnswer((_) => Stream.error('Err'));

    expect(rootDataSourceImpl.authStateChange , emitsError('Err'));
  });
}

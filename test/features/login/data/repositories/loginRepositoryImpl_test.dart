import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/login/data/datasources/loginDataSource.dart';
import 'package:TODO/features/login/data/repositories/loginRepositoryImpl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginDataSource extends Mock implements LoginDataSource {}

void main() {
  LoginReposiyoryImpl loginReposiyoryImpl;
  MockLoginDataSource mockLoginDataSource;

  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    loginReposiyoryImpl = LoginReposiyoryImpl(dataSource: mockLoginDataSource);
  });

  test('should return string from dat source when success', () async {
    when(mockLoginDataSource.login('afs', 'afs'))
        .thenAnswer((realInvocation) async => 'Logged in');
    expect(await loginReposiyoryImpl.login('afs', 'afs'), Right('Logged in'));
  });

  test('should return failure when authenticationexception is thrown',
      () async {
    when(mockLoginDataSource.login('afs', 'afs')).thenAnswer(
        (realInvocation) async => throw AuthException(message: 'error'));
    expect(await loginReposiyoryImpl.login('afs', 'afs'),
        Left(AuthFailure('error')));
  });
}

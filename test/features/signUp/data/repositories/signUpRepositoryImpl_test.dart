import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/signUp/data/datasources/signUpDataSource.dart';
import 'package:TODO/features/signUp/data/repositories/signUpRepositoryImpl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MocksignUpDataSource extends Mock implements SignUpDataSource {}

void main() {
  SignUpRepositoryImpl signUpRepositoryImpl;
  MocksignUpDataSource mocksignUpDataSource;

  setUp(() {
    mocksignUpDataSource = MocksignUpDataSource();
    signUpRepositoryImpl =
        SignUpRepositoryImpl(signUpDataSource: mocksignUpDataSource);
  });
  test('should return string from dat source when success', () async {
    when(mocksignUpDataSource.signUp('afs', 'afs', 'afs'))
        .thenAnswer((realInvocation) async => 'Signed up');
    expect(await signUpRepositoryImpl.signUp('afs', 'afs', 'afs'),
        Right('Signed up'));
  });

  test('should return failure when authenticationexception is thrown',
      () async {
    when(mocksignUpDataSource.signUp('afs', 'afs', 'afs')).thenAnswer(
        (realInvocation) async => throw AuthException(message: 'error'));
    expect(await signUpRepositoryImpl.signUp('afs', 'afs', 'afs'),
        Left(AuthFailure('error')));
  });
}

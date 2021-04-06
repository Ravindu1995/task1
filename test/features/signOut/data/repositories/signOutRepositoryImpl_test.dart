import 'dart:ffi';

import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/signOut/data/datasources/signOutDataSource.dart';
import 'package:TODO/features/signOut/data/repositories/signOutRepositoryImpl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MocksignOutDataSource extends Mock implements SignOutDataSource {}

void main() {
  SignOutRepositoryImpl signOutRepositoryImpl;
  MocksignOutDataSource mocksignOutDataSource;

  setUp(() {
    mocksignOutDataSource = MocksignOutDataSource();
    signOutRepositoryImpl = SignOutRepositoryImpl(signOutDataSource : mocksignOutDataSource);
  });

  test('should Signout successfully', () async {
    when(mocksignOutDataSource.signOut())
        .thenAnswer((realInvocation) async => Void);
    expect(await signOutRepositoryImpl.signout(),
        Right(Void));
  });

  test('should fail to sign Out',
      () async {
    when(mocksignOutDataSource.signOut()).thenAnswer(
        (realInvocation) async => throw AuthException(message: 'error'));
    expect(await signOutRepositoryImpl.signout(),
        Left(AuthFailure('error')));
  });
}

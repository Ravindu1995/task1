import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/signUp/domain/repositories/signUpRepository.dart';
import 'package:TODO/features/signUp/domain/usecases/signUpUsecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSignUp extends Mock implements SignUpRepository {}

void main() {
  MockSignUp mockSignUp;
  SignUpUsecase signUpUsecase;

  setUp(() {
    mockSignUp = MockSignUp();
    signUpUsecase = SignUpUsecase(signUpRepository: mockSignUp);
  });

  test('should return success string from repository', () async {
    when(mockSignUp.signUp('afs', 'afs', 'afs'))
        .thenAnswer((realInvocation) async => Right('signed up'));
    expect(
        await signUpUsecase(Params(name: 'afs', email: 'afs', password: 'afs')),
        Right('signed up'));
  });

  test('should return auth failure from repo', () async {
    when(mockSignUp.signUp('afs', 'afs', 'afs'))
        .thenAnswer((realInvocation) async => Left(AuthFailure('Error')));
    expect(
        await signUpUsecase(Params(name: 'afs', email: 'afs', password: 'afs')),
        Left(AuthFailure('Error')));
  });
}
